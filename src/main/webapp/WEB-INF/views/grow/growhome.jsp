<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>how to grow</title>

</head>
<body>
	<!--본문 시작-->

	<section class="wf100 p80 events">
		<div class="event-list-two">
			<div class="container">

				<!--주 화면 시작-->
				<div class="row">
					<div class="col-lg-12 col-md-12">

						<c:choose>
							<c:when test="${empty list }">
							
								<!--보유 키트가 없을 때 시작-->
								<div class="event-list-box">
									<ul class="event-meta" style="margin-top: 10px;">
										<li><strong>키트 이름:</strong><h5></h5></li>
										<li><strong>작물 이름:</strong><h5></h5></li>
									</ul>
									<div class="event-txt" style="width: 83%; padding: 0;">
										<div class="campaign-txt" style="margin-left: 10px; padding: 0;">
											<ul class="funds">
												<li class="text-left">재배 시작일<strong></strong></li>
												<li class="text-center">진행률<strong></strong></li>
												<li class="text-right">예상 종료일<strong></strong></li>
											</ul>
											<div class="progress">
												<div class="progress-bar" role="progressbar"
													style="width: 0%" aria-valuenow="55" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											<div style="float: right;">
												<h5 style="display: inline;">보유한 키트가 없습니다</h5>
												<a href="#" class="dn-btn">키트 구매 바로가기</a>
											</div>
										</div>
									</div>
								</div>
								<!--보유 키트가 없을 때 종료-->
								
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="grow">
									<!--보유 키트 리스트 시작-->
									<div id=${grow.pur_his_order_no } class="event-list-box">
										<ul class="event-meta" style="margin-top: 10px;">
											<li><strong>키트 번호:</strong><h5>${grow.pur_his_order_no }</h5></li>
											<li><strong>작물 이름:</strong><h5>${grow.kit_plant_name}<br>(${grow.kit_prpos})</h5></li>
										</ul>
										<div class="event-txt" style="width: 83%; padding: 0;">
											<div class="campaign-txt" style="margin-left: 10px; padding: 0;">
												<ul class="funds">
													<li id="startDate" class="text-left">재배 시작일<strong id = "sd"></strong></li>
													<li class="text-center">진행률<strong id = "pc">정보를 받아오는 중..</strong></li>
													<li class="text-right">예상 종료일<strong id = "ed"></strong></li>
												</ul>
												<div class="progress">
													<div id = "pbar" class="progress-bar" role="progressbar"
														style="width: 0%" aria-valuenow="55" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
												<div style="float: right;">
												<a href="control.do?no=${grow.pur_his_order_no }" class="dn-btn">재배 관리</a>
												<a href="#" class="dn-btn">실시간 정보</a>
												<a href="log.do?no=${grow.pur_his_order_no }" class="dn-btn">일별 로그</a>
												</div>
											</div>
										</div>
									</div>
									<!--보유 키트 리스트 종료-->
								</c:forEach>
							</c:otherwise>
							
							
							
							
							
<%-- 							
							<c:otherwise>
								<c:forEach items="${list}" var="grow">
								<c:choose>
									<c:when test="${not empty grow.grow_status}">
									<!--보유 키트 리스트 시작-->
									<div class="event-list-box">
										<ul class="event-meta" style="margin-top: 10px;">
											<li><strong>키트 번호:</strong><h5>${grow.pur_his_order_no }</h5></li>
											<li><strong>작물 이름:</strong><h5>${grow.kit_plant_name}<br>(${grow.kit_prpos})</h5></li>
										</ul>
										<div class="event-txt" style="width: 83%; padding: 0;">
											<div class="campaign-txt" style="margin-left: 10px; padding: 0;">
												<ul class="funds">
													<li id="startDate" class="text-left">재배 시작일<strong>${grow.grow_status }</strong></li>
													<li class="text-center">진행률<strong>${grow.percent}%</strong></li>
													<li class="text-right">예상 종료일<strong>${grow.end_estimate }</strong></li>
												</ul>
												<div class="progress">
													<div class="progress-bar" role="progressbar"
														style="width: ${grow.percent}%" aria-valuenow="55" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
												<div style="float: right;">
												<a href="#" class="dn-btn">재배 관리</a>
												<a href="#" class="dn-btn">실시간 정보</a>
												<a href="#" class="dn-btn">일별 로그</a>
												</div>
											</div>
										</div>
									</div>
									<!--보유 키트 리스트 종료-->
									</c:when>
 									
									<c:otherwise>
									<!--보유 키트 리스트 시작-->
									<div class="event-list-box">
										<ul class="event-meta" style="margin-top: 10px;">
											<li><strong>키트 번호:</strong><h5>${grow.pur_his_order_no }</h5></li>
											<li><strong>작물 이름:</strong><h5>${grow.kit_plant_name}<br>(${grow.kit_prpos})</h5></li>
										</ul>
										<div class="event-txt" style="width: 83%; padding: 0;">
											<div class="campaign-txt" style="margin-left: 10px; padding: 0;">
												<ul class="funds">
														<li class="text-left">재배 시작일<strong></strong></li>
														<li class="text-center">진행률<strong>재배를 시작해 주세요</strong></li>
														<li class="text-right">예상 종료일<strong></strong></li>
												</ul>
												<div class="progress">
													<div class="progress-bar" role="progressbar"
														style="width: 0%" aria-valuenow="55" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
												<div style="float: right;">
												<a href="#" class="dn-btn">재배 관리</a>
												<a href="#" class="dn-btn">실시간 정보</a>
												<a href="#" class="dn-btn">일별 로그</a>
												</div>
											</div>
										</div>
									</div>
									<!--보유 키트 리스트 종료-->
									</c:otherwise>
							</c:choose>		
								</c:forEach>
							</c:otherwise>
 --%>							
							
							
						</c:choose>
											
					</div>
				</div>
				<!--주 화면 종료-->
				
				
				<!--페이징처리 시작-->
