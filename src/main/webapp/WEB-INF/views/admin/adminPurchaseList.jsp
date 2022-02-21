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

.checkList {
	font-size: 1.2em;
}

/* 팝업창 */
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

/* table>tbody>tr {
	margin: 1px;
}

table {
	border: 1 solid black;
}

table>tbody>tr>th {
	text-align: center;
	margin: 2px 10px;
	padding: 2px 10px;
} */
</style>



</head>
<body>


	<div class="wrapper">

		<!--Causes Start-->
		<section class="wf100 p80 blog">



			<div class="projects-grid"></div>
			<div class="container">
				<h1>키트 판매현황</h1>
				<br>
				<div class="row">
					<div class="single-post-tags wf50" style="float: left;">
						<a href="#">전체보기</a>&nbsp;&nbsp;&nbsp; <a href="#">과일류</a>&nbsp;&nbsp;&nbsp;
						<a href="#">채소류</a>
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



					<div class="col-md-8 col-sm-6" style="background-color: blue">
						<!--campaign box start-->
						그래프자리!
						<!--campaign box end-->
					</div>



					<div class="col-md-4 col-sm-6" style="padding: 0 100px;">
						<div class="wf100 comment-form">

							<ul>

								<li class="w3 np"><button onclick="openInstP()"
										class="post-btn" style="width: 100px; margin: 0 150px;">작물등록</button></li>

							</ul>

						</div>

					</div>




				</div>
			</div>
		</section>




	</div>


	<div id="lightInstP" class="col-md-12 white_content">




		<h3>작물등록</h3>

		<a href="javascript:void(0)"
			onclick="document.getElementById('lightInstP').style.display='none';document.getElementById('fadeInstP').style.display='none'">Close
		</a> <br> <br>
		<div class="blog-single-content">
			<form action="" class="insertPlant">
				<table>
					<tbody>
						<tr>
							<th>작물종류</th>
							<td><input type="text" value="나중에 버튼 누르면 컬럼 바껴야함"></td>
						</tr>
						<tr>
							<th>작물이름</th>
							<td><input type="text"></td>
						</tr>
						<tr>
							<th>재배기간</th>
							<td><input type="number"></td>
						</tr>
						<tr>
							<th>적정온도</th>
							<td><input type="number"></td>
						</tr>
						<tr>
							<th>습도</th>
							<td><input type="number"></td>
						</tr>
						<tr>
							<th>일사량</th>
							<td><input type="number"></td>
						</tr>
						<tr>
							<th>급액양</th>
							<td><input type="number"></td>
						</tr>
						<tr>
							<th>농약양</th>
							<td><input type="number"></td>
						</tr>
						<tr>
							<th>습도</th>
							<td><input type="number"></td>
						</tr>
						<tr>
							<th>cctv</th>
							<td><input type="text"></td>
						</tr>
						<tr>
							<th>키트 가격</th>
							<td><input type="number"></td>
						</tr>
						<tr>
							<th>대표 이미지</th>
							<td><input type="text"></td>
						</tr>
						<tr>
							<th>설명 이미지</th>
							<td><input type="text"></td>
						</tr>
						<tr>
							<th>판매여부</th>
							<td><input type="text" value="Y"></td>
						</tr>

						<tr>
							<th>조회수</th>
							<td><input type="text" value=0></td>
						</tr>
						<tr>
							<th>판매수</th>
							<td><input type="text" value=0></td>
						</tr>



					</tbody>



				</table>
				<div class="col-md-4 col-sm-6" style="margin: 30px 150px;">
					<div class="wf100 comment-form">

						<ul>

							<li class="w3 np"><button onclick="openInstP()"
									class="post-btn" style="width: 100px; margin: 0 150px;">작물등록</button></li>
							<li class="w3 np"><button onclick="document.getElementById('lightInstP').style.display='none';document.getElementById('fadeInstP').style.display='none'"
									class="post-btn" style="width: 100px; margin: 0 150px;">취소</button></li>
						</ul>

					</div>

				</div>
			</form>
		</div>
	</div>
	<div id="fadeInstP" class="black_overlay"></div>




	<!--   JS Files Start  -->
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/js/jquery-migrate-1.4.1.min.js"></script>
	<script src="../resources/js/popper.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/jquery.prettyPhoto.js"></script>
	<script src="../resources/js/isotope.min.js"></script>
	<script src="../resources/js/custom.js"></script>
	<script>
		function openInstP() {
			document.getElementById('lightInstP').style.display = 'block';
			document.getElementById('fadeInstP').style.display = 'block';
		}
	</script>
</body>


</html>