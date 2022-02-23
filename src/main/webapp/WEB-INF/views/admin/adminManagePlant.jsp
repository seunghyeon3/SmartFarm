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
<link rel="icon" href="../resources/images/favicon.png">
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
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />



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
				<h1>키트 관리</h1>

				<br> <br>
				<div class="row">
					<div class="col-md-6 col-sm-6">

						<div class="single-post-tags wf50" style="float: left;">
							<a href="#">전체</a>&nbsp;&nbsp;&nbsp; <a href="#">농부</a>&nbsp;&nbsp;&nbsp;
							<a href="#">일반회원</a> &nbsp;&nbsp;&nbsp; <a href="#">농부신청</a>
						</div>
					</div>

					<div class="col-md-6 col-sm-1">

						<div class="side-search">
							<form>
								<select class="form-control" style="width: 120px; float: left">
									<option>이름</option>
									<option>이메일</option>
								</select> <input type="search" class="form-control" placeholder="검색"
									style="margin: 0 10px; width: 380px; float: left;">
								<button>
									<i class="fas fa-search"></i>
								</button>
							</form>
						</div>
					</div>


					<!-- 표 출력 -->
					<div class="col-md-12 col-sm-6" style="padding: 20px;">
						<div id="grid"></div>
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

		<div class="container">

			<h3>농부 승인</h3>

			<a href="javascript:void(0)"
				onclick="document.getElementById('lightInstP').style.display='none';document.getElementById('fadeInstP').style.display='none'">Close
			</a>

			<div id="inner"></div>

		</div>
		<br>


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
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

	<script>
		//표 출력
		var grid = new tui.Grid({
			rowHeight : 'auto',
			rowWidth : 'auto',
			el : document.getElementById('grid'),
			rowHeaders : [ 'rowNum' ],//번호 매기기
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '작물이름',
				name : 'kit_name'
			}, {
				header : '용도',
				name : 'kit_prpos',
				filter : 'select'
			}, {
				header : '분류',
				name : 'kit_plant_class'
			}, {
				header : '관리',
				name : 'kit_sale_whet',
				filter : 'select'

			} ]
		});

		// GRID 에 데이터를 입력
		var gridData = ${memberSelectList};

		grid.resetData(gridData);

		//클릭하면 팝업창 띄우기
		grid.on('dblclick', (ev) => {
			
			console.log(grid.getValue(ev.rowKey, "mem_fm_req"));
			console.log(!(grid.getValue(ev.rowKey, "mem_fm_req") == "거절됨") && !(grid.getValue(ev.rowKey, "mem_fm_req") === null))
			
			if(!(grid.getValue(ev.rowKey, "mem_fm_req") == "거절됨") && !(grid.getValue(ev.rowKey, "mem_fm_req") === null)){
			  
				console.log(ev);
				document.getElementById('lightInstP').style.display = 'block';
				document.getElementById('fadeInstP').style.display = 'block';
				document.getElementById('inner').remove();
				
				//버튼이 들어있는 div
				var input= '<div class="container" id="'+grid.getValue(ev.rowKey, "mem_email")+'BtnContainer" style="text-aline: center; padding-top: 50px; margin:0;">'
	
				//승인 버튼 + 거절버튼
				+ '<div class="single-post-tags" style="padding:0;margin:0">'
				+ '<a onclick="accept(this)" id="'
				+ grid.getValue(ev.rowKey, "mem_email")
				+ '" style="background-color:#66bb6a;color:#ffffff;" >승인</a>&nbsp; <a href="#" id="'
				+ grid.getValue(ev.rowKey, "mem_email")
				+ '" style="background-color:#e11f3e;color:#ffffff;">거절</a>'
				+ '</div>'
	
				+ '</div>';
				
				$('#lightInstP').append(
						$('<div>').attr("id", "inner").append(
								$('<img>', {'src':'../resources/images/'+grid.getValue(ev.rowKey, "mem_fm_req")})
								).append(input)
							);
			}
			
		});//on dblclick
		
		

		
		
		
		function accept(e) {
			console.log(e.id);
			fetch("")
		}
	</script>
</body>


</html>