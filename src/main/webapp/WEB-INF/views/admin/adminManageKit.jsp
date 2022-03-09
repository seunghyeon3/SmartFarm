<!doctype html>
<%@page import="jdk.jfr.Percentage"%>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../resources/images/favicon.png">
<title>ECO HTML</title>
<!-- CSS FILES START -->


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

.inner {
	width: 150px;
}
</style>
</head>

<body>


	<div class="wrapper">

		<!--Causes Start-->
		<section class="wf100 p80 blog">



			<div class="projects-grid"></div>
			<div class="container">
				<h1>키트 관리</h1>

				<br> <br>
				<div class="row">
					<div class="col-md-7 col-sm-6"></div>

					<div class="col-md-5 col-sm-1">

						<div class="side-search">

							<input type="search" id="searchKit" class="form-control"
								placeholder="키트 이름을 입력하세요" style="margin: 0 10px; float: left;">
							<button onclick="searchKit()">
								<i class="fas fa-search"></i>
							</button>

						</div>
					</div>





					<div class="col-md-12 col-sm-6" style="padding: 20px;">
						<div id="grid" style="width: 100%;"></div>
					</div>
					<div class="col-md-8 col-sm-8"></div>
					<div class="col-md-4 col-sm-4">
						<div class="wf100 comment-form">
							<ul>
								<li class="w3 np"><button onclick="openInstP()"
										class="post-btn" style="width: 200px; margin: 0 150px;">작물등록</button></li>

							</ul>
						</div>
					</div>
				</div>


			</div>
		</section>
		<!--Causes End-->



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





	<div id="fadeInstP" class="black_overlay loading"></div>




	<!--   JS Files Start  -->
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script type="text/javascript">
	//=====팝업창=====
	function openInstP() {
		document.getElementById('lightInstP').style.display = 'block';
		document.getElementById('fadeInstP').style.display = 'block';
	}	
	//표 출력
		var grid = new tui.Grid({
			rowHeight : 'auto',
			el : document.getElementById('grid'),
			rowHeaders : [ 'rowNum' ],//번호 매기기
			scrollX : false,
			scrollY : false,
			columnOptions : {
				rowHeight : 50
			},
			columns : [ {
				header : '키트 번호',
				name : 'kit_no',
				sortingType : 'asc',
				sortable : true,
				display : false
			}, {
				header : '키트 이름',
				name : 'kit_name',
				sortingType : 'desc',
				sortable : true
			}, {
				header : '용도',
				name : 'kit_prpos',
				filter : 'select'
			},
			
			{
				header : '분류',
				name : 'kit_plant_class',
				filter : 'select'
			}, 
			
			{
				header:'조회수',
				name : 'kit_hit',
				sortingType : 'desc',
				sortable : true
				
			},
			{
				header:'판매수',
				name : 'kit_sale_count',
				sortingType : 'desc',
				sortable : true
				
			},
			{
				header : '관리',
				name : 'kit_sale_whet',
				width : '155'

			} ],
			columnOptions : {
				resizable : true
			}

		});

		// 표 데이터
		var gridData = ${kitSelectList};

		//데이터 입력
		grid.resetData(gridData);
		grid.hideColumn('kit_no', 'kit_no');
		
		
		//표에 버튼 넣기
		function changeValue() {
			var table = $('table');

			for (var i = 0; i < gridData.length; i++) {
				console.log(grid.getValue(i, 'kit_sale_whet'));

				if (grid.getValue(i, 'kit_sale_whet') == 'Y') {// 내리기
					var input = '<div class="container" style="text-aline:center;"> <a id="N" data-key='+i+' onclick="cancle(this)" class="read-post" style="padding:0 0px 12px 35px; width: 80px; height:30px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">내리기</a></div>';
					grid.setValue(i, 'kit_sale_whet', input, true);

				} else { //올리기

					var input = '<div class="container" style="text-aline:center;"> <a id="Y" data-key='+i+' onclick="enroll(this)" class="read-post" style="width: 80px; height:30px; padding:0 0px 12px 35px;">올리기</a></div>';

					grid.setValue(i, 'kit_sale_whet', input, true);
				}

			}
		}

		changeValue();

		// Kit 판매 올리기 내리기
		function enroll(e) { // Y
			console.log("올리기!===");
			var id = e.id;//whet
			var key = e.dataset.key;//키트 번호 찾기 위한 rowKey
			kitSaleWhet(id, key);
			location.reload();
		}

		function cancle(e) { // N
			console.log("내리기!===");
			
			var id = e.id;//whet
			var key = e.dataset.key;//키트 번호 찾기 위한 rowKey
			kitSaleWhet(id, key);
			location.reload();
			
		}

		function kitSaleWhet(id, key) {
			console.log("값 나오는지 확인! === " + id);
			console.log(key);//id
			key = key*1;
			console.log(typeof key)
			var kit_no = grid.getValue(key, 'kit_no');
			console.log(kit_no);
			var data = JSON.stringify({kit_no : kit_no, kit_sale_whet: id});
			fetch("adminKitSaleWhet.do",
					{
						method:'post',
						body: data 
					})
					.then(response => response.json())
					.then(function (result) {
						console.log(result.val());
					})
			 
		}
		
		
		
		function searchKit() {
			var search = $("#searchKit").val();
			
			$.ajax({
				type:'post',
				url:"adminKitSearch.do",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data :{
					"kit_name": search
					}
				
			}).done( function (result) {
				console.log(result);
				var res = JSON.parse(result);
				console.log(res);
				grid.resetData(res);
				changeValue();
			} )
			
		}
	</script>
</body>


</html>