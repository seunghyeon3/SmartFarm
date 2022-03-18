<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>공지사항 메인 페이지</title>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #5cb85c;
	cursor: pointer;
	border: 1px solid #4cae4c;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.filebox label:hover {
	background-color: #6ed36e;
}

.filebox label:active {
	background-color: #367c36;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.full {
	display: inline-block;
	text-align: center;
}

.filebox {
	float: right;
}

.form-control {
	float: right;
}
</style>
</head>
<body>
	<div class="container p80">
		<div class="col-lg-9 col-md-8 side-widget"></div>
	</div>
	<section class="shop wf100 p80">
		<div class="container">
			<h1>공지 사항</h1>
			<div class="row" id="prolist">
				<div class="col-md-6 col-sm-6"></div>
				<div class="col-md-6 col-sm-1">
					<div class="side-search">
						<!--<form action="noticeSearch.do" method="post"> -->
						<select class="form-control" id="key" name="key"
							style="width: 120px; float: left">
							<!-- <option value="notice_day">등록일</option> -->
							<option value="notice_title">제목</option>
						</select> <input type="search" id="val" name="val" class="form-control"
							placeholder="검색"
							style="margin: 0 10px; width: 380px; float: left;">
						<button onclick="searchFnc()" type="submit">
							<i class="fas fa-search"></i>
						</button>
						<!-- </form> -->
					</div>
				</div>
				<div class="col-md-12 col-sm-6" style="padding: 20px;">
					<!-- grid 불러오기 -->
					<div id="grid"></div>
					<sec:authorize access="hasRole('ADMIN')">
					<a href="noticeinsertForm.do" class="view-more"
						style="color: white; cursor: pointer;">글쓰기</a>
					</sec:authorize>
				</div>
				</div>
			</div>
	</section>
    
    <div></div>
	<!-- 4 -->
	<script>
		//표 출력
		var grid = new tui.Grid({
			rowHeight : 'auto',
			rowWidth : 'auto',
			el : document.getElementById('grid'),
			rowHeaders : [ 'rowNum' ],//번호 매기기
			scrollX : false,
			scrollY : false,
			columnOptions : {
				rowHeight : 50
			},
			columns : [{
	              header: '제목',
	              name: 'notice_title',
	              width: 620
	            },{
	               header: '등록일',
	               name: 'notice_day',
	               width: 270
	            },{
	               header: '첨부파일',
	               name: 'notice_img',
	               width: 100,
	               formatter(object){	            	  
	            	   return object.value != null ? 'Y' : 'N';}
	            },{
		               header: '조회',
		               name: 'notice_hit',
		               width: 70
		            }],
	            columnOptions : {
					resizable : true
				},
				pageOptions: {
			        useClient: true,
			        perPage: 10
			    }
		});

		// GRID 에 데이터를 입력
		var gridData = ${notice};	
		grid.resetData(gridData);
		
		grid.on('click', (ev) => {
			  if (ev.columnName === 'notice_title') {
				  location.href='noticeselect.do?notice_no='+gridData[ev.rowKey].notice_no
			  }
			});
		// ===== 검색 =====
		function searchFnc() {
			var searchKey = $("#key option:selected").val();
			var searchVal = $("#val").val();
			console.log(searchKey + " : " + searchVal);
			data = JSON.stringify({key : searchKey, val : searchVal});
			fetch("noticeSearch.do",
					{
						method:'POST',
						body : data
							
					})
				.then(response => response.json())
				.then(function (result) {
					//console.log(result);
					grid.resetData(result);
				})
		}
 </script>
</body>
</html>