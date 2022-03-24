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
	.paginationjs .paginationjs-pages li.active>a {
		background: rgb(102, 187, 106) !important;
	}	
	.paginationjs {
		display: flex !important;
		justify-content: center !important;
	}
	td {
		padding: 5px !important;
	}
	thead td {
		text-align: center !important;
		background-color: #E0E0E0 !important;
	}
</style>
</head>
<body>



	<!--본문 시작-->

	<section class="wf100 p80 events">
		<div class="event-list-two">
			<div class="container">
				<div class="row">
				
					<div class="col-lg-9 col-md-8">

						<!--주 화면 시작-->
                        <div class="blog-single-content">
							<h5>자유게시판</h5><br>
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
				
						<!--글쓰기 버튼 시작-->
						<sec:authorize access="isAuthenticated()">
							<div class="col-md-12">
								<a href="freeInsertForm.do" class="view-more" style="color: white; cursor: pointer;">글쓰기</a>
							</div>
						</sec:authorize>
						<!--글쓰기 버튼 종료-->
					</div>
			<!--TEST-->
					<div class="col-lg-3 col-md-4">
                      <div class="sidebar">
                          <!--Widget Start-->
                    	  <div class="side-widget">
           				  	 <h6>태그</h6>
           				 	 <div class="single-post-tags"> 
           				 		<a href="#">친환경</a> <a href="#"> Plant Ecology </a> <a href="#"> Wildlife </a> <a href="#"> Eco Ideas </a> <a href="#"> 자원관리 </a> <a href="#"> 물 </a> <a href="#"> Forest Planting </a> <a href="#"> Donation </a><a href="#"> 재활용 </a> 
           					 </div>
          				  </div>
          				  <!--Widget End--> 
                         <!--Widget Start-->
                         <div class="side-widget text-widget">
                            <h6>최신글</h6>
                            <c:forEach items="${recentlyFree}" var="free" begin="0" end="5">
                           	 <a style="width:200px;white-space: nowrap;overflow:hidden;text-overflow:ellipsis;" href="freeOne.do?free_no=${free.free_no}">${free.free_title}</a>
                            </c:forEach>
                         </div>
                         <!--Widget End--> 
                         <!--Widget Start-->
                         <div class="side-widget">
                            <h6>NFT경매 목록</h6>
                            <ul class="lastest-products">
						<c:forEach items="${aucnEnable }" var="aucn" begin="0" end="3">
                               <li> 
							<img src="<c:url value='../upload/${aucn.nft_img }'/>" alt="" style="width: 45px; height: 60px;">
                               	<strong>
                               		<a href="aucnDetail.do?aucnNo=${aucn.aucn_no}">${aucn.aucn_title}</a>
							</strong> <span class="pdate">
							<i class="fas fa-calendar-alt"></i>현재 가격 : ${aucn.now_bid }</span> </li>
                            	</c:forEach>
                            </ul>
                         </div>
                         <!--Widget Start--> 
                         <!--Widget Start-->
                         <div class="side-widget project-list-widget">
                            <h6>재배 바로가기</h6>
                            <ul>
                            	<c:forEach items="${kitList}" var="grow">
                               <li><a href="control.do?no=${grow.pur_his_order_no }">${grow.kit_plant_name}</a></li>
                               </c:forEach>
                            </ul>
                         </div>
                         <!--Widget End--> 
                      </div>
                   </div>
			<!--TEST END-->
					
				</div>
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
	                	let date_free = new Date(item.free_day);
	            	    trHtml += '<tr style="font-size: 13px; cursor:pointer;" id=' + item.free_no + '>';
	                	trHtml += '<td style="font-size: 13px; text-align: center; width: 30px; background-image: url(resources/images/flp1.jpg); background-repeat: no-repeat; background-size: 100% 100%;">' + item.free_no + '</td>';
	                	trHtml += '<td style="font-size: 13px; width: 230px;">' + item.free_title + '</td>';
	                	trHtml += '<td style="font-size: 13px; text-align: center; width: 50px;">' + item.mem_name + '</td>';
	                	trHtml += '<td style="font-size: 13px; text-align: center; width: 130px;"><span class="pdate"><i class="fas fa-calendar-alt"></i>' + date_free.toLocaleString() + '</span></td>';
	                	trHtml += '<td style="font-size: 13px; text-align: center; width: 50px;">' + item.free_hit + '</td>';
	            	    trHtml += '</tr>';
/* 	                    dataHtml += '<td><img src="resources/images/flp1.jpg" alt=""><strong><a href="#">' + item.free_title + '</a></strong><span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>'; */
	                });
	                $("#free").html(trHtml);
	            },
	            pageSize: 20
	        })
	        
	        $("#free").on("click", "tr", function(event) {
				location.href='freeOne.do?free_no='+event.currentTarget.id;	
			});

	    })
	
	</script>

</body>
</html>
