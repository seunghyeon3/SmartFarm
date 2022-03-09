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


						<form id="loginFrm" action="loginCheck.do" onsubmit="check()"
							method="post">
							<div class="input-group">
								<input type="email" id="mem_email" name="mem_email"
									class="form-control" placeholder="이메일" required>
							</div>
							<div class="input-group">
								<input type="password" id="mem_pw" name="mem_pw"
									class="form-control" placeholder="비밀번호" required>
							</div>

							<div class="input-group form-check">
								<a href="findEmail.do" class="fp">아이디 찾기</a> <a href="findPw.do" class="fp">비밀번호
									찾기</a> <a href="register.do" class="fp">회원가입</a>
							</div>
							<div class="input-group">
								<button class="login-btn" type="submit">로그인</button>
							</div>
						</form>
						<ul style="list-style:none;">
							<li onclick="kakaoLogin();">  <a href="javascript:void(0)">
									<img alt="카카오 로그인" src="resources/images/login/kakao_login_medium.png">
							</a></li>
							
							<!-- 추후수정 작업 끝나면 카카오 로그아웃 없애도 됨 -->
							<li onclick="kakaoLogout();"><a href="javascript:void(0)">
									<span>카카오 로그아웃</span>
							</a></li>
						</ul>

					</div>
				</div>
			</div>
		</div>



	</section>
	<!--Causes End-->


	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	
	
		//=====카카오 로그인=====
		Kakao.init('3a47d674ba79e60fad431786545dae12'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							
							console.log(response.kakao_account.email)
							
							checkEmail(response.kakao_account.email);
						},
						fail : function(error) {
							console.log(error)
						},
					})
				},
				fail : function(error) {
					console.log(error)
				},
			})
		}
		//카카오로그아웃  
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}
		
		
		// 카카오 로그인 후 회원가입 여부 알아보기
		function checkEmail(mem_email) {
			console.log(mem_email)
			var menu = "kakao";
			var data = JSON.stringify({ mem_email: mem_email, menu: menu });
			
			fetch("memberEmailCheck.do",
					{ method:'post',
				 	headers: {
					    'Content-Type': 'application/json;charset=utf-8'
					  },
					  body: data
					  
				}).then(response => response.json())
				.then(function(result) {
					console.log(result)
					if(result == '0'){ //이미 사용중
						console.log("리턴값 있으니까 로그인 시키기");
						
						location.href ="home.do";
						
					} else {// 값 사용가능
						console.log("없으니까 회원가입 이동");
						location.href ="register.do?mem_email="+mem_email;
					}
				});
		}

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

		}
	</script>
</body>
</html>
