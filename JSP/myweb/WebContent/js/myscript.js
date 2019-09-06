/*myscript.js*/




function bbsCheck(f) {
	//게시판 유효성 검사
	
	//1) 작성자 2글자 이상 입력
	var wname=f.wname.value;
	wname=wname.trim();
	if(wname.length<2){
		alert("작성자 2글자 이상 입력해주세요");
		f.wname.focus();
		return false;
	}
	
	//2) 제목 2글자 이상 입력
	var subject=f.subject.value;
	subject=subject.trim();
	if(subject.length<2){
		alert("제목 2글자 이상 입력해주세요");
		f.subject.focus();
		return false;
	}
	
	//3) 내용 2글자 이상 입력
	var content=f.content.value;
	content=content.trim();
	if(content.length<2){
		alert("내용 2글자 이상 입력해주세요");
		f.content.focus();
		return false;
	}
	
	//4) 비밀번호 4글자 이상 입력
	var passwd=f.passwd.value;
	passwd=passwd.trim();
	if(passwd.length<4){
		alert("비밀번호 4글자 이상 입력해주세요");
		f.passwd.focus();
		return false;
	}
	
	return true; //onsubmit 이벤트에서 서버로 전송
	
	
}//bbsCheck


function pwCheck(f){
	//비밀번호가 4글자 이상 입력되었는지 검사
	var passwd=f.passwd.value;
	passwd=passwd.trim();
	if(passwd.length<4){
		alert("비밀번호 4글자 이상 입력해주세요");
		f.passwd.focus();
		return false;
	}
	
	var message="진행된 내용은 복구되지 않습니다.\n계속 진행하시겠습니까?";
	if(confirm(message)){
		//확인 true, 취소 false 반환
		return true;
	}else{
		return false;
	}//if
	
}//pwCheck



//비디오 재생
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});



