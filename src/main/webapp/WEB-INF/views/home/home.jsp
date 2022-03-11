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
							<p>모든 기능을 한 프로그램에서 사용 가능합니다. 농장운영, 분석, 경매, 작물 구매,판매, 노하우 경매까지
								모든 것을 한번에 가능 하게 도와 주는 장소 입니다.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="home-facts counter pt80">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-sm-6 col-md-3">
							<div class="counter-box">
								<p class="counter-count">1000000</p>
								<p class="ctxt">이용 회원</p>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 col-md-3">
							<div class="counter-box">
								<p class="counter-count">23547</p>
								<p class="ctxt">완료된 경매</p>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 col-md-3">
							<div class="counter-box">
								<p class="counter-count">300</p>
								<p class="ctxt">작물 종류</p>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 col-md-3">
							<div class="counter-box">
								<p class="counter-count">1245678</p>
								<p class="ctxt">거래 된 작물</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--About Section End-->
		<!--Urgent Causes Start 랭킹-->
		<section class="urgent-causes wf100 p80">
			<div class="container">
				<div class="row">

					<div class="col-md-6">
						<h5 style="color: white;">농부 작물 판매왕!</h5>
						<div class="donation-amount">
							<!-- 이미지 들어 갈것 -->
							<img src="<c:url value='/resources/images/first.gif'/>" alt=""
								style="margin-left: 26%;">
							<p>1등 아이디 들어가야함.</p>
						</div>
					</div>
					<div class="col-md-6">
						<br> <br> <br> <br>
						<p>2등</p>
						<br>
						<p>3등</p>
						<br>
						<p>4등</p>
						<br>
						<p>5등</p>
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
                     <ul class="nav" id="myTab" role="tablist">
                        <li class="nav-item"> <a class="nav-link active" id="wildlife-tab" data-toggle="tab" href="#wildlife" role="tab" aria-controls="wildlife-tab" aria-selected="true">Wildlife</a> </li>
                        <li class="nav-item"> <a class="nav-link" id="water-tab" data-toggle="tab" href="#water" role="tab" aria-controls="water-tab" aria-selected="false">Water Resources</a> </li>
                        <li class="nav-item"> <a class="nav-link" id="solar-tab" data-toggle="tab" href="#solar" role="tab" aria-controls="solar-tab" aria-selected="false">Solar Energy</a> </li>
                        <li class="nav-item"> <a class="nav-link" id="recycling-tab" data-toggle="tab" href="#recycling" role="tab" aria-controls="recycling-tab" aria-selected="false">Recycling</a> </li>
                     </ul>
                  </div>				
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="tab-content" id="myTabContent">
							<!--WildLife Slider Start-->
							 <div class="tab-pane fade show active" id="wildlife" role="tabpanel" aria-labelledby="wildlife-tab">
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
														<a href="#">Join Bid</a>
													</div>
												</div>
											</div>
										</c:forEach>
										<!--Pro Box End-->
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</section>
		<!--Current Projects End-->
		<!--News & Articles Start 공지사항 추가-->
		<section class="h2-news wf100 p80">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="section-title-2">
							<h2>공지사항</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="blog-post-large">
							<div class="post-thumb">
								<a href="#"> <i class="fas fa-link"></i>
								</a> <img src="images/h2news1.jpg" alt="">
							</div>
							<div class="post-txt">
								<ul class="post-meta">
									<li><i class="fas fa-calendar-alt"></i> 29 September, 2018</li>
									<li><i class="fas fa-comments"></i> 134 Comments</li>
								</ul>
								<h5>
									<a href="#">Planting Trees for Better Future</a>
								</h5>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<!--Blog Small Post Start-->
						<div class="blog-small-post">
							<div class="post-thumb">
								<a href="#"><i class="fas fa-link"></i></a> <img
									src="images/h2news2.jpg" alt="">
							</div>
							<div class="post-txt">
								<span class="pdate"> <i class="fas fa-calendar-alt"></i>
									29 September, 2018
								</span>
								<h5>
									<a href="#">How you can keep alive wildlife long.</a>
								</h5>
								<p>According to a survey the perceived higher cost of
									environmentally.</p>
								<a href="#" class="rm">Read More</a>
							</div>
						</div>
						<!--Blog Small Post End-->
						<!--Blog Small Post Start-->
						<div class="blog-small-post">
							<div class="post-thumb">
								<a href="#"><i class="fas fa-link"></i></a> <img
									src="images/h2news3.jpg" alt="">
							</div>
							<div class="post-txt">
								<span class="pdate"> <i class="fas fa-calendar-alt"></i>
									29 September, 2018
								</span>
								<h5>
									<a href="#">The effort GoGreen has been felt across</a>
								</h5>
								<p>Majority have suffered alteration in some form by
									injected humour.</p>
								<a href="#" class="rm">Read More</a>
							</div>
						</div>
						<!--Blog Small Post End-->
					</div>
				</div>
			</div>
		</section>
		<!--News & Articles End-->
		<!--Why Ecova + Facts Start 회원 가입 추가-->
		<section class="why-ecova wf100">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>Why 똑장이!!</h1>
						<p>이유 주절주절</p>
						<a href="#" class="cus">Signup to Join us</a>
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
							<h5>Read Our Latest</h5>
							<h2>News &amp; Articles</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<!--Pro Box Start-->
					<div class="col-md-3 col-sm-6">
						<div class="product-box">
							<div class="pro-thumb">
								<a href="#">Add To Cart</a> <img src="images/pro1.jpg" alt="">
							</div>
							<div class="pro-txt">
								<h6>
									<a href="#">Happy Ninja Shirt</a>
								</h6>
								<p class="pro-price">
									<del>$25.00</del>
									$19.00
								</p>
							</div>
						</div>
					</div>
					<!--Pro Box End-->
				</div>
			</div>
		</section>
		<!--Online Products End-->
	</div>
	<script type="text/javascript">
	$('.owl-carousel').owlCarousel({
	    items : 1, //화면에 표시 할 슬라이드 수
	    animateOut : 'fadeOut', // 사라질때의 애니메이션
	    margin : 10, // 슬라이드 간격
	    dots : true, // Pagination 표시 여부
	    autoplay : true, // 자동 슬라이드 여부
	    autoplayTimeout : 3000, // 자동 슬라이드 시간 (예제는 3초)
	    loop : true // 무한 반복 여부
	})
	</script>
	</body>
</html>