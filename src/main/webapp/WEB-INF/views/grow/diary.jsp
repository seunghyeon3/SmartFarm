<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
<meta charset="UTF-8">
<title>how to grow</title>



</head>
<body>
<script src="https://kit.fontawesome.com/1874543bef.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

<%-- 						<div style="display: inline-block; width: 100%;">
							<ol id="diary" style="margin-top: 20px;">
							    <c:forEach items="${diary}" var="diary">
								<li style="cursor: pointer;" data-route=${diary.grow_diary_log_rou }>${diary.grow_diary_start_day } : ${diary.plant_name }</li>
								</c:forEach>
							</ol>
						</div> --%>
<!-- 					<div id="light" class="col-md-12 white_content">
					</div> -->
						

						<!--재배 관리 화면 출력부 종료-->
						

	<!--본문 시작-->
	<section class="wf100 p80 blog">
		<div class="blog-details">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div id="grid" style="margin-left: 10%; margin-right: 10%;"></div>
						<div id="file" style="display: inline-block; width: 80%; height: 30px; overflow: auto; white-space: nowrap; margin-left: 10%; margin-right: 10%;"></div>
						<div style="display: inline-block; width: 80%; border: 1px solid black; height: 400px; overflow: auto; white-space: nowrap; margin-left: 10%; margin-right: 10%;">
							<ul id="log" class="check-list"></ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		
		
	</section>
	<!--본문 종료-->
	
<script type="text/javascript">

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
			header: '작물이름',
			name: 'plant_name',
			width: 70
			},{
			header: '로그파일(클릭하세요)',
			name: 'grow_diary_log_rou',
			width: 250
			},{
			header: '재배일',
			name: 'grow_diary_start_day',
			width: 150
			},{
			header: '작물등급',
			name: 'grow_diary_grd',
			width: 70
			},{
			header: '작물점수',
			name: 'grow_diary_point',
			width: 'auto'
	        }],
	        columnOptions : {
				resizable : true
			},
			pageOptions: {
		        useClient: true,
		        perPage: 5
		    }
	});

// GRID 에 데이터를 입력
	var gridData = ${diary};	
	grid.resetData(gridData);
	
	grid.on('click', (ev) => {
		  if (ev.columnName === 'grow_diary_log_rou') {
				$.ajax({
					url: 'diaryBody.do',
					type: 'post',
					data: {"route" : gridData[ev.rowKey].grow_diary_log_rou},
					success: function(result) {
			        	console.log(result);
			        	$("#file").empty();
			        	$("#file").html(gridData[ev.rowKey].grow_diary_log_rou);
						$("#log").empty();
						for(i=0; i<result.length; i++) {
							$("#log").append("<li>" + result[i] + "</li>")
						}
					}
				})		  
			}
		});
	
    grid.on('mouseover', (ev) => {
        var toast = grid.getElement(ev.rowKey, "grow_diary_log_rou");
        $(toast).closest("tr").css({"cursor": "pointer"});
  });
/* 
$("#diary").on("click", "li", function(event){ 
	console.log(event.target.dataset.route);
	$.ajax({
		url: 'diaryBody.do',
		type: 'post',
		data: {"route" : event.target.dataset.route},
		success: function(result) {
        	console.log(result);

			$("#log").empty();
			for(i=0; i<result.length; i++) {
				$("#log").append("<li>" + result[i] + "</li>")
			}
		}
	})

})  */

</script>

</body>
</html>
