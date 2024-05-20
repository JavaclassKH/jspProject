<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Time to DIVE into IVE</title>
	<script>
		'use strict';
		
		/*  정규식 잠시 봉인
			let regMid = /^[a-zA-Z0-9_]{4,20}$/;	  // 아이디는 4~20길이의 영문 대/소문자와 숫자와 밑줄 가능
			let regPwd = "";                        // 비밀번호는 8~14길이의 영문 대/소문자와 숫자와 밑줄과 특수문자 가능
		  let regName = /^[가-힣a-zA-Z]+$/;        // 이름은 최대 8자의 한글/영문 가능
		  let regNickName = /^[가-힣0-9_]+$/;		  	// 닉네임은 8~14길이의 한글, 숫자, 밑줄만 가능
		  let reg
		*/
		
		let idCheckSw = 0;
		let nickNameCheckSw = 0;
		
		
		function memberJoinOkCheck() {  
			let mid = $("#mid").val();
			let pwd = $("#pwd").val();
			let name = $("#name").val();
			let nickName = $("#nickName").val();
			let contact = $("#contact").val();
			let email = $("#email").val();
			
			if(idCheckSw != 1 && nickNameCheckSw != 1) {
				alert("아이디,닉네임 중복체크를 진행해주세요");				
			}
			if(idCheckSw != 1 && nickNameCheckSw == 1){
				alert("아이디중복체크를 진행해주세요");		
			}
			if(idCheckSw == 1 && nickNameCheckSw != 1){
				alert("닉네임 중복체크를 진행해주세요");		
			}
			else {
				myform.submit();
			}
		}
		 
		// 아이디 중복체크
		function idCheck() {
			let mid = $("#mid").val();
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
			}
			else {
				$.ajax({
					url : "",
				});
				
			}
		}
		
		// 닉네임 중복체크
		function nickNameCheck() {
			let nickName = $("#nickName").val();
			if(nickName.trim() == "") {
				alert("닉네임을 입력하세요");
				$("#nickName").focus();
			}
			else {
				
				
			}
		}
		
		
		
	</script>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp"%>
	<div class="container">
	<br/><br/>
		<h1 class="text-center"><font color="gold" size="10em"><strong>회 원 가 입</strong></font></h1>
		<br/><hr/><br/>
		<form name="memberLoginForm">
			<div class="form-group mb-2">
			  <label for="mid">&nbsp;아이디&nbsp; <a href="javascript:idCheck()" class="badge bg-warning badge-sm">중복확인</a>
			  <input type="text" name="mid" id="mid" class="form-control mt-2" maxlength="16" autofocus required />
			  </label>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <label for="pwd">&nbsp;비밀번호 
			  <input type="password" name="pwd" id="pwd" maxlength="14" class="form-control mt-2" required />
				</label>
			</div><br/><br/>
			<div class="form-group mb-2">
			  <label for="mid">&nbsp;성명
			  <input type="text" name="mid" id="mid" class="form-control mt-2" maxlength="16" autofocus required />
			  </label>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <label for="pwd">&nbsp;닉네임&nbsp; <a href="javascript:idCheck()" class="badge bg-warning badge-sm">중복확인</a>
			  <input type="password" name="pwd" id="pwd" maxlength="14" class="form-control mt-2" required />
				</label>
			</div><br/>
			<div class="form-group mb-2">
			  <label for="mid">&nbsp;전화번호</label>
			  <input type="text" name="mid" id="mid" style="width:300" class="form-control mt-2" maxlength="16" autofocus required />		
			  <br/>	  
			  <label for="pwd">&nbsp;이메일&nbsp; <a href="javascript:idCheck()" class="badge bg-warning badge-sm">중복확인</a></label>
			  <input type="password" name="pwd" id="pwd" maxlength="14" class="form-control mt-2" required />
				
			</div><br/>
		</form>
	</div>	
	<%@ include file="/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
