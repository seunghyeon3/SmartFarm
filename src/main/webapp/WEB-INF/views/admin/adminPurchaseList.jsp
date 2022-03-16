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

<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />


<!-- CSS FILES End -->
<style type="text/css">
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
						<a onclick="clickA(this)" id="전체" class="clickBtn" style="margin-left:18px;margin-right:20px;">전체보기</a>
						<a onclick="clickA(this)" id="과일" class="clickBtn" style="margin-right:20px;">과일류</a>
						<a onclick="clickA(this)" id="채소" class="clickBtn" style="margin-right:20px;">채소류</a>
					</div>





					<!-- 팝업 달력 -->
					<div class="col-md-12 comment-form">

						<ul class="col-md-12" style="display: inline-block;">

							<li class="col-md-3" style="float: left;">
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus w3"
									style="width: 200px; height: 50px; z-index: 3;">
									<input id="startpicker-input" type="text" aria-label="Date"
										style="z-index: 2;"> <span class="tui-ico-date"></span>
									<div id="startpicker-container" style="margin-left: -1px;"></div>
								</div>
							</li>
							<li class="col-md-3" style="float: left;">

								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus w3"
									style="width: 200px; height: 50px; z-index: 3;">
									<input id="endpicker-input" type="text" aria-label="Date"
										style="z-index: 2;"> <span class="tui-ico-date"></span>

									<div id="endpicker-container" style="margin-left: -1px;"></div>
								</div>
							</li>
							<li class="col-md-2" style="float: left;"><button
									type="button" class="post-btn"
									style="width: 100px; height: 50px;" onclick="getData('','')">검색</button></li>
						</ul>
					</div>

					<!-- 차트 -->
					
					<div class="col-md-11 col-sm-6">
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
		// 페이지가 load 팝업달력을 설정 + 차트 그리기
		window.onload = function() {
			//=====팝업 달력=====
			var today = new Date();
			var picker = tui.DatePicker.createRangePicker({
				language : 'ko',
				startpicker : {
					date : today,
					input : '#startpicker-input',
					container : '#startpicker-container'
				},
				endpicker : {
					date : today,
					input : '#endpicker-input',
					container : '#endpicker-container'
				},
				selectableRanges : [ [ new Date(2000, 1, 1), new Date() ],
						[ new Date(2000, 1, 1), new Date() ] ]
			});

			//창이 업로드 되면 한달 전으로 미리 설정해두기 
			var now = new Date();
			picker.setStartDate(new Date(now.setMonth(now.getMonth() - 1)));

			//url 받아와서 차트 그리기
			//var url = getUrl('', '');//전체조회로 설정
			getData('', '');

		}

		//a 태그 onclick 하기전... 데이터 가공
		function clickA(e) {
			var kitPlantCalss = e.id;
			
			//버튼 눌린거 css 바꾸기
			var clickBtn = document.querySelectorAll('.clickBtn');
			for(var i = 0;i<clickBtn.length;i++){
				clickBtn[i].style.backgroundColor = '#f8f9fa';// '#66bb6a';
				clickBtn[i].style.color = '#666666';//'#f8f9fa';
				
			}
			
			document.getElementById(kitPlantCalss).style.backgroundColor = '#66bb6a';
			document.getElementById(kitPlantCalss).style.color = '#f8f9fa';
			
			if(e.id=='전체'){
				kitPlantCalss='';
			}
			//차트 그리기
			getData(kitPlantCalss, '');
		}

		//달력에서 focusout 되면 실행될 함수
		function checkCal(kitPlantClass) {
			var startDate = $("#startpicker-input").val();
			var endDate = $("#endpicker-input").val();
			var url = "adminGetPurchaseList.do?kit_prpos=" + kitPrpos
					+ "&kit_plant_class=" + kitPlantClass + "&start_date="
					+ startDate + "&end_date=" + endDate;

		}

		// ===== 작물과 용도를 설정하면 데이터 받아와서 차트 그리는 함수 =====
		function getData(kitPlantClass, kitPrpos) {

			var startDate = $("#startpicker-input").val();
			var endDate = $("#endpicker-input").val();

			console.log(startDate + " : " + endDate);

			var url = "adminGetPurchaseList.do?kit_prpos=" + kitPrpos
					+ "&kit_plant_class=" + kitPlantClass + "&start_date="
					+ startDate + "&end_date=" + endDate;

			console.log(url);

			$.ajax({
				url : url,
				method : 'get',
				dataType : 'json',
				contentType : "application/json; charset=utf-8",
				success : function(res) {
					console.log(res);
					// 데이터 받아와서 그리기
					createChart(res);
				}

			});
		}

		//제일 처음에는 전체 값으로 초기화하기

		// ===== 차트 그리는 함수 =====
		var kitName = []; // 키트 이름
		var kitPurCount = []; // 키트 판매수
		var myChart; //차트
		var context;

		// 가져온 리스트로 차트 그리기
		function createChart(kitList) {
			//데이터 초기화시키기
			kitName = []; // 키트 이름
			kitPurCount = []; // 키트 판매수
			if (window.chartObj != undefined) {
				window.chartObj.destroy();
			}

			for ( var li in kitList) {
				kitName.push(kitList[li].kit_name);
				kitPurCount.push(kitList[li].pur_his_sale_count);
			}

			//=====차트=====
			context = document.getElementById('myChart').getContext('2d');
			window.chartObj = new Chart(context, {
				type : 'bar', // 차트의 형태 line, pie, bar
				data : { // 차트에 들어갈 데이터
					labels : kitName,//x 축
					datasets : [ { //데이터
						
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : kitPurCount, //x축 label에 대응되는 데이터 값
						backgroundColor : [
						//색상
						'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)',
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
								'rgba(255, 159, 64, 1)',
								'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					//경계선 굵기
					} ]
				},
				options : {
					legend: {//차트제목을 숨기기 위함
				        display: false
				    },
				    tooltips: {
				        callbacks: {
				           label: function(tooltipItem) {
				                  return tooltipItem.yLabel;
				           }
				        }
				    },
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}

						} ]
					}
				}
			});
		}

		// 달력 입력후 focus out 이벤트 발생시키기
		//var startPicker = document.getElementById('startpicker-input')
	</script>
</body>


</html>