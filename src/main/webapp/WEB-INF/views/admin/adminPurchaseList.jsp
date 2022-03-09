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

<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
	

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
	border-left: 0px;
	border-bottom: 0px;
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





					<!-- 팝업 달력 -->
					<div class="col-md-12 comment-form">
						<form action="">
							<ul class="col-md-12" style="display: inline-block;">

								<li class="col-md-3" style="float: left;">
									<div class="tui-datepicker-input tui-datetime-input tui-has-focus w3"
										style="width: 200px; height: 50px; z-index: 3;" >
										<input id="startpicker-input" type="text" aria-label="Date" style="z-index: 2;">
										<span class="tui-ico-date"></span>
										<div id="startpicker-container" style="margin-left: -1px;"></div>
									</div>
								</li>
								<li class="col-md-3" style="float: left;">

									<div class="tui-datepicker-input tui-datetime-input tui-has-focus w3"
										style="width: 200px; height: 50px; z-index: 3;">
										<input id="endpicker-input" type="text" aria-label="Date" style="z-index: 2;">
										<span class="tui-ico-date"></span>

										<div id="endpicker-container" style="margin-left: -1px;"></div>
									</div>
								</li>
								<li class="col-md-2" style="float: left;"><button class="post-btn"
										style="width: 100px; height: 50px;">검색</button></li>
							</ul>

						</form>

					</div>


					<div class="col-md-8 col-sm-6">
						<canvas id="myChart"></canvas>
					</div>



					




				</div>
			</div>
		</section>




	</div>



	<!--   JS Files Start  -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
	
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
		
		

		//=====팝업 달력=====
		var today = new Date();
		var picker = tui.DatePicker.createRangePicker({
			language:'ko',
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