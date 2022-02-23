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
	<link href="../resources/css/custom.css" rel="stylesheet">
	<link href="../resources/css/color.css" rel="stylesheet">
	<link href="../resources/css/responsive.css" rel="stylesheet">
	<link href="../resources/css/owl.carousel.min.css" rel="stylesheet">
	<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="../resources/css/prettyPhoto.css" rel="stylesheet">
	<link href="../resources/css/all.min.css" rel="stylesheet">
	<link href="../resources/css/popup.css" rel="stylesheet">
	<link href="../resources/css/table.css" rel="stylesheet">
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />



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
				<h1>회원관리</h1>

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



					<div class="col-md-12 col-sm-6" style="padding: 20px;">
						<div id="grid"></div>
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

	<script>
		//표 출력
		var grid = new tui.Grid({
			el: document.getElementById('grid'),

			scrollX: false,
			scrollY: false,
			columns: [{
				header: '번호',
				name: 'number',
				sortingType: 'desc',
				sortable: true
			}, {
				header: '이메일',
				name: 'memEmail'
			}, {
				header: '이름',
				name: 'memName'
			}, {
				header: '권한',
				name: 'memAthr',
				filter: 'select'
			}, {
				header: '첨부파일',
				name: 'memFmReq'
			}, {
				header: '농부신청',
				name: 'memAthrReq',
				formatter: 'listItemText',
				editor: {
					type: 'select',
					options: {
						listItems: [{
								text: '승인',
								value: '1'
							},
							{
								text: '거절',
								value: '2'
							}
						]
					}
				}
			}]
		});

		// GRID 에 데이터를 입력한다.
		var gridData = [{
			number: '1',
			memEmail: 'aaa@abc.com',
			memName: '홍길동',
			memAthr: '농부',
			memFmReq: 'null',
			memAthrReq: '농부'

		}, {
			number: '2',
			memEmail: 'bbb@abc.com',
			memName: '강길동',
			memAthr: '일반회원',
			memFmReq: '농부신청.jsp',
			memAthrReq: '신청중'

		}, {
			number: '3',
			memEmail: 'ccc@abc.com',
			memName: '김길동',
			memAthr: '일반회원',
			memFmReq: '농부신청.jsp',
			memAthrReq: '거절됨'

		}];


		class CustomTextEditor {
			constructor(props) {
				const el = document.createElement('input');
				const {
					maxLength
				} = props.columnInfo.editor.options;

				el.type = 'text';
				el.maxLength = maxLength;
				el.value = String(props.value);

				this.el = el;
			}

			getElement() {
				return this.el;
			}

			getValue() {
				return this.el.value;
			}

			mounted() {
				this.el.select();
			}
		}


		grid.on('beforeChange', ev => {
			console.log('before change:', ev);
		});

		grid.on('afterChange', ev => {
			console.log('after change:', ev);
		});

		grid.on('dblclick', ev => {
			console.log('double clicked!!');
		});

		/*  grid.on('focusChange', ev => {
		     console.log('change focused cell!', ev);
		   }); */

		grid.resetData(gridData);
	</script>
</body>


</html>