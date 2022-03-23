<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<sec:authorize access="isAnonymous()" >
	<c:redirect url="home.do"></c:redirect>
</sec:authorize>
<script src="https://kit.fontawesome.com/1874543bef.js" crossorigin="anonymous"></script>

	<!--본문 시작-->
	<section class="wf100 p80 blog">
		<div class="blog-details">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-8">


						<!--재배 키트 목록 시작-->
						<div class="blog-single-content" style="overflow: auto; white-space: nowrap;">
							<ul id="growKitList" class="post-meta">
							
								<c:forEach items="${kitList}" var="grow" varStatus="status">
								
								<%-- <li class="tags" style="font-size: 25px; display: inline-block; text-align: center;"><i class="fa-brands fa-raspberry-pi"></i> <a data-index="${status.index}" data-tp="${grow.kit_tp }" data-hd="${grow.kit_hd }" data-sun="${grow.kit_sun }" data-water="${grow.kit_water }" data-pes="${grow.kit_pes }" data-kit="${grow.kit_no }" data-startdate="${grow.grow_status }" data-percent="${grow.percent }" data-end="${grow.end_estimate }" data-url="http://${grow.pur_his_kit_address}/" id="http://${grow.pur_his_kit_address}/" href="javascript:void(0);">${grow.pur_his_order_no }(${grow.kit_plant_name })</a></li> --%>
								<li class="tags" data-index="${status.index}" data-tp="${grow.kit_tp }" data-hd="${grow.kit_hd }" data-sun="${grow.kit_sun }" data-water="${grow.kit_water }" data-pes="${grow.kit_pes }" data-kit="${grow.kit_no }" data-percent="${grow.percent }" data-end="${grow.end_estimate }" data-url="http://${grow.pur_his_kit_address}/" id="http://${grow.pur_his_kit_address}/" style="cursor:pointer; font-size: 25px; display: inline-block; text-align: center;"><i id = "${grow.pur_his_order_no }" class="fa-brands fa-raspberry-pi"></i>${grow.pur_his_order_no }(${grow.kit_plant_name })</li>
								
								</c:forEach>
								
							</ul>
						</div>
						<!--재배 키트 목록 종료-->
						
						<!--cctv 화면 출력부 시작-->
						<h3>CCTV 화면</h3><br><br>
						
						
						<div id="cctv">
						</div>
						<!--cctv 화면 출력부 종료-->

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

<script type="text/javascript">
$("#growKitList").on("click", "li", function(event)	{
	$(event.target).parent().children().css('background-color', '');
	$(event.target).css('background-color', 'green');
	
	$("#cctv").html('<iframe style="width: 800px; height: 450px;" src="https://player.vimeo.com/video/89009039"></iframe>');
})

</script>
</body>
</html>
