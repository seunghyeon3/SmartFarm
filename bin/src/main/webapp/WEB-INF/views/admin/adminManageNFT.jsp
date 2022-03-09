<!doctype html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
				<h1>NFT 거래 현황</h1>

				<br> <br>
				<div class="row">
					<div class="col-md-8 col-sm-6"></div>

					<!-- 검색바 -->
					<div class="col-md-4 col-sm-1">

						<div class="side-search">
							
							<!--<input type="search" class="form-control" placeholder="검색" style="margin: 0 10px;">
							<button>
								<i class="fas fa-search"></i>
							</button>
							-->
						</div>
					</div>

					<!-- 테이블 -->
					<div class="col-md-12 col-sm-6" style="padding: 20px;">
						<div id="grid"></div>
					</div>

				</div>
			</div>

		</section>
		<!--Causes End-->


	</div>



	<!--   JS Files Start  -->

	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

	<script>
		// GRID 를 생성한다.
		// 나이는 수정할 수 있도록 설정한다.
		var grid = new tui.Grid({
			el: document.getElementById('grid'),
			scrollX: false,
			scrollY: false,
			rowHeaders : [ 'rowNum' ],//번호 매기기
			columns: [{
					header: '키트이름',
					name: 'kit_name',
					filter: 'select'
				}, {
					header: '작물종류',
					name: 'kit_plant_class',
					filter: 'select'
				}, {
					header: '등급',
					name: 'grow_diary_grd',
					filter: 'select'
				}, {
					header: '개수',
					name: 'kit_sum',
					sortingType: 'desc',
					sortable: true
				}

			]
		});

		// GRID 에 데이터를 입력한다.
		var arrData = ${nftSelectList};
		grid.resetData(arrData);
	</script>


</body>


</html>