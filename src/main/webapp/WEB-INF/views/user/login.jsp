<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<style type="text/css">
.row 
.col {
	display: flex;
	align-items: center;
}
</style>
</head>

<body>
	<!--Causes Start-->
	<section class="contact-page wf100 p80">
		<div class="container">
			<div class="row">

				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="login-box">
						<h3>로그인</h3>
						
						
						<form id="loginFrm" action="loginCheck.do" onsubmit="check()" method="post">
							<div class="input-group">
								<input type="email" id="mem_email" name="mem_email" class="form-control"
									placeholder="이메일" required>
							</div>
							<div class="input-group">
								<input type="password" id="mem_pw" name="mem_pw"class="form-control"
									placeholder="비밀번호" required>
							</div>
							<div class="input-group form-check">
								<a href="#" class="fp">아이디 찾기</a> <a href="#" class="fp">비밀번호
									찾기</a> <a href="#" class="fp">회원가입</a>
							</div>
							<div class="input-group">
								<button class="login-btn" type="submit">로그인</button>
							</div>
						</form>
						
						
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--Causes End-->

	<script type="text/javascript">
		//=====로그인 체크 함수=====
		function check() {
			//값 불러오기
			var mem_email = $("#mem_email").val();
			var mem_pw = $("#mem_pw").val();
			
			
			//아이디랑 비번 입력됐는지 값 확인하기
			if (!(mem_email == "") && !(mem_pw == "")) {

				return true;
				

			} else {
				alert("아이디와 비밀번호를 입력해주세요");
				return false;
			}

		})
	</script>
</body>
</html>
