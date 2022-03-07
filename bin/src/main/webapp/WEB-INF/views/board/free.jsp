<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>how to grow</title>
<style type="text/css">
	.lastest-products img {
		width: 68px;
		height: 68px;	
	}
</style>
</head>
<body>



	<!--본문 시작-->

	<section class="wf100 p80 events">
		<div class="event-list-two">
			<div class="container">



				<!--주 화면 시작-->
                        <div class="blog-single-content">

                           <table id="freetable">
	                           <thead id="freehead">
	                              <tr>
	                                 <td>NO.</td>
	                                 <td>제목</td>
	                                 <td>작성자</td>
	                                 <td>날짜</td>
	                                 <td>조회수</td>
	                              </tr>
	                           </thead>
                           	<tbody id="free">

                           	</tbody>
                           </table>

                        </div>
				<!--주 화면 종료-->


				<!--페이징처리 시작-->
				<div class="row">
					<div class="col-md-12">
					        <div id="pagination"></div>
					</div>
				</div>
				<!--페이징처리 종료-->
				
			</div>
		</div>
	</section>
	<!--본문 종료-->
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>

	<script type="text/javascript">
		console.log(${test});
	    $(function () {
	        let container = $('#pagination');
	        container.pagination({
	            dataSource: ${test},
	            callback: function (data, pagination) {
	            	
	            	var thead = '<tr><td>NO.</td><td>제목</td><td>작성자</td><td>날짜</td><td>조회수</td></tr>'
	            	$("#freehead").html(thead);
	            	var trHtml;
	            	
	                $.each(data, function (index, item) {
	            	    trHtml += '<tr style="cursor:pointer;" id=' + item.free_no + '>';
	                	trHtml += '<td style="background-image: url(resources/images/flp1.jpg); background-repeat: no-repeat; background-size: 100% 100%;">' + item.free_no + '</td>';
	                	trHtml += '<td>' + item.free_title + '</td>';
	                	trHtml += '<td>' + item.mem_name + '</td>';
	                	trHtml += '<td><span class="pdate"><i class="fas fa-calendar-alt"></i>' + item.free_day + '</span></td>';
	                	trHtml += '<td>' + item.free_hit + '</td>';
	            	    trHtml += '</tr>';
/* 	                    dataHtml += '<td><img src="resources/images/flp1.jpg" alt=""><strong><a href="#">' + item.free_title + '</a></strong><span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>'; */
	                });
	                $("#free").html(trHtml);
	            },
	            pageSize: 12
	        })
	        
	        $("#freetable").on("click", "tr", function(event) {
				location.href='freeOne.do?free_no='+event.currentTarget.id;	
			});

	    })
	
	</script>

</body>
</html>
