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

<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />

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
						<!-- <form action=""> -->
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
								<div class="tui-datepicker-input tui-datetime-input tui-has-focus w3"
									style="width: 200px; height: 50px; z-index: 3;">
									<input id="endpicker-input" type="text" aria-label="Date"
										style="z-index: 2;"> <span class="tui-ico-date"></span>

									<div id="endpicker-container" style="margin-left: -1px;"></div>
								</div>
							</li>
							<li class="col-md-2" style="float: left;"><button
									id="searchBtn" onclick="searchFnc();" class="post-btn"
									style="width: 100px; height: 50px;">검색</button></li>
						</ul>

						<!-- </form> -->

					</div>


					<!-- 차트 -->
					<div class="col-md-8" id="chart" style="z-index: 1;">
						<canvas id="myChart" style="z-index: 1;"></canvas>
					</div>

					<div class="col-md-1 checkList"></div>
					<!-- 엑셀 출력 폼 -->
					<div class="col-md-3 checkList">
						<div class="wf100 comment-form">

							<ul>
								<li class=""><input type='checkbox' name='export'
									value='sales' />&nbsp;&nbsp;매출</li>
								<li class=""><input type='checkbox' name='export'
									value='kit' />&nbsp;&nbsp;키트 구매현황</li>
								<li class=""><input type='checkbox' name='export'
									value='member' />&nbsp;&nbsp;회원관리</li>
								<li class=""><input type='checkbox' name='export'
									value='plant' />&nbsp;&nbsp;작물관리</li>
								<li class=""><input type='checkbox' name='export'
									value='nft' />&nbsp;&nbsp;NFT 현황조회</li>


								<li class="">
									<form id="form1" name="form1" method="post"
										enctype="multipart/form-data">
										<input type="hidden" id="selectList" name="selectList">
										<button type="button" class="post-btn"
											onclick="doExcelDownloadProcess()">엑셀 다운로드</button>
									</form>

								</li>

							</ul>

						</div>

					</div>

				</div>
			</div>
		</section>
		<!--Causes End-->

	</div>

	<!--   JS Files Start  -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>


	<script type="text/javascript">
		// ===== 차트 넣기 위해 데이터 가공 =====
		var selectList = (${purHisSelectList});
		var myChart;
		var purDay = [];
		var purCountArr = [];
		var plantSum = [];
		var kitSum = [];
		var purSum = [];
		
		// =====  차트 그리는 함수 =====
		function createChart(selectList) {
			
			//데이터 초기화시키기
			purDay = [];
			purCountArr = [];
			plantSum = [];
			kitSum = [];
			purSum = [];
			
			
			for ( var li in selectList) {
			
				purDay.push(selectList[li].pur_his_pur_day);
				purCountArr.push(selectList[li].pur_count);
				plantSum.push(selectList[li].plant_sum);
				kitSum.push(selectList[li].kit_sum);
				purSum.push(selectList[li].pur_sum);
				
			}

			//=====차트=====
			var context = document.getElementById('myChart').getContext('2d');
			myChart = new Chart(context, {
				type : 'line', // 차트의 형태 line, pie, bar
				data : { // 차트에 들어갈 데이터
					labels : purDay, //x 축
					datasets : [ { //데이터
						label : '총매출', //차트 제목
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : purSum,//x축 label에 대응되는 데이터 값
						backgroundColor : [ 'rgb(1, 146, 103)' ],//색상
						borderColor : [ 'rgb(1, 146, 103)' ],
						borderWidth : 1
					//경계선 굵기

					}, { //데이터
						label : '키트매출', //차트 제목
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : kitSum, //x축 label에 대응되는 데이터 값
						backgroundColor : [ 'rgb(0, 200, 151)' ],//색상
						borderColor : [ 'rgb(0, 200, 151)' ],//경계선 색상
						borderWidth : 1
					//경계선 굵기
					}, { //데이터
						label : '작물매출', //차트 제목
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : plantSum, //x축 label에 대응되는 데이터 값
						backgroundColor : [ 'rgb(255, 211, 101)' ],//색상
						borderColor : [ 'rgb(255, 211, 101)' ],//경계선 색상
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
		}
		createChart(selectList);
		
		// ===== 팝업 달력 =====
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

		// ===== 엑셀 다운로드 =====
		function doExcelDownloadProcess() {

			// 체크박스 값 받아와서 jsonArray 생성
			var start = $("#startpicker-input").val();
			var end = $("#endpicker-input").val();
			var checkList = document
					.querySelectorAll("input[type='checkbox']:checked");

			var excelList = new Array();

			if (checkList.length > 0) { //체크를 하나이상 한 경우
				for (var i = 0; i < checkList.length; i++) {
					var chList = new Object();
					var val = checkList[i].value;
					chList.menu = val;
					chList.startDate = start;
					chList.endDate = end;
					excelList.push(chList);

				}
				var list = JSON.stringify(excelList);
				console.log(excelList);
				document.getElementById('selectList').value = list;

				var f = document.form1;
				f.selectList.value = list;
				f.action = "downloadExcelFile.do";
				f.submit();

			} else {//체크를 하나도 안한 경우
				toastr.error("항목을 하나 이상 체크해주세요");

			}

		}
		
		// ===== 차트 지우기 함수 =====
		function resetCanvas() {
			document.getElementById('myChart').remove();
			$('#chart').append('<canvas id="myChart"><canvas>');
			
		}
		
		// ===== 검색 함수 =====
		function searchFnc() {
			
			var startDate = $("#startpicker-input").val();
			var endDate = $("#endpicker-input").val();

			$.ajax({
				url : "adminGetSales.do",
				method : 'post',
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify({
					start_date : startDate,
					end_date : endDate
				}),
				dataType : 'json',
				success : function(res) {
					console.log(res);
					resetCanvas();
					createChart(res);
				}
			})

		}
	</script>


</body>


</html>