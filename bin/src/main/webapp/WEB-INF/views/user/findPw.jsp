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
						<h3>비밀번호 찾기</h3>


						<div class="input-group">
							<input type="text" id="mem_name" name="mem_name"
								class="form-control" placeholder="이름" required>
						</div>
						<div class="input-group">
							<input type="email" id="mem_email" name="mem_email"
								class="form-control" placeholder="이메일" required>
						</div>

						<br>

						<div class="input-group">
							<button class="login-btn" type="button" onclick="findPw()">확인</button>
						</div>



					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		function findPw() {
			var mem_email = $("#mem_email").val();
			var mem_name = $("#mem_name").val();
			var data = JSON.stringify({mem_email : mem_email, mem_name : mem_name});
			
			fetch("findMemberPw.do",
				{
				method:'post',
				headers:{
					 'Content-Type': 'application/json;charset=utf-8'
				},
				body : data
			})
			.then(response => response.json())
			.then(function (result) {
				console.log(result);
				
				if(result == '0'){
					toastr.error('유효하지 않은 이메일입니다');
				} else {
					toastr.success('임시비밀번호가 메일로 발송되었습니다');
				}
				
			});
			
		}
	</script>
</body>
</html>
