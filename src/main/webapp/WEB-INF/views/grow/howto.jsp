<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<!--본문 시작-->
	<section class="wf100 p80 blog">
		<div class="blog-details">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-8">


						<!--재배키트 페이지 사용법 시작 지점-->
						<div class="blog-single-content">
							<h3>똑장이 스마트팜 키트 사용법</h3><br><br>

							<ol class="check-list">
								<li>재배 홈에서 소유중인 키트의 목록과 현황을 확인하고 재배관리, 실시간정보, 일별로그로 바로 이동할 수 있습니다.</li><br><br>
								<li>상업용 키트의 경우 CCTV 영상을 모니터링 할 수 있습니다.</li><br><br>
								<li>재배 관리에서 재배를 시작하고 재배값을 설정 할 수 있습니다.</li><br><br>
								<li>실시간 정보에서 재배중인 작물의 실시간 환경정보를 모니터링할 수 있습니다.</li><br><br>
								<li>일별로그에서 재배중인 작물의 로그를 일자별로 확인 할 수 있습니다.</li><br><br>
								<li>영농일지에서 자신이 재배완료 한 작물의 기록을 확인할 수 있습니다.</li><br><br><br><br>
							</ol>
							
							<h3>How to use the Ddokjangie Smart Farm Kit</h3><br><br>

							<ol class="check-list">
								<li>You can check the list and status of the kits you own in the cultivation home, and go directly to the cultivation management, real-time information, and daily log.</li><br><br>
								<li>For commercial kits, you can monitor CCTV footage.</li><br><br>
								<li>You can start a cultivation and set a cultivation value in Cultivation Management.</li><br><br>
								<li>You can monitor real-time environmental information of crops being grown in real-time information.</li><br><br>
								<li>You can check the log of the crops being grown in the log by day.</li><br><br>
								<li>You can check the records of the crops you have cultivated in the farm log.</li><br><br>
							</ol>

						</div>
						<!--재배키트 페이지 사용법 시작 지점-->


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
							<img src="<c:url value='/resources/nft/merge/${aucn.nft_img }'/>" alt="" style="width: 45px; height: 60px;">
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


</body>
</html>
