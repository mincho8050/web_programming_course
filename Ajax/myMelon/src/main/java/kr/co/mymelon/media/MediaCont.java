package kr.co.mymelon.media;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class MediaCont {
	
	private MediaDAO dao=new MediaDAO();
	
	public MediaCont() {
		System.out.println("------------MediaCont()객체생성됨...");
	}//MediaCont
	
	//결과확인
	//http://localhost:8090/mymelon/media/create.do
	
	@RequestMapping(value = "/media/create.do", method = RequestMethod.GET)
	public String createForm() {
		return "media/createForm";
	}//createForm
	
	@RequestMapping(value = "/media/create.do", method = RequestMethod.POST)
	public ModelAndView createProc(MediaDTO dto, HttpServletRequest req) {
		//1)pom.xml -> 의존성 주가
		//2)MediaDTO -> posterMF, filenameMF 필드 추가 후 getter, setter 함수 생성
		//3)servlet-context.xml에 스프링빈 등록
		ModelAndView mav=new ModelAndView();
		mav.setViewName("media/msgView");
		mav.addObject("root",Utility.getRoot()); //mymelon
		//---------------------------------------------------------------------------
		// 전송된 파일 처리
		// > 실제 파일은 /media/storage폴더에 저장
		// > 저장된 파일관련 정보는 media테이블에 저장
		//파일이 저장될 실제 물리적인 경로
		String basePath=req.getRealPath("/media/storage");
		
		//1)<input type='file' name='posterMF'> 
		//파일 가져오기
		MultipartFile posterMF=dto.getPosterMF();
		//파일 저장하고 리네임된 파일명 변환
		String poster=UploadSaveManager.saveFileSpring30(posterMF, basePath);
		//리네임된 파일명 dto객체에 담기
		dto.setPoster(poster);
		
		//2)<input type='file' name='filenameMF'>
		MultipartFile filenameMF=dto.getFilenameMF();
		String filename=UploadSaveManager.saveFileSpring30(filenameMF, basePath);
		dto.setFilename(filename);
		dto.setFilesize(filenameMF.getSize());
		//---------------------------------------------------------------------------
		int cnt=dao.create(dto);
		if(cnt==0) {
			mav.addObject("msg1","<p>음원등록 실패!</p>");
			mav.addObject("img","<img src='../images/fail.png'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>");
			mav.addObject("link2","<input type='button' value='다시시도' onclikc='javascript:history.back()'>");
		}else {
			mav.addObject("msg1","<p>음원등록 성공!</p>");
			mav.addObject("img","<img src='../images/sound.png'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>");
		}//if
		
		return mav;
	}//createProc
	
	@RequestMapping("/media/list.do")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("media/list");
		mav.addObject("list",dao.list());
		mav.addObject("root",Utility.getRoot());
		
		return mav;
	}//list
	
	@RequestMapping("/media/read.do")
	public ModelAndView read(int mediano) {
		
		ModelAndView mav=new ModelAndView();
		MediaDTO dto=dao.read(mediano);
		
		if(dto!=null) {
			String filename=dto.getFilename();
			//음원파일명을 전부 소문자로 치환
			filename=filename.toLowerCase();
			
			if(filename.endsWith(".mp3")) {
				mav.setViewName("media/readMP3");
			}else if(filename.endsWith(".mp4")) {
				mav.setViewName("media/readMP4");
			}//if
			
		}//if
		
		mav.addObject("dto",dto);
		
		return mav;
		
	}//read
	
	
	@RequestMapping(value = "/media/update.do", method = RequestMethod.GET)
	public ModelAndView updateForm(MediaDTO dto) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("media/updateForm");
		mav.addObject("dto",dao.read(dto.getMediano()));
		return mav;
	}//updateForm
	
	@RequestMapping(value = "/media/update.do", method = RequestMethod.POST)
	public ModelAndView updateProc(MediaDTO dto, HttpServletRequest req) {
		//파일을 수정할지 안할지는 filesize를 보고 결정 -> 파일사이즈가 0보다 클때만 업데이트
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("media/msgView");
		String basePath=req.getRealPath("/media/storage");
		
		//수정 전 기존의 정보 가져오기
		MediaDTO oldDTO=dao.read(dto.getMediano());
		
		//------------------------------------------------------------------------
		//파일을 수정할 것인지?
		//1)
		MultipartFile posterMF=dto.getPosterMF();
		if(posterMF.getSize()>0) {
			//파일이 전송된 경우
			//기존파일 삭제
			UploadSaveManager.deleteFile(basePath, oldDTO.getPoster()); //경로,기존의파일명
			//신규파일 저장
			String poster=UploadSaveManager.saveFileSpring30(posterMF, basePath);
			//dto전달
			dto.setPoster(poster);
		}else {
			//파일이 전송되지 않은 경우
			dto.setPoster(oldDTO.getPoster());
		}//if
		
		//2)
		MultipartFile filenameMF=dto.getFilenameMF();
		if(filenameMF.getSize()>0) {
			//파일이 전송된 경우
			//기존파일 삭제
			UploadSaveManager.deleteFile(basePath, oldDTO.getFilename()); //경로,기존의파일명
			//신규파일 저장
			String filename=UploadSaveManager.saveFileSpring30(filenameMF, basePath);
			dto.setFilename(filename);
			dto.setFilesize(filenameMF.getSize());
		}else {
			//파일이 전송되지 않은 경우
			dto.setFilename(oldDTO.getFilename());
			dto.setFilesize(oldDTO.getFilesize());
		}//if
		
		//------------------------------------------------------------------------
		
		int cnt=dao.update(dto);
		if(cnt==0) {
			mav.addObject("msg2","<p>음원수정 실패!</p>");
			mav.addObject("img","<img src='../images/fail.png'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>");
			mav.addObject("link2","<input type='button' value='다시시도' onclikc='javascript:history.back()'>");
		}else {
			mav.addObject("msg2","<p>음원수정 성공!</p>");
			mav.addObject("img","<img src='../images/sound.png'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>");
		}//if
		
		return mav;
		
	}//updateProc
	
}//
