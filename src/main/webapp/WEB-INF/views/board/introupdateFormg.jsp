<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">

<title>과수분야 수정</title>

<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #5cb85c;
	cursor: pointer;
	border: 1px solid #4cae4c;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.filebox label:hover {
	background-color: #6ed36e;
}

.filebox label:active {
	background-color: #367c36;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox {
	float: right;
}
</style>
</head>
<body>
	<div class="wrapper">
		<!--Inner Header End-->
		<!--About Start-->
		<section class="contact-page wf100 p80">
			<div class="container">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="contact-form mb60">
							<h3>수정</h3>
							<ul class="cform">
							<!-- 파일업로드 버튼 구성 -->
						    
							<div class="filebox">
								<form action="introupdateg.do" method="post" enctype="multipart/form-data">
									<input type="hidden" name="intro_no" value="${introg.intro_no }"> 
										<img src="resources/images/${introg.intro_img}" alt="내용을 등록 해주세요">
										<span>${introg.intro_img}</span> 
										<label for="ex_file">사진업로드</label> 
										<input type="file" id="ex_file" name="introfile">
							</div>
							<br><br><br>
							<li class="half pr-15">
								<input type="submit" value="수정" onclick="location.href='introg.do'" class="fsubmit"> 
							</li>
							<li class="half pr-15">
								<input type="button" value="취소" onclick="history.back(-1);" class="fsubmit">
							</li>
						</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</body>

</html>