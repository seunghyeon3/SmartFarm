<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h3>비밀번호를 입력하세요</h3>
						<form action="mypage.do" onsubmit="return passwordCheck()">
							
							<div class="input-group">
								<input id="password" type="password" class="form-control"
									placeholder="비밀번호" required>
							</div>
							
							<div class="input-group">
								<button class="login-btn" type="submit">입력</button>
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--Causes End-->
	<script>
		function passwordCheck() {

			if(document.getElementById('password').value == ${member.mem_pw}){
				alert('정상적으로 입력되었습니다.');
				return true;
			}else{
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			} 
		}
	</script>
</body>
</html>
