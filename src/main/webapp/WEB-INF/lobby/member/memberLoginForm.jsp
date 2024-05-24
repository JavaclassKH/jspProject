<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>memberLoginForm.jsp</title>
	<script>
		'use strict';
		
		// 아이디,비밀번호 찾기 준비중
		function ready(e) {
			if(e == 'm') {
				alert("아이디 찾기 기능을 준비중입니다.");
			}
			else {
				alert("비밀번호 찾기 기능을 준비중입니다.");
			}
		}
		
		
	</script>
	<style>
	
	h1 {
		margin-top: 50px;
	}
	
	#LoginForm {
		margin-top: 100px;
	}
	
	#LoginFormTable {
		width: 100%;
		height: 400px;
	}
	
	input {
		margin-top: 10px;
		width: 100%;
		height: 40px;
		border-radius: 20px;
	}
	
	th {
		 vertical-align: middle; 
		 text-align: center;
	}

	
	</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
	<div class="container">
	<p><br/></p>
		<h1 class="text-center"><font size="12em" color="gold">Sign into IVE world</font></h1>
		<form id="LoginForm" name="LoginForm" method="post" action=""> 
			<table id="LoginFormTable" class="table table-bordered">
				<tr>
					<th style="width:20%;">아이디</th>
					<td style="width:80%">
						<input type="text" name="mid" id="mid" maxlength="12" placeholder="아이디를 입력하세요" class="form-control p-1" autofocus required />
					</td>
				</tr>			
				<tr>
					<th style="width:20%;">비밀번호</th>
					<td style="width:80%;">
						<input type="password" name="pwd" id="pwd" maxlength="16" placeholder="비밀번호를 입력하세요" class="form-control p-1" required />
					</td>
				</tr>					
				<tr>
					<td colspan="2">
					<div class="btnGroup">
						<input type="button" value="로그인" onclick="memberLoginOk()" class="btn btn-success" />
						<input type="button" value="회원가입하기" onclick="location.href='MemberJoinForm.mem';" class="btn btn-info" />
						<input type="button" value="아이디찾기" onclick="ready('m')" class="btn btn-warning" />
						<input type="button" value="비밀번호재설정" onclick="ready('p')" class="btn btn-danger" />
					</div>
					</td>
				</tr>			
			</table>
		</form>
	</div>	
	<p><br/></p>
	<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
