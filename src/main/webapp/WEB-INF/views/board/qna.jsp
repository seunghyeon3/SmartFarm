<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>QNA 소개</title>
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
</style>
</head>
<body>
	<div class="container p80">
		<div class="col-lg-9 col-md-8 side-widget"></div>
	</div>
	<section class="shop wf100 p80">
		<div class="container">
				<h1>QNA</h1>
			<div class="row" id="prolist">
			<div class="col-md-6 col-sm-6">
         	</div> 
				<div class="col-md-6 col-sm-1">
						<div class="side-search">
							<!-- <form action="adminMemSearch.do" method="post"> -->
								<select class="form-control" id="key" name="key" style="width: 120px; float: left">
									<option value="qna_no">번호</option>
									<option value="mem_email">이메일</option>
								</select> <input  type="search" id="val" name="val" class="form-control" placeholder="검색"
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
					<a href="qnainsertForm.do" class="view-more"
						style="color: white; cursor: pointer;">글쓰기</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="gt-pagination">
						<nav>
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <i class="fas fa-angle-left"></i>
								</a></li>
								<li class="page-item active"><a class="page-link" href="">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <i class="fas fa-angle-right"></i>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>

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
			columns : [{
	              header: '번호',
	              name: 'qna_no',
	            },{
	              header: '제목',
	              name: 'qna_title',
	            },{
	              header: '내용',
	              name: 'qna_con',
	            },{
	              header: '작성자',
	              name: 'mem_name',
	            },{
	              header: '조회',
	              name: 'qna_hit',
	            },{
	              header: '등록일',
	              name:  'qna_day',
	            },{
	              header: '첨부파일',
	              name: 'qna_phy_rou',
	              formatter(object){	            	  
	            	   return object.value != null ? 'Y' : 'N';
	               }
	            },{
	              header: '이메일',
	              name: 'mem_email',
	            },{
	               header: '공개여부',
		           name: 'qna_open_whet',
	              }
	            
		        ,]
		});
         
		// GRID 에 데이터를 입력
		var gridData = ${qna};	
		grid.resetData(gridData);
		
		grid.on('click', (ev) => {
			  if (ev.columnName === 'qna_title') {
				  location.href='qnaselect.do?qna_no='+gridData[ev.rowKey].qna_no
			  }
			});
		// ===== 검색 =====
		function searchFnc() {
			var searchKey = $("#key option:selected").val();
			var searchVal = $("#val").val();
			console.log(searchKey + " : " + searchVal);
			data = JSON.stringify({key : searchKey, val : searchVal});
			fetch("qnaSearch.do",
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