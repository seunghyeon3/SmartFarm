<!doctype html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="resources/images/favicon.png">
<title>ECO HTML</title>
<!-- CSS FILES START -->
<link href="../resources/css/custom.css" rel="stylesheet">
<link href="../resources/css/color.css" rel="stylesheet">
<link href="../resources/css/responsive.css" rel="stylesheet">
<link href="../resources/css/owl.carousel.min.css" rel="stylesheet">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/prettyPhoto.css" rel="stylesheet">
<link href="../resources/css/all.min.css" rel="stylesheet">
<!-- CSS FILES End -->
<style type="text/css">
.radioCss {
	width: 50px;
	padding: 20px;
	font-size: 1.2em;
}

/*radio 버튼 색상변경 */
input[type='radio'] {
	-webkit-appearance: none;
	width: 16px;
	height: 16px;
	border: 1px solid darkgray;
	border-radius: 50%;
	outline: none;
	background: #e6e6e6;
}

input[type='radio']:before {
	content: '';
	display: block;
	width: 60%;
	height: 60%;
	margin: 20% auto;
	border-radius: 50%;
}

input[type='radio']:checked:before {
	background: #1b5e20;
}

input[type="checkbox"]:checked {
	background-color: black;
	border-color: black;
	color: white;
}

input[type="checkbox"]:checked::before {
	border-radius: 2px;
	transform: scale(1) translate(-50%, -50%)
}
.checkList{
	font-size: 1.2em;
}

</style>
</head>
<body>


	<div class="wrapper">

		<!--Causes Start-->
		<section class="wf100 p80 blog">



			<div class="projects-grid"></div>
			<div class="container">
			<h1>매출</h1>
				<div class="row">
					<div class="single-post-tags wf50" style="float: left;">
						<a href="#">총매출</a>&nbsp;&nbsp;&nbsp; <a href="#">작물</a>&nbsp;&nbsp;&nbsp;
						<a href="#">키트</a>
					</div>

					<div class="single-post-tags wf50"
						style="float: right; margin: 0 100px;">
						<a href="#">1년</a>&nbsp;&nbsp;&nbsp; <a href="#">1주</a>&nbsp;&nbsp;&nbsp;
						<a href="#">하루</a>
					</div>



					<div class="wf100 comment-form">
						<ul>
							<li class="w3"><input type="text" class="form-control"
								placeholder="시작일"></li>
							<li class="w3"><input type="text" class="form-control"
								placeholder="마지막"></li>
							<li class="w3 np"><button class="post-btn">검색</button></li>

						</ul>
					</div>



					<div class="col-md-8 col-sm-6" style="background-color:  blue">
						<!--campaign box start-->
						그래프자리!
						<!--campaign box end-->
					</div>
					
					
					
					<div class="col-md-4 col-sm-6 checkList">
						<div class="wf100 comment-form">

							<ul>
								<li class=""><input type='checkbox' name='export'
									value='dog' onclick='getCheckboxValue()' />&nbsp;&nbsp;매출</li> 
									
								<li class=""><input type='checkbox' name='export'
									value='dog' onclick='getCheckboxValue()' />&nbsp;&nbsp;키트 구매현황</li>
								<li class=""><input type='checkbox' name='export'
									value='dog' onclick='getCheckboxValue()' />&nbsp;&nbsp;회원관리</li>
								<li class=""><input type='checkbox' name='export'
									value='dog' onclick='getCheckboxValue()' />&nbsp;&nbsp;작물관리</li>
								<li class=""><input type='checkbox' name='export'
									value='dog' onclick='getCheckboxValue()' />&nbsp;&nbsp;NFT 현황조회</li>


								<li class="w3 np"><button class="post-btn">엑셀출력</button></li>

							</ul>

						</div>

					</div>




				</div>
			</div>
		</section>
		<!--Causes End-->



	</div>





	<!--   JS Files Start  -->
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/js/jquery-migrate-1.4.1.min.js"></script>
	<script src="../resources/js/popper.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/jquery.prettyPhoto.js"></script>
	<script src="../resources/js/isotope.min.js"></script>
	<script src="../resources/js/custom.js"></script>
</body>


</html>