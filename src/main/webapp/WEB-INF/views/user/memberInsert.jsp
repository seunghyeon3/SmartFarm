<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 70%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
</head>

<body>
	<!--회원가입-->
	<section class="contact-page wf100 p80">
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="contact-form mb60">
						<h3>회원가입</h3>
						<ul class="cform">
							<li class="half pr-15"><input type="email"
								class="form-control" id="email" placeholder="이메일"></li>

							<li class="half pl-15">
								<button type="button" class="fsubmit">이메일 확인</button>
							</li>

							<li class="half pr-15"><input type="password"
								class="form-control" placeholder="비밀번호"></li>
							<li class="half pl-15"><input type="password"
								class="form-control" placeholder="비밀번호 확인"></li>

							<li class="half pr-15"><input type="text"
								class="form-control" placeholder="이름"></li>
							<li class="half pl-15"><input type="text"
								class="form-control" placeholder="전화번호"></li>

							<li class="full"><input type="text" class="form-control"
								placeholder="주소"></li>
							<li class="full"><input type="text" class="form-control"
								placeholder="상세주소"></li>

							<li class="full"><input type="text" class="form-control"
								placeholder="개인정보 동의"></li>
							<li class="full"><a href="javascript:void(0)"
								onclick="openPInfo()">개인정보 동의</a></li>
							<li class="half pr-15">
								<button type="button" class="fsubmit">회원가입</button>
							</li>

							<li class="half pl-15">
								<button type="button" class="fsubmit"
									style="background-color: #f8f9fa;; color: #66bb6a; border: 1px solid #66bb6a;">취소</button>
							</li>

							

						</ul>
					</div>
				</div>


			</div>
		</div>
	</section>
	
	<div id="lightPInfo" class="col-md-12 white_content">
		개인정보 동의 <a href="javascript:void(0)"
			onclick="document.getElementById('lightPInfo').style.display='none';document.getElementById('fadePInfo').style.display='none'">Close
		</a> <br> <br>
	</div>
	
	<div id="fadePInfo" class="black_overlay"></div>

	<script>
	
		function openPInfo() {
			document.getElementById('lightPInfo').style.display = 'block';
			document.getElementById('fadePInfo').style.display = 'block';
		}
		
	</script>

</body>
</html>