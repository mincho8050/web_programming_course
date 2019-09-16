/*myscript.js*/



//게시판 유효성 검사
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


//비밀번호 검사
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


//검색어 검사
function searchCheck(f){
	var word=f.word.value;
	word=word.trim();
	if(word.length==0){
		alert("검색어를 입력하세요");
		return false;//서버 전송 불가
	}//if end
	return true;     //서버로 전송
}//searchCheck() end

//---------------------------------------------------------------------------

//로그인 체크
function loginCheck(f){
	//로그인 유효성 검사
	//1) 아이디 5~10글자 이내
	var id=f.id.value;
	id=id.trim();
	if(id.length<5 || id.length>10){
		alert("아이디 5~10글자 이내로 입력해주세요");
		f.id.focus();
		return false;
	}
	//2) 비밀번호 5~10글자 이내
	var passwd=f.passwd.value;
	passwd=passwd.trim();
	if(passwd.length<5 || passwd.length>10){
		alert("비밀번호 5~10글자 이내로 입력해주세요");
		f.passwd.focus();
		return false;
	}
	
	return true;
}//loginCheck

//---------------------------------------------------------------------------

//회원가입 약관동의
function send(f){
	//라디오버튼은 체크한거와 안한거 두가지 경우
	if(f.agree.checked==true){
		//체크한 경우
		return true;
	}else{
		//안한경우
		alert("약관에 동의한 후 회원가입이 가능합니다.");
		return false;
	}
}//send

//회원가입 아이디 중복 체크
function idCheck(){
	//아이디 중복체크
	//새창 만들기(팝업창)
	//window.open("파일명","새창이름","다양한 옵션");
	window.open("idCheckForm.jsp","idwin","width=550,height=350");
	
}//idCheck

//회원가입 아이디 공백인지 체크
function blankCheckId(f){
	var id=f.id.value;
	id=id.trim();
	if(id.length<5){
		alert("아이디는 5글자 이상 입력해주세요.");
		return false;
	}

	return true;
}//blankCheck
//회원가입 이메일 공백인지 체크
function blankCheckEmail(f){
	var email=f.email.value;
	email=email.trim();
	if(email.length==0){
		alert("이메일을 입력해주세요.");
		return false;
	}
	return true;
}//blankCheckEmail

//회원가입 이메일 중복 체크
function emailCheck(){
	window.open("emailCheckForm.jsp","emailwin","width=550,height=350");
}//idCheck

//사용가능한 아이디일 시 아이디 창에 띄우기
function applyId(id){
	//중복확인 id를 부모창에 적용
	//부모창 opener (요즘 많이 안쓰임)
	opener.document.regForm.id.value=id;
	window.close();
}//apply
//사용가능한 이메일 시 이메일 창에 띄우기
function applyEmail(email){
	//중복확인 id를 부모창에 적용
	//부모창 opener (요즘 많이 안쓰임)
	opener.document.regForm.email.value=email;
	window.close();
}//apply


//회원가입 유효성 검사
function memberCheck(f){
	//1) 아이디 5~10글자 이내
	var id=f.id.value;
	id=id.trim();
	if(id.length<5 || id.length>10){
		alert("아이디 5~10글자 이내로 입력해주세요");
		f.id.focus();
		return false;
	}
	
	//2)비밀번호 5~10글자 이내
	//>비밀번호에 특수번호가 포함되어있는지?(이건 나중에라도 해보기)
	var passwd=f.passwd.value;
	passwd=passwd.trim();
	if(passwd.length<5 || passwd.length>10){
		alert("비밀번호 5~10글자 이내로 입력해주세요");
		f.passwd.focus();
		return false;
	}
	
	//3)비밀번호와 비밀번호 확인이 서로 일치하는지
	var repasswd=f.repasswd.value;
	repasswd=repasswd.trim();
	if(passwd!=repasswd){
		alert("비밀번호가 일치하지 않습니다.");
		f.repasswd.focus();
		return false;
	}
	
	//4)이름 2~20글자 이내
	var mname=f.mname.value;
	mname=mname.trim();
	if(mname.length<2 || mname.length>20){
		alert("이름을 2~20글자 이내로 입력해주세요");
		f.mname.focus();
		return false;
	}
	
	//5)이메일에 @문자가 있는지
	var email=f.email.value;
	email=email.trim();
	if(email.includes("@")==false){
		alert("이메일에 @ 포함하여 올바르게 입력해주세요.")
		f.email.focus();
		return false;
	}
	
	//6)직업을 선택했는지
	var job=f.job.value;
	if(job=="0"){
		alert("직업을 선택해 주세요.");
		return false;
	}
	
	return true;
	//유효성 검사를 모두 통과했으므로 memeberProc.jsp로 전송됨
	
}//memberCheck


//---------------------------------------------------------------------------

//비디오 재생(메인)
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});


