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
</style>
</head>
<body>


	<div class="wrapper">

		<!--Causes Start-->
		<section class="wf100 p80 blog">



			<div class="projects-grid"></div>
			<div class="container">
				<h1>매출</h1>
				<br>
				<div class="row">
					


					<!-- 팝업 달력 -->
					<div class="col-md-12 comment-form">
						<form action="">
							<ul>
								<li class="col-md-8 np">
									<div
										class="tui-datepicker-input tui-datetime-input tui-has-focus w3"  style="width:200px;height:50px;">
										<input id="startpicker-input" type="text" aria-label="Date">
										<span class="tui-ico-date"></span>
										<div id="startpicker-container" style="margin-left: -1px;"></div>
									</div>
									<span> ~ </span> 
									<div
										class="tui-datepicker-input tui-datetime-input tui-has-focus w3"  style="width:200px;height:50px;">
										<input id="endpicker-input" type="text" aria-label="Date">
										<span class="tui-ico-date"></span>
										<div id="endpicker-container" style="margin-left: -1px;"></div>
									</div>
								</li>


								<li class="col-md-2 np"><button class="post-btn" style="width:100px;height:50px;">검색</button></li>
								
							</ul>


						</form>
					</div>


					<!-- 차트 -->
					<div class="col-md-8 col-sm-6">
						<canvas id="myChart"></canvas>
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
									value='dog' onclick='getCheckboxValue()' />&nbsp;&nbsp;NFT
									현황조회</li>


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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript">
		//=====차트=====
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context, {
			type : 'line', // 차트의 형태 line, pie, bar
			data : { // 차트에 들어갈 데이터
				labels : [
				//x 축
				'1', '2', '3', '4', '5', '6', '7' ],
				datasets : [ { //데이터
					label : '총매출', //차트 제목
					fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data : [ 21, 19, 25, 20, 23, 26, 25 //x축 label에 대응되는 데이터 값
					],
					backgroundColor : [
					//색상

					'rgba(255, 206, 86, 1)' ],
					borderColor : [
					//경계선 색상
					'rgba(255, 206, 86, 1)' ],
					borderWidth : 1
				//경계선 굵기

				}, { //데이터
					label : '키트매출', //차트 제목
					fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data : [ 2, 3, 14, 25, 13, 41, 12 //x축 label에 대응되는 데이터 값
					],
					backgroundColor : [
					//색상
					'rgba(75, 192, 192, 1)', ],
					borderColor : [
					//경계선 색상
					'rgba(75, 192, 192, 1)', ],
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