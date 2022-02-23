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
					<div class="col-md-6 col-sm-6"></div>

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





					<div class="col-md-12 col-sm-6" style="padding: 20px;">
						<div id="grid" style="width: 100%;"></div>
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
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script type="text/javascript">
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
				header : '작물이름',
				name : 'plantName',
				sortingType : 'desc',
				sortable : true
			}, {
				header : '용도',
				name : 'plantPropos',
				filter : 'select'
			}, {
				header : '분류',
				name : 'plantClass',
				filter : 'select'
			}, {
				header : '관리',
				name : 'plantManage',
				width: '155'

			} ],
			columnOptions : {
				resizable : true
			}

		});

		// 표 데이터
		var gridData = [ {
			plantName : '딸기',
			plantPropos : '상업용',
			plantClass : '과일',
			plantManage : 'N'

		}, {
			plantName : '오이',
			plantPropos : '상업용',
			plantClass : '채소',
			plantManage : 'Y'

		}, {
			plantName : '딸기',
			plantPropos : '취미용',
			plantClass : '과일',
			plantManage : 'Y'

		} ];

		//데이터 입력
		grid.resetData(gridData);

		//표에 버튼 넣기
		function changeValue() {
			var table = $('table');

			for (var i = 0; i < gridData.length; i++) {
				console.log(grid.getValue(i, 'plantManage'));
				
				if (grid.getValue(i, 'plantManage') == 'Y') {//내리기
					var input = '<div class="container" style="text-aline:center;"> <a href="#" class="read-post" style="padding:0 0px 12px 35px; width: 80px; height:30px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">내리기</a></div>';
					grid.setValue(i, 'plantManage', input, true);

				} else {//올리기
					var input = '<div class="container" style="text-aline:center;"> <a href="#" class="read-post" style="width: 80px; height:30px; padding:0 0px 12px 35px;">올리기</a></div>';
					grid.setValue(i, 'plantManage', input, true);
				}

			}
		}

		changeValue();
		
	</script>
</body>


</html>