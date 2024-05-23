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
		
		// 아이디,닉네임 중복확인용 스위치, 분류용 체크
		let whatCheck = '';
		let idCheckSw = 0;
		let nickNameCheckSw = 0;		
		
		/* <<< 정규식 >>> */ 
		// 이름: 한글 2~6자
		const regName= /^[가-힣]{2,6}$/;   
		// 아이디: 영문 대/소문자와 숫자만을 사용한 4~16자
		const regMid= /^[A-Za-z0-9]{4,16}$/;  
		// 비밀번호:  대문자 1개이상, 소문자 1개이상, 숫자 1개이상, 특수문자 1개이상을 포함한 10~16자
		const regPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{10,16}$/; 
		// 닉네임: 영문/대 소문자, 한글, 숫자만을 사용한 4~12자
		const regNickName = /^[A-Za-z가-힣0-9]{4,12}$/;  
		// 휴대폰번호: 앞번호 3 글자, 중간번호 3또는 4글자, 마지막번호는 4글자. 하이픈 포함 X
		const regContact = /^\d{3}\d{3,4}\d{4}$/;
		// 이메일: 맨 앞은 영문 대/소문자,숫자,밑줄과 하이픈만을 사용한 4~12 글자, 골뱅이 뒤는 영문 대/소문자,숫자,밑줄과 하이픈만을 사용한 4~8 글자
		/* const regEmail = /^[a-zA-Z0-9._-]{4,12}+@[a-zA-Z0-9.-]{4,8}+\.[a-zA-Z]{2,4}$/; */

		// 아이디 중복체크
		function idCheck() {
			let mid = document.getElementById("mid").value;
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
			}
			else {
				$.ajax({
					url : "MemberMidNickNameCheck.mem",
					type: "post",
					data : {
						mid : mid,
						whatCheck : 'midCheck'
					},
					success : function(res) {
						if(res != "0") {
							alert("사용 가능한 아이디입니다");
							idCheckSw = 1;
						}
						else {
							console.log(res);
							alert("이미 사용중인 아이디입니다");
							$("#mid").focus();
						}
					},
					error : function() {
						alert("아이디,닉네임 전송중 오류가 발생했습니다.");	
					}
				});				
			}
		}
		
		// 닉네임 중복체크
		function nickNameCheck() {
			// let nickName = document.getElementById("nickName").value;
			let nickName = $("#nickName").val();
			if(nickName.trim() == "") {
				alert("닉네임을 입력하세요");
				$("#nickName").focus();
			}
			else {
				$.ajax({
					url : "MemberMidNickNameCheck.mem",
					type: "post",
					data : {
						nickName : nickName,
						whatCheck : 'nickNameCheck'
						},
					success : function(res) {
						if(res != "0") {
							alert("사용 가능한 닉네임입니다");
							nickNameCheckSw = 1;
						}
						else {
							alert("이미 사용중인 닉네임입니다");
							$("#nickName").focus();
						}
					},
					error : function() {
						alert("아이디,닉네임 전송중 오류가 발생했습니다.");	
					}
				});				
			}
		}
		
		// 회원가입하기
		function memberJoinCheck() {  
			let mid = $("#mid").val();
			let pwd = $("#pwd").val();
			let name = $("#name").val();
			let nickName = $("#nickName").val();
			
			let contact = '';
			let contact1 = $("#contact1").val();
			let contact2 = $("#contact2").val();
			let contact3 = $("#contact3").val();
			contact += contact1 + contact2 + contact3;
			
			let email = '';
			let email1 = $("email1").val();
			let email2 = $("email1").val();
			email += email1 + '@' + email2;
			
			if(name.match(regName) == false) {
				alert("이름 형식에 맞게 작성해주세요!");
				alert("한글 2~6자");
				return;
			}
			else if(mid.match(regName) == false) {
				alert("아이디 형식에 맞게 작성해주세요!");
				alert("영문 대/소문자와 숫자만을 사용한 4~16자");
				return;				
			}
			else if(pwd.match(regPwd) == false) {
				alert("비밀번호 형식에 맞게 작성해주세요!");
				alert("대문자 1개이상, 소문자 1개이상, 숫자 1개이상, 특수문자 1개이상을 포함한 10~16자");
				return;				
			}
			else if(nickName.match(regNickName) == false) {
				alert("닉네임 형식에 맞게 작성해주세요!");
				alert("영문/대 소문자, 한글, 숫자만을 사용한 4~12자");
				return;				
			}
			else if(contact.match(regContact) == false) {
				alert("전화번호 형식에 맞게 작성해주세요!");
				alert("앞번호 3자, 중간번호 3~4자, 마지막번호 4자");
				return;				
			}
/* 			else if(email.match(regEmail) == false;) {
				alert("이메일 형식에 맞게 작성해주세요!"); 
				return;				
			} */
			else {
				if(idCheckSw != 1) {
					alert("아이디 중복체크를 진행해주세요");				
				}
				else if(nickNameCheckSw != 1){
					alert("닉네임 중복체크를 진행해주세요");		
				}
				else {
					memberJoinForm.submit();
				}
			}			
		}
		
		
	</script>
	<style>
	body {
		margin: 0px;
		padding: 0px;
		background-color: beige;
	}
	
	.join {
		margin-left: 200px; 
		width: 700px;
		float: left;
	}
	
	.joinBtns {
		margin-right: 100px;
		width: 300px;
		display: inline-block;
		float: right;
		position: relative;
		bottom: 350px;
		left: 80px;
	}
	
	.bt1 {
		position: relative;
		bottom: 159px;
	}
	
	.bt2 {
		position: absolute;
	}
	
	.bt3 {
		position: relative;
		top: 257px;
	}
	
	
	
	</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
		<br/>
		<h1 class="text-center"><font color="gold" size="10em"><strong>회 원 가 입</strong></font></h1>
		<br/><hr/>
		<div class="container">
			<form name="memberJoinForm" method="post" action="MemberJoinOk.mem">
				<div class="join">
					<div class="form-group mb-4">
					  <label for="mid">아이디</label><input type="button" value="중복확인" onclick="idCheck()" class="btn btn-warning btn-sm" />
					  <input type="text" style="width:650px" name="mid" id="mid" placeholder="아이디를 입력하세요" class="form-control mt-2" maxlength="16" autofocus required />			  
					</div>
					<div class="form-group mb-2">
					  <label for="pwd">비밀번호 </label>
					  <input type="password" style="width:650px" name="pwd" id="pwd" maxlength="14" placeholder="비밀번호를 입력하세요" class="form-control mt-2" required />		
					<br/>
					<div class="form-group mb-4">
					  <label for="name">성명</label>
					  <input type="text" style="width:650px" name="name" id="name" placeholder="성명을 입력하세요" class="form-control mt-2" maxlength="16" required />				  
					 </div>
					<div class="form-group mb-2">
					  <label for="nickName">닉네임<input type="button" value="중복확인" onclick="nickNameCheck()" class="btn btn-warning btn-sm" />
					  <input type="text" style="width:650px" name="nickName" id="nickName" maxlength="14" class="form-control mt-2" required />
						</label>
					</div><br/>
				  <label for="contact">전화번호(휴대폰)</label>
						<div class="form-group mb-2">
			   			<select name="contact" id="contact1" style="width:180px; float:left" class="form-control" disabled>
			   				<option value="010" selected>010</option>
			   			</select>
			   			<input type="text" maxlength="4" name="contact" id="contact2" class="form-control" style="width:235px; float:left" />
			   			<input type="text" maxlength="4" name="contact" id="contact3" class="form-control" style="width:235px; float:left" />
						  <br/>	 
						</div>
						<br/>   
						<label for="email">이메일</label><br/>
						<div class="input-group mb-3" style="width:650px">
	      			<input type="text" style="width:315px" class="form-control" name="email" id="email1" />
	      			<div class="input-group-prepend">
	        			<input type="text" style="width:50px" class="form-control" value="@" disabled />
	      			</div>
	      				<input type="text" style="width:285px" placeholder="" class="form-control" name="email" id="email2" />
	    				</div>
					</div>
				</div>
				<div class="joinBtns">
						<div class="bt1" style="width:160px">
							<input type="button" value="회원가입" onclick="memberJoinCheck()" style="width:150px;" class="btn btn-success" />
						</div>
						<div class="bt2" style="width:160px">
							<input type="reset" value="다시작성" style="width:150px;" class="btn btn-danger" />					
						</div>						
						<div class="bt3" style="width:160px">
							<input type="button" value="로비가기" onclick="location.href='Lobby.mem';" style="width:150px; color:white;" class="btn btn-info" />
						</div>
				</div>
			</form>
		</div>	
	<%@ include file="/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
