<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 페이지</title>
<!-- 게시판 리스트 출력 하는 부분 -->

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
</style>
</head>
<body>
	<%-- ${archieve} --%>
	<div class="container p80">
		<div class="col-lg-9 col-md-8 side-widget"></div>
	</div>
	<section class="shop wf100 p80">
		<div class="container">
			<h1>자료실</h1>
			<div class="row" id="prolist">
				<div class="col-md-6 col-sm-6"></div>
				<div class="col-md-6 col-sm-1">
					<div class="side-search">
						<!--<form action="archieveSearch.do" method="post"> -->
						<select class="form-control" id="key" name="key"
							style="width: 120px; float: left">
						<!-- 	<option value="archieve_day">등록일</option> -->
							<option value="archieve_title">제목</option>
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
					<a href="archieveinsertForm.do" class="view-more"
						style="color: white; cursor: pointer;">글쓰기</a>
						</sec:authorize>
					
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
			columnOptions : {
				rowHeight : 50
			},
			columns : [{
	              header: '제목',
	              name: 'archieve_title',
	              width: 620
	              
	            },{
	               header: '등록일',
	               name: 'archieve_day',
	               align: 'center',
	               width: '270',
	               sortingType : 'desc',
					sortable : true
	            },{
	               header: '첨부파일',
	               name: 'archieve_img',
	               align: 'center',
	               width: 100,
	               formatter(object){	            	  
	            	   return object.value != null ? 'Y' : 'N';}
	            },{
		               header: '조회',
		               name: 'archieve_hit',
		               align: 'right',
		               width: '70',
		               sortingType : 'desc',
						sortable : true
		        }],
			columnOptions : {
				resizable : true,
			},
			pageOptions: {
		        useClient: true,
		        perPage: 7
		    }
			
		});

		// GRID 에 데이터를 입력
		var gridData = ${archieve};	
		grid.resetData(gridData);
		grid.on('mouseover', (ev) => {
	         document.getElementById('grid').style.cursor = "pointer";
	      });
		grid.on('click', (ev) => {
			/*  if('${SPRING_SECURITY_CONTEXT.authentication.principal}' == ''){
		         alert('로그인이 필요한 서비스입니다');
			 }else{ */
			  if (ev.columnName === 'archieve_title'){
				  location.href='archieveselect.do?archieve_no='+gridData[ev.rowKey].archieve_no
			  }
			 
			});
		// ===== 검색 =====
		function searchFnc() {
			var searchKey = $("#key option:selected").val();
			var searchVal = $("#val").val();
			console.log(searchKey + " : " + searchVal);
			data = JSON.stringify({key : searchKey, val : searchVal});
			fetch("archieveSearch.do",
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
