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
<link href="../resources/css/popup.css" rel="stylesheet">
<link href="../resources/css/table.css" rel="stylesheet">
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

input[type="text"], input[type="number"] {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	width: 100%;
}

/* 팝업창 */
h3 {
	display: inline;
	width: 200px;
}

/* 버튼 폼 */
.formBtn>li>button {
	width: 200%;
	margin: 0 150px;
	float: left;
}
</style>



</head>

<body>


	<div class="wrapper">

		<!--Causes Start-->
		<section class="wf100 p80 blog">



			<div class="projects-grid"></div>
			<div class="container">
				<h1>키트 구매현황</h1>
				<br>
				<div class="row">
					<div class="single-post-tags wf50" style="float: left;">
						<a href="#">전체보기</a>&nbsp;&nbsp;&nbsp; <a href="#">과일류</a>&nbsp;&nbsp;&nbsp;
						<a href="#">채소류</a>
					</div>





					<div class="wf100 comment-form">
						<ul>
							<li class="w3">
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus w3"
									style="width: 200px; height: 50px;">
									<input id="startpicker-input" type="text" aria-label="Date">
									<span class="tui-ico-date"></span>
									<div id="startpicker-container" style="margin-left: -1px;"></div>
								</div>
							</li>
							<li class="w3">
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus w3"
									style="width: 200px; height: 50px;">
									<input id="endpicker-input" type="text" aria-label="Date">
									<span class="tui-ico-date"></span>
									<div id="endpicker-container" style="margin-left: -1px;"></div>
								</div>
							</li>
							<li class="w3 np"><button class="post-btn">검색</button></li>

						</ul>
					</div>



					<div class="col-md-8 col-sm-6">
						<canvas id="myChart"></canvas>
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

	<!-- 팝업창 -->
	<div id="lightInstP" class="col-md-12 white_content"
		style="text-align: center; height: 800px; top: 70px;">
		<br>

		<div>

			<h3>작물등록</h3>
			<a href="javascript:void(0)"
				onclick="document.getElementById('lightInstP').style.display='none';document.getElementById('fadeInstP').style.display='none'">Close
			</a>

		</div>
		<br>

		<div class="blog-single-content"
			style="width: 80%; display: inline-block;">
			<form action="">

				<div class="single-post-tags wf50">
					<a href="#">과일류</a>&nbsp;&nbsp;&nbsp; <a href="#">채소류</a>
				</div>

				<table class="GeneratedTable">
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

						<!-- hidden 영역 -->
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

				<div class="wf100 comment-form"
					style="width: 80%; text-align: center;">

					<ul style="width: 100%;">
						<li class="w2 np"></li>
						<li class="w3 np"><button onclick="openInstP()"
								class="post-btn">작물등록</button></li>

						<li class="w3 np">
							<button
								onclick="document.getElementById('lightInstP').style.display='none';document.getElementById('fadeInstP').style.display='none'"
								class="post-btn"
								style="background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">취소</button>
						</li>
					</ul>

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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript">
		//=====차트=====
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context,
				{
					type : 'pie', // 차트의 형태 line, pie, bar
					data : { // 차트에 들어갈 데이터
						labels : [
						//x 축
						'1', '2', '3', '4', '5', '6', '7' ],
						datasets : [ { //데이터
							label : 'test1', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 21, 19, 25, 20, 23, 26, 25 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [
							//경계선 색상
							'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						//경계선 굵기
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});

		function openInstP() {
			document.getElementById('lightInstP').style.display = 'block';
			document.getElementById('fadeInstP').style.display = 'block';
		}

		function manageMember() {

		}
		//=====팝업 달력=====

		var today = new Date();
		var picker = tui.DatePicker.createRangePicker({
			startpicker : {
				date : today,
				input : '#startpicker-input',
				container : '#startpicker-container'
			},
			endpicker : {
				date : today,
				input : '#endpicker-input',
				container : '#endpicker-container'
			}
		});
	</script>
</body>


</html>