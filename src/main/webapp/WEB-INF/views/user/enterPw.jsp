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
							
							<div class="input-group">
								<input id="password" type="password" class="form-control"
									placeholder="비밀번호" required>
							</div>
							
							<div class="input-group">
								<button class="login-btn" onclick="passwordCheck()">입력</button>
							</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--Causes End-->
	<script>
		function passwordCheck() {
			$.ajax({
				type : "POST",
				url : "pwcheck.do",
				data : {pass : document.getElementById('password').value},
				success : function(Kpassword) {
					console.log(Kpassword);
					if(Kpassword){
					 	window.location.href = "mypage.do";
					}else{
						alert('비밀번호가 일치하지 않습니다.');
						location.reload();
					}
				} //success
			});
			
		}
	</script>
</body>
</html>
