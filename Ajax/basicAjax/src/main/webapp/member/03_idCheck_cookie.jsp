<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_idCheck_cookie.jsp</title>
</head>
<body>

  <h3>회원가입</h3>
  <!-- 쿠키를 이용해서 아이디 중복확인을 했는지 확인. jquery.cookie.js 필요.(다운로드가능) -->
  
  <form name="memfrm" id="memfrm" onsubmit="return send()">
	  <table>
	  <tr>
	    <th>아이디</th>
	    <td>
	      <input type="text" name="uid" id="uid">
	      <button type="button" id="checkId">중복확인</button>
	    </td>
	    <td>
	      <span id="panel_id"></span> <!-- ID 중복 관련 메세지 -->
	    </td>
	  </tr>  
	  <tr>
	    <th>비밀번호</th>
	    <td><input type="password" name="upw" id="upw"></td>
	    <td>&nbsp;</td>
	  </tr>  
	  <tr>
	    <td colspan="3"><input type="submit" value="가입"></td>
	  </tr>  
	  </table>    
  </form>
    
<script src="../js/jquery.js"></script>
<script src="../js/jquery.cookie.js"></script>

<script>
	//전역적인 공간에 지정한 함수
	//현재 페이지가 실행되면 같이 실행됨
	$(function(){
		//해당페이지가 읽혀졌을때 쿠키변수 삭제(기존에 있던 쿠키들)
		$.removeCookie("checkID");
	});

	$("#checkId").click(function(){
		//$.post("요청명령어",전달값,콜백함수,응답받는형식)
		//val() 함수는 양식(form)의 값을 가져오거나 값을 설정.
		var params="uid="+$("#uid").val();
		$.post("idCheck2.do",params, checkID, "json");
	});//checkId
	
	function checkID(result) {
		//1)text 응답
		//alert(result);
		
		//2)json 응답
		//alert(result);
		//alert(result.count);
		//eval(String) 함수는 String 문자열을 자바스크립트 코드로 실행 (..?)
		var count=eval(result.count);
		if(count==0){
			$("#panel_id").css("color","blue");
			$("#panel_id").text("사용 가능한 아이디입니다.");
			//$.cookie("쿠키변수명", 값)
			$.cookie("checkID", "PASS"); //쿠키변수 생성
		}else{
			$("#panel_id").css("color","red");
			$("#panel_id").text("중복된 아이디 입니다.");
			$("#uid").focus(); //커서생성
		}
	}//checkID
	
	//아이디 중복확인을 해야만 회원가입폼이 서버로 전송
	function send() {
		//쿠키변수값 가져오기
		var checkID=$.cookie("checkID");
		if(checkID=="PASS"){
			return true;
		}else{
			$("#panel_id").css("color","green");
			$("#panel_id").text("아이디 중복확인을 해주세요");
			$("#uid").focus(); //커서생성
			return false;
		}//if
	}//send
	
</script>

    
</body>
</html>




