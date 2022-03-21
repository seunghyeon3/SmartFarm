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
.online-shop > .container > .row > .col-md-12 > .cpro-slider > .owl-nav{
display: none;
}


</style>
</head>
<body>
	<div class="wrapper home2">
		<!--Slider Start-->
		<section id="home-slider" class="owl-carousel owl-theme wf100">
			<div class="item">
				<img src="<c:url value='/resources/images/banner1.png'/>">
			</div>
			<div class="item">
				<img src="<c:url value='/resources/images/banner2.png'/>">
			</div>
			<div class="item">
				<img src="<c:url value='/resources/images/banner3.png'/>">
			</div>


		</section>
		<!--Slider End-->
		<!--Service Area Start 관련된 내용들? smart farm 관련-->
		<section class="services-area wf100">
			<div class="container">
				<ul>
					<!--box  start-->
					<li>
						<div class="sinfo">
							<img
								src="<c:url value='/resources/images/convenientManage.png'/>"
								style="width: 57px; height: 57px;">
							<h6>운영</h6>
							<p>손 안에 모든 운영 가능</p>
						</div>
					</li>
					<!--box  end-->
					<!--box  start-->
					<li>
						<div class="sinfo">
							<img src="<c:url value='/resources/images/analyze.png'/>"
								style="width: 57px; height: 57px;">
							<h6>분석</h6>
							<p>재배 일지로 통한 작물 분석</p>
						</div>
					</li>
					<!--box  end-->
					<!--box  start-->
					<li>
						<div class="sinfo">
							<img src="<c:url value='/resources/images/heavist.png'/>"
								style="width: 57px; height: 57px;">
							<h6>작물</h6>
							<p>다양한 품종 재배</p>
						</div>
					</li>
					<!--box  end-->
					<!--box  start-->
					<li>
						<div class="sinfo">
							<img src="<c:url value='/resources/images/bid.png'/>"
								style="width: 57px; height: 57px;">
							<h6>경매</h6>
							<p>노하우를 NFT 경매</p>
						</div>
					</li>
					<!--box  end-->
					<!--box  start-->
					<li>
						<div class="sinfo">
							<img src="<c:url value='/resources/images/onlineShop.png'/>"
								style="width: 57px; height: 57px;">
							<h6>쇼핑몰</h6>
							<p>신선한 작물을 집으로</p>
						</div>
					</li>
					<!--box  end-->
				</ul>
			</div>
		</section>
		<!--Service Area End-->
		<!--About Section Start 간략 소개-->
		<section class="home2-about wf100 p100 gallery">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<div class="video-img">

							<img src="<c:url value='/resources/images/introbg.jpg'/>" alt="">
						</div>
					</div>
					<div class="col-md-7">
						<div class="h2-about-txt">
							<h3>똑 장 이</h3>
							<h2>똑장이는 똑똑하고 훌륭한 아이</h2>
							<span>모든 기능을 한 프로그램에서 사용 가능합니다.</span><br><span> 농장운영, 분석, 경매, 작물 구매,판매, 노하우 경매까지
								모든 것을 한번에 가능 하게 도와 주는 장소 입니다.</span>
						</div>
					</div>
				</div>
			</div>
			<div class="home-facts counter pt80">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-sm-6 col-md-3">
							<div class="counter-box">
								<p class="counter-count">${mainCount.member }</p>
								<p class="ctxt">이용 회원</p>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 col-md-3">
							<div class="counter-box">
								<p class="counter-count">${mainCount.aucn }</p>
								<p class="ctxt">완료된 경매</p>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 col-md-3">
							<div class="counter-box">
								<p class="counter-count">${mainCount.plant }</p>
								<p class="ctxt">작물 종류</p>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 col-md-3">
							<div class="counter-box">
								<p class="counter-count">${mainCount.plant_sale }</p>
								<p class="ctxt">거래 된 작물</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--About Section End-->
		<!--News & Articles Start 공지사항 추가-->
		<section class="h2-news wf100 p80">
            <div class="container">
               <div class="row">
                  <div class="col-md-6">
                     <div class="section-title-2">
                        <h2>스마트 팜 안내 & 공지사항</h2>
                     </div>
                  </div>
                  <div class="col-md-6"> <a href="notice.do" class="view-more">공지사항 더보기</a> </div>
               </div>
               <div class="row">
                  <div class="col-md-6">
                     <div class="blog-post-large">
                     <!-- 스마트 팜 안내글 이동 -->
                        <div class="post-thumb"> <a href="intro.do?intro_board_class=intro3"><i class="fas fa-link"></i></a> <img src="<c:url value='/resources/images/homeNotice.jpg'/>" alt="">
                        </div>
                        <div class="post-txt">
                           <h5><a href="intro.do?intro_board_class=intro3">스마트 팜 안내</a></h5>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <!--Blog Small Post Start-->
                     <div class="blog-small-post">
                        <div class="post-thumb"> <a href="noticeselect.do?notice_no= ${recentlyNotice[0].notice_no }"><i class="fas fa-link"></i></a> <img src="<c:url value='/resources/images/${recentlyNotice[0].notice_img }'/>" alt=""> </div>
                        <div class="post-txt">
                           <span class="pdate"> <i class="fas fa-calendar-alt"></i> ${recentlyNotice[0].notice_day }</span>
                           <h5><a href="noticeselect.do?notice_no= ${recentlyNotice[0].notice_no }">${recentlyNotice[0].notice_title }</a></h5>
                           <p class="ellip">${recentlyNotice[0].notice_con }</p>
                           <a href="noticeselect.do?notice_no= ${recentlyNotice[0].notice_no }" class="rm">Read More</a> 
                        </div>
                     </div>
                     <!--Blog Small Post End--> 
                              <!--Blog Small Post Start-->
                     <div class="blog-small-post">
                        <div class="post-thumb"> <a href="noticeselect.do?notice_no= ${recentlyNotice[1].notice_no }"><i class="fas fa-link"></i></a> <img src="<c:url value='/resources/images/${recentlyNotice[1].notice_img }'/>" alt=""> </div>
                        <div class="post-txt">
                           <span class="pdate"> <i class="fas fa-calendar-alt"></i> ${recentlyNotice[1].notice_day }</span>
                           <h5><a href="noticeselect.do?notice_no= ${recentlyNotice[1].notice_no }">${recentlyNotice[1].notice_title }</a></h5>
                           <p class="ellip">${recentlyNotice[1].notice_con }</p>
                           <a href="noticeselect.do?notice_no= ${recentlyNotice[1].notice_no }" class="rm">Read More</a> 
                        </div>
                     </div>
                     <!--Blog Small Post End--> 
                  </div>
               </div>
            </div>
         </section>
		<!--News & Articles End-->
		<!--Urgent Causes Start 랭킹-->
		<section class="urgent-causes wf100 p80">
			<div class="container">
				<div class="row">

					<div class="col-md-6">
						<h5 style="color: white;">농부 작물 판매왕!</h5>
						<div class="donation-amount" style="text-align: center;">
							<!-- 이미지 들어 갈것 -->
							<img src="<c:url value='/resources/images/first.gif'/>" alt="">
							<h1 style="color: white;">${priceRank[0].mem_email }</h1>
						</div>
					</div>
					<div class="col-md-6">
						<br> <br> <br> <br>
						<p>2등 ${priceRank[1].mem_email }</p>
						<br>
						<p>3등 ${priceRank[2].mem_email }</p>
						<br>
						<p>4등 ${priceRank[3].mem_email }</p>
						<br>
						<p>5등 ${priceRank[4].mem_email }</p>
					</div>
				</div>
			</div>
		</section>
		<!--Urgent Causes End-->
		<!--Current Projects Start 경매 등록-->
		<section class="wf100 p80 current-projects">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="section-title-2">
							<h5>경매</h5>
							<h2>영농 일지</h2>
						</div>
					</div>
				  <div class="col-lg-6">
                  </div>				
				</div>
				<div class="row">
					<div class="col-md-12">
			<!-- 			<div class="tab-content" id="myTabContent">
							WildLife Slider Start
							 <div class="tab-pane fade show active" id="wildlife" role="tabpanel" aria-labelledby="wildlife-tab">-->
                           <div class="cpro-slider owl-carousel owl-theme">
									<!-- 경매 데이터 넣어줘야함. -->
									<!--Pro Box-->
										<c:forEach items="${aucnEnable }" var="aucn">
											<div class="item">
												<div class="pro-box">
													<img src="<c:url value='/resources/nft/merge/${aucn.nft_img }'/>" alt="" style="width: 278px; height: 378px;">
													<h5>${aucn.aucn_title }</h5>
													<div class="pro-hover">
														<h6>${aucn.aucn_title }</h6>
														<p>현재 가격 : ${aucn.now_bid }</p>
														<p>${aucn.aucn_con }</p>
														<a href="aucnDetail.do?aucnNo=${aucn.aucn_no }">Join Bid</a>
													</div>
												</div>
											</div>
										</c:forEach>
										<!--Pro Box End-->
				<!-- 			</div>
						</div> -->
					</div> 
				</div>
			</div>
			</div>
		</section>
		<!--Current Projects End-->
		
		<!--Why Ecova + Facts Start 회원 가입 추가-->
		<section class="why-ecova wf100">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>Why 똑장이!!</h1>
						<p>회원 가입 해야 하는 이유 넣어야함.꼬실만한 문구들</p>
						<a href="register.do" class="cus">Signup to Join us</a>
					</div>
				</div>
			</div>
		</section>
		<!--Why Ecova + Facts End-->
		<!--Online Products Start 최근 등록된 상품-->
		<section class="online-shop wf100 p80">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title-2 text-center">
							
							<h2>작물 판매</h2>
						</div>
					</div>
				</div>
				<div class="row">
					
				<div class="col-md-12">
					  <div class="cpro-slider owl-carousel owl-theme">
					  <!--Pro Box Start-->
					  
					  <c:forEach items="${recentlyPlantSale}" var="plant">
					   <div class="item">
						<div class="product-box">
							<div class="pro-thumb">
								<%-- <img src="<c:url value='/resources/images/${plant.plant_sale_phy_rou }'/>" alt=""> --%>
								<img src="<c:url value='/resources/images/shop/pro1.jpg'/>" alt="" style="width: 253px; height: 270px;">
							</div>
							<div class="pro-txt">
								<h6>
									<a href="plantProductDetail.do?plant_sale_no=${plant.plant_sale_no }">${plant.plant_sale_title}</a>
								</h6>
								<p class="pro-price" id="mainPlantPrice">							
								${plant.plant_sale_price}
								</p>
							</div>
						</div>
						</div>
						</c:forEach>
					</div>
					<!--Pro Box End-->
					</div>
				</div>
			</div>
		</section>
		<!--Online Products End-->
	</div>
	</body>
	<script type="text/javascript">
	 var price = document.querySelectorAll('#mainPlantPrice');
     for(var i=0;i<price.length;i++) {
        price[i].innerText = (parseInt(price[i].innerText) * 1).toLocaleString('ko-KR');
     }
	</script>
	   <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	   <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</html>