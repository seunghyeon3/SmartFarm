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
							<c:when test="${empty growVOList }">
							
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
								<c:forEach items="${growVOList}" var="grow">
									
									<!--보유 키트 리스트 시작-->
									<div class="event-list-box">
										<ul class="event-meta" style="margin-top: 10px;">
											<li><strong>키트 이름:</strong><h5>${grow.kit_no }</h5></li>
											<li><strong>작물 이름:</strong><h5>딸기</h5></li>
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
									</div>
									<!--보유 키트 리스트 종료-->
									
								</c:forEach>
							</c:otherwise>
						</c:choose>
											
					</div>
				</div>
				<!--주 화면 종료-->
				
				<!--페이징처리 시작-->
				<div class="row">
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
                  </div>
                  <!--페이징처리 종료-->
                  
			</div>
		</div>
	</section>
	<!--본문 종료-->
	
	


</body>
</html>