<!-- 				<div class="row">
                     <div class="col-md-12">
                        <div class="gt-pagination mt20">
                           <nav>
                              <ul class="pagination">
                                 <li class="page-item"> <a class="page-link" href="#" aria-label="Previous"> <i class="fas fa-angle-left"></i> </a> </li>
                                 <li class="page-item"><a class="page-link" href="#">1</a></li>
                                 <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                 <li class="page-item"><a class="page-link" href="#">3</a></li>
                                 <li class="page-item"> <a class="page-link" href="#" aria-label="Next"> <i class="fas fa-angle-right"></i> </a> </li>
                              </ul>
                           </nav>
                        </div>
                     </div>
                  </div> -->
                  <!--페이징처리 종료-->
                  
			</div>
		</div>
	</section>
	
	<!--본문 종료-->
 	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
     
    <script type="text/javascript">
    
		<c:forEach var="growlist" items="${list}">
		    $.ajax({
		        url: "http://${growlist.pur_his_kit_address}/checkGrow",
		        type: 'get',
		        error: function() {
		        	var error = "#"+${growlist.pur_his_order_no}+" #pc";
		        	$(error).html("연결 오류 : 키트를 확인해 주세요");
					toastr.info(${growlist.pur_his_order_no}+"번 키트 오류발생");
		        },
		        success: function(result) {
		        	console.log(result.id);
		        	var sd = "#"+result.id+" #sd";
		        	var pc = "#"+result.id+" #pc";
		        	var ed = "#"+result.id+" #ed";
		        	var pbar = "#"+result.id+" #pbar";
		        	$(sd).html(result.startDate);
		        	$(pc).html(result.percent+"%");
		        	$(ed).html(result.end);
		        	$(pbar).css("width",result.percent+"%");
/* 		        	id = "#"+result.id+" #pc";
		        	$(id).html(result.percent);
		        	id = "#"+result.id+" #ed";
		        	$(id).html(result.end); */
		        }
		    })	
		</c:forEach>
		
    
    </script>
    
    
 <!-- 
	<script type="text/javascript">
	
		let list = [];
		<c:forEach var="growList" items="${growVOList}" varStatus="status">
		list.push("${growList}");
		</c:forEach>

	    $(function () {
	    	/* console.log(list); */
	        let container = $('#pagination');
	        container.pagination({
	            dataSource: list,
	            callback: function (data, pagination) {
/* 	            	
	                var dataHtml = '<ul class="lastest-products">';

	                $.each(data, function (index, item) {
	                    dataHtml += '<li><img src="resources/images/flp1.jpg" alt=""><strong><a href="#">' + item.free_title + '</a></strong><span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>';
	                });

	                dataHtml += '</ul>';

	                $("#data-container").html(dataHtml);
	                 */
					var dataHtml =  '<ul class="event-meta" style="margin-top: 10px;">';
					
					$.each(data, function (index, item) {
						dataHtml = '<li><strong>키트 이름:</strong><h5>' + ${grow.kit_no } + '</h5></li><li><strong>작물 이름:</strong><h5>딸기</h5></li>
					})
					</ul>
					<div class="event-txt" style="width: 83%; padding: 0;">
						<div class="campaign-txt" style="margin-left: 10px; padding: 0;">
							<ul class="funds">
								<li class="text-left">재배 시작일<strong>2022년 02월 20일 09:30am</strong></li>
								<li class="text-center">진행률<strong>33%</strong></li>
								<li class="text-right">예상 종료일<strong>2022년 03월 03일 09:30am</strong></li>
							</ul>
							<div class="progress">
								<div class="progress-bar" role="progressbar"
									style="width: 33%" aria-valuenow="55" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
							<div style="float: right;">
							<a href="#" class="dn-btn">재배 관리</a>
							<a href="#" class="dn-btn">실시간 정보</a>
							<a href="#" class="dn-btn">일별 로그</a>
							</div>
						</div>
					</div>
	            },
	            pageSize: 8
	        })
	    })
	
	</script>
 -->

</body>
</html>
