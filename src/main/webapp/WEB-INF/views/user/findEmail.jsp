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
						<h3>이메일 찾기</h3>


						<div class="input-group">
							<input type="text" id="mem_name" name="mem_name"
								class="form-control" placeholder="이름" >
						</div>
						<div class="input-group">
							<input type="email" id="mem_email" name="mem_email"
								class="form-control" placeholder="이메일" >
						</div>

						<br>

						<div class="input-group">
							<button class="login-btn" type="button" onclick="findEmail()">확인</button>
						</div>



					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		function findEmail() {
			
			var mem_email = $("#mem_email").val();
			var mem_name = $("#mem_name").val();
			//이메일 양식 유효성 검사
			var mem_email_reg = mem_email.search(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
			
			if(mem_name == ''){
				toastr.error('이름을 입력해주세요');
				
			}else if(mem_email ==''){
				toastr.error('이메일을 입력해주세요');
				
			}else if(mem_email_reg < 0){
				toastr.error('유효한 이메일 형식을 입력하세요');
				
			}else{
				var data = JSON.stringify({mem_email : mem_email, mem_name : mem_name});
				
				fetch("findMemberEmail.do",
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
						toastr.success('사용가능한 이메일 입니다')
					}
					
				});
			}
			
		}
	</script>
</body>
</html>
