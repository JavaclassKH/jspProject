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
		
		
		 
		// 아이디 중복체크
		function idCheck() {
			let mid = $("#mid").val();
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
			}
			else {
				$.ajax({
					url : "memMidNickNameCheck.mem",
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
				$.ajax({
					url : "memMidNickNameCheck.mem",
				});
				nickNameCheckSw = 1;
			}
		}
		
		// 회원가입 함수
		function memberJoinOkCheck() {  
			let mid = $("#mid").val();
			let pwd = $("#pwd").val();
			let name = $("#name").val();
			let nickName = $("#nickName").val();
			let contact = $("#contact").val();
			let email = $("#email").val();
			
			if(idCheckSw != 1) {
				alert("아이디 중복체크를 진행해주세요");				
			}
			else if(nickNameCheckSw != 1){
				alert("닉네임 중복체크를 진행해주세요");		
			}
			else {
				myform.submit();
			}
		}
		
		
	</script>
	<style>
	body {
		background-color: beige;
	}
	
	</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
	<div class="container">
		<br/>
		<h1 class="text-center"><font color="gold" size="10em"><strong>회 원 가 입</strong></font></h1>
		<br/><hr/>
		<div>	
			<form name="memberJoinForm">
				<div class="form-group mb-4">
				  <label for="mid">&nbsp;아이디&nbsp;</label> <a href="javascript:idCheck()" class="badge bg-warning badge-sm">중복확인</a>
				  <input type="text" style="width:650px" name="mid" id="mid" placeholder="아이디를 입력하세요" class="form-control mt-2" maxlength="16" autofocus required />			  
				</div>
				<div class="form-group mb-2">
				  <label for="pwd">&nbsp;비밀번호 </label>
				  <input type="password" style="width:650px" name="pwd" id="pwd" maxlength="14" placeholder="비밀번호를 입력하세요" class="form-control mt-2" required />		
				<br/>
				<div class="form-group mb-4">
				  <label for="name">&nbsp;성명
				  <input type="text" style="width:650px" name="name" id="name" placeholder="성명을 입력하세요" class="form-control mt-2" maxlength="16" required />
				  </label>
				 </div>
				<div class="form-group mb-2">
				  <label for="nickName">&nbsp;닉네임&nbsp; <a href="javascript:nickNameCheck()" class="badge bg-warning badge-sm">중복확인</a>
				  <input type="text" style="width:650px" name="nickName" id="nickName" maxlength="14" class="form-control mt-2" required />
					</label>
				</div><br/>
			  <label for="contact">&nbsp;전화번호(휴대폰)</label>
					<div class="form-group mb-2">
		   			<select style="width:180px; float:left" class="form-control" disabled>
		   				<option value="010" selected>010</option>
		   			</select>
		   			<input type="text" name="contact" id="contact2" class="form-control" style="width:235px; float:left" />
		   			<input type="text" name="contact" id="contact3" class="form-control" style="width:235px; float:left" />
					  <br/>	 
					</div>
					<div class="form-group mb-2">
					<br/>   
					  <label for="email">&nbsp;이메일 </label>
					  <br/>
					  <input type="text" style="width:305px;" name="email" id="email1" class="form-control" required />
					  <input type="text" style="width:40px; margin-left:3px; float:right;" name="email" id="email2" value="@" class="form-control" disabled />					  
					  <input type="text" style="width:305px; margin-left:3px; float:right;" name="email" id="email3" class="form-control" required />
					</div><br/>
				</div>
				<div style="display:inline-block; margin-top:10px; float:right;">
						<input type="button" value="회원가입" onclick="memberJoinCheck()" style="width:150px;" class="btn btn-success mr-4" />
						<input type="reset" value="다시작성" style="width:150px;" class="btn btn-danger mr-4" />
						<input type="button" value="로비가기" onclick="location.href='Lobby.mem';" style="width:150px; color:white;" class="btn btn-info" />
				</div>
			</form>
		</div>	
	</div>
	<%@ include file="/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
