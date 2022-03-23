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

						<!--<div class="single-post-tags wf50" style="float: left;">
							<a href="#">전체</a>&nbsp;&nbsp;&nbsp; <a href="#">농부</a>&nbsp;&nbsp;&nbsp;
							<a href="#">일반회원</a> &nbsp;&nbsp;&nbsp; <a href="#">농부신청</a>
						</div>-->
					</div>

					<div class="col-md-6 col-sm-1">
						<div class="side-search">
							<select class="form-control" id="key" name="key"
								style="width: 120px; float: left">
								<option value="mem_name">이름</option>
								<option value="mem_email">이메일</option>
							</select> <input type="search" id="val" name="val" class="form-control"
								placeholder="검색"
								style="margin: 0 10px; width: 380px; float: left;">
							<button onclick="searchFnc()" type="submit">
								<i class="fas fa-search"></i>
							</button>

						</div>
					</div>


					<!-- 표 출력 -->
					<div class="col-md-12 col-sm-6" style="padding: 20px; z-index: 1;">
						<div id="grid"></div>
					</div>


				</div>
			</div>
		</section>
		<!--Causes End-->







	</div>

	<!-- 팝업창 -->
	<div id="lightInstP" class="col-md-12 white_content"
		style="text-align: center; height: 800px; top: 70px; z-index: 3;">
		<br>

		<div class="container">

			<h3>농부 승인 <a href="javascript:void(0)" style="float:right; font-size: medium;"
				onclick="document.getElementById('lightInstP').style.display='none';document.getElementById('fadeInstP').style.display='none'">Close
			</a></h3>

			

			<div id="inner"></div>

		</div>
		<br>


	</div>


	<div id="fadeInstP" class="loading black_overlay" style="z-index: 2;"></div>

	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script type="text/javascript"
		src="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.js"></script>
	<script>
	
		//표 출력

		var grid = new tui.Grid({
			rowHeight : 'auto',
			rowWidth : 'auto',
			el : document.getElementById('grid'),			 

			rowHeaders : [ 'rowNum' ],//번호 매기기
			rowHeight : 'auto',
			rowWidth : 'auto',
			scrollX : false,
			scrollY : false,
			
			columns : [ {
				header : '이메일',
				name : 'mem_email'
			}, {
				header : '이름',
				name : 'mem_name'
			}, {
				header : '권한',
				name : 'mem_athr',
				filter : 'select'
			}, {
				header : '첨부파일',
				name : 'mem_fm_req'
			}, {
				header : '농부신청',
				name : 'mem_fm_result',
				filter : 'select'

			} ],
			pageOptions: {
		        useClient: true,
		        perPage: 5
		    }
			
		
		});


		// GRID 에 데이터를 입력
		var gridData = ${memberSelectList}
		grid.resetData(gridData);

		// 농부신청을 한 사람들만 마우스오버하면 커서 포인터로 바꾸기
		grid.on('mouseover', (ev) => {
			
			 if(!(grid.getValue(ev.rowKey, "mem_fm_req") == "Reject") && !(grid.getValue(ev.rowKey, "mem_fm_req") === ' ') && !(grid.getValue(ev.rowKey, "mem_athr") == "농부")){
				
				var toast = grid.getElement(ev.rowKey, "mem_fm_req");
				$(toast).closest("tr").css({"cursor": "pointer"});
				
			} 
			
		});
		
		
		//클릭하면 팝업창 띄우기
		grid.on('dblclick', (ev) => {
			
			if(!(grid.getValue(ev.rowKey, "mem_fm_req") == "Reject") && !(grid.getValue(ev.rowKey, "mem_fm_req") === ' ') && !(grid.getValue(ev.rowKey, "mem_athr") == "농부")){
			  
				document.getElementById('lightInstP').style.display = 'block';
				document.getElementById('fadeInstP').style.display = 'block';
				document.getElementById('inner').remove();
				
				//버튼이 들어있는 div
				var input= '<div class="container" id="'+grid.getValue(ev.rowKey, "mem_email")+'BtnContainer" style="text-aline: center; padding-top: 50px; margin:0;">'
	
				//승인 버튼 + 거절버튼
				+ '<div class="single-post-tags" style="padding:0;margin:0">'
				+ '<a onclick="accept(this)" id="'
				+ grid.getValue(ev.rowKey, "mem_email")
				+ '" style="background-color:#66bb6a;color:#ffffff;" >승인</a>&nbsp; <a onclick="reject(this)" id="'
				+ grid.getValue(ev.rowKey, "mem_email")
				+ '" style="background-color:#e11f3e;color:#ffffff;">거절</a>'
				+ '</div>'
	
				+ '</div>';
				
				$('#lightInstP').append(
						$('<div>').attr("id", "inner").append(
								 /* $('<img>', {'src':${pageContext.request.contextPath}'/resources/images/'+grid.getValue(ev.rowKey, "mem_fm_req")}) */
								  $('<img>', {'src':'../../upload/' + grid.getValue(ev.rowKey, "mem_fm_req")}).css('width', '100%') 
								  
								).append(input)
							);
				//농부신청 클릭시 페이지 최상단으로 이동.
				window.scrollTo(0, 0);
			
			}
			
		});//on dblclick
		
		// 농부승인 - 승인
		function accept(e) {
			
			console.log(e.id);
			
			var data = JSON.stringify({mem_email : e.id});
			
			fetch("adminRequstAccept.do",
					{
						method:'POST',
						body: data,
						headers: {
					            'Content-Type': 'application/json',
					            // 'Content-Type': 'application/x-www-form-urlencoded',
					        }
					})
					location.reload();
			
		}
		
		//농부승인 - 거절
		function reject(e) {
			
			console.log(e.id);
			
			var data = JSON.stringify({mem_email : e.id});
			
			fetch("adminRequstReject.do",
					{
						method:'POST',
						
						body: data
					})
					location.reload();
			
		}
		
		// ===== 검색 =====
		function searchFnc() {
			var searchKey = $("#key option:selected").val();
			var searchVal = $("#val").val();
			console.log(searchKey + " : " + searchVal);
			data = JSON.stringify({key : searchKey, val : searchVal});
			fetch("adminMemSearch.do",
					{
						method:'POST',
						body : data
							
					})
				.then(response => response.json())
				.then(function (result) {
					//console.log(result);
					grid.resetData(result);
				});
			
		}
		
	</script>
</body>


</html>