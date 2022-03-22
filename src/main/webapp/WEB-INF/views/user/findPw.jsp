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
			//이메일 양식 유효성 검사
			var mem_email_reg = mem_email.search(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
			
			if(mem_name == ''){
				toastr.error('이름을 입력해주세요');
				
			}else if(mem_email ==''){
				toastr.error('이메일을 입력해주세요');
				
			}else if(mem_email_reg < 0){
				toastr.error('유효한 이메일 형식을 입력하세요');
				
			}else{
				toastr.success('이메일 발송중입니다. 잠시만 기다려주세요');
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
						
					} else if(result == '1') {
						alert('임시비밀번호가 메일로 발송되었습니다.');
						location.href="login.do";
					} else if(result == '2'){
						toastr.error('임시비밀번호 발송에 실패했습니다.\n다시 시도해주세요')
					}
					
				});
			}
			
		}
	</script>
</body>
</html>
