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
						<h3>비밀번호를 입력하세요</h3>
						<form>
							
							<div class="input-group">
								<input type="password" class="form-control"
									placeholder="비밀번호" required>
							</div>
							
							<div class="input-group">
								<button class="login-btn">입력</button>
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--Causes End-->
</body>
</html>
