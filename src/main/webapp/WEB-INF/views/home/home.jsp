<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#subMenu>.row>div {
	display: inline-block;
	padding-left: 5%;
}

.ellip {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>

	<!--Slider Start-->
	<section id="home-slider" class="owl-carousel owl-theme" >
		<div class="item">
			<div class="slider-caption h2slider">
				<div class="container-fluid">
					<c:forEach items="${aucnEnable }" var="aucn" begin="0" end="4" step="1">
						<div style="display: inline-block; text-align: center; width: 10%; padding: 0%; margin-right: 4.3%; margin-left: 5.2%; ">
									<img src="<c:url value='/resources/nft/merge/${aucn.nft_img }'/>" alt="" style=" height: 35vh; width: 12vw;">
									<br>
									<span style="font-size: 15px;">현재 입찰가 : ${ aucn.now_bid}eth 
									</span>
									<br>
									<a href="aucnDetail.do?aucnNo=${aucn.aucn_no}" style="float: right; margin-right: 7%;">참      여</a>					
						</div>
					</c:forEach>
				</div>
			</div>
			<img src="<c:url value='/resources/images/mappatt.jpg'/>" alt="">
		</div>
		<div class="item">
			<div class="slider-caption h2slider">
				<div class="container-fluid">
				<c:forEach items="${kitRecommand }" var="kit"  begin="0" end="4" step="1">
						<div style="display: inline-block; text-align: center; width: 10%; padding: 0%; margin-right: 4.3%; margin-left: 5.2%; ">
									<img src="<c:url value='/resources/nft/merge/${aucn.nft_img }'/>" alt="" style=" height: 35vh; width: 12vw;">
									<br>
									<span style="font-size: 15px; color: black;">${kit.kit_prpos} ${kit.kit_name} 	</span>
									<br>
									<a href="#" style="float: right; margin-right: 7%;">구      경</a>					
						</div>
					</c:forEach>
				</div>
			</div>
					<img src="<c:url value='/resources/images/mappatt.jpg'/>" alt="">
		</div>

	</section>
	<!--Slider End-->
	 <section class="home2-about p100 gallery">
            <div class="container" >
               <div class="row">
                  <div class="col-md-5">
                     <div class="video-img"> <a href="http://vimeo.com/43338103&amp;width=700" data-rel="prettyPhoto" title="Vimeo video"><i class="fas fa-play"></i></a>
                     <img src="<c:url value='/resources/images/h2about.jpg'/>" alt="">
                     </div>
                  </div>
                  <div class="col-md-7">
                     <div class="h2-about-txt">
                        <h3>똑 장 이</h3>
                        <h2>스마트 팜 관리</h2>
                        <p> 어디 어디서든 편하고 손 쉽게 농장을 관리 해보세요. 좋은 작물을 자동으로 재배 할 수 있는 기능은 덤! 저희와 함께 스마트 팜을 꾸며보아요!!</p>
                        <a class="aboutus" href="#">회원가입</a> 
                     </div>
                  </div>
               </div>
            </div>
            <div class="home-facts counter pt80" style="float: none;">
               <div class="container">
                  <div class="row">
                     <div class="col-lg-3 col-sm-6 col-md-3">
                        <div class="counter-box">
                        <!-- db에서 값 다시 넣어줘야함 -->
                           <p class="counter-count">89000</p>
                           <p class="ctxt">경매</p>
                        </div>
                     </div>
                     <div class="col-lg-3 col-sm-6 col-md-3">
                        <div class="counter-box">
						<!-- db에서 값 다시 넣어줘야함 -->
                           <p class="counter-count">79000</p>
                           <p class="ctxt">키트</p>
                        </div>
                     </div>
                     <div class="col-lg-3 col-sm-6 col-md-3">
                        <div class="counter-box">
                        <!-- db에서 값 다시 넣어줘야함 -->
                           <p class="counter-count">69000</p>
                           <p class="ctxt">작물</p>
                        </div>
                     </div>
                     <div class="col-lg-3 col-sm-6 col-md-3">
                        <div class="counter-box">
                        <!-- db에서 값 다시 넣어줘야함 -->
                           <p class="counter-count">59000</p>
                           <p class="ctxt">회원님들</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
	
	
	
<div class="container-fluid" id="subMenu" style="padding-top: 10px;">
<div class="row">
<!-- 테이블로 바꿀 예정 -->
<div class="col-lg-3 col-md-6 col-sm-6 ellip"  >
<!-- a태그 달아야함. -->
<c:forEach items="${recentlyNotice }" var="notice" varStatus="no"  begin="0" end="4" step="1">
${no.index+1 } : ${notice.notice_title }<br>
</c:forEach>
</div>

<div class="col-lg-3 col-md-6 col-sm-6 ellip" >
<c:forEach items="${recentlyFree }" var="free" varStatus="no"  begin="0" end="4" step="1">
${no.index+1 } : ${free.free_title } <br>
</c:forEach>
</div>


<div class="col-lg-3 col-md-6 col-sm-6 ellip">
<c:forEach items="${recentlyUseRevw }" var="useRevw" varStatus="no"  begin="0" end="4" step="1">
${no.index+1 } : ${useRevw.use_revw_title } <br>
</c:forEach>
</div>

<div class="col-lg-3 col-md-6 col-sm-6 ellip" >
<c:forEach items="${priceRank }" var="rank" varStatus="no"  begin="0" end="4" step="1">
${no.index+1 } : ${rank.mem_email } 님<br>
</c:forEach>
</div>
</div>
</div>
</body>

</html>