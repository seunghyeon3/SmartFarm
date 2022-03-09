<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!--Slider Start-->
	<section id="home-slider" class="owl-carousel owl-theme wf100">
		<div class="item">
			<div class="slider-caption h2slider">
				<div class="container">
					<c:forEach items="${aucnEnable }" var="aucn">
						<div class="col-lg-3 col-md-4 col-sm-6"
							style="display: inline-block; text-align: center;">
									<img src="<c:url value='/resources/nft/merge/${aucn.nft_img }'/>" alt="">
									<span style="font-size: 15px; color:black;">현재 입찰가 : ${ aucn.now_bid}eth 
									</span>
							<a href="aucnDetail.do?aucnNo=${aucn.aucn_no}" style="float: right;">참  여</a>
					
						</div>
					</c:forEach>
				</div>
			</div>
			<img src="<c:url value='/resources/images/smartlogo.png'/>" alt="">
		</div>
		<div class="item">
			<div class="slider-caption h2slider">
				<div class="container">
					<c:forEach items="${priceRank }" var="rank" varStatus="no">
					<span> ${no.index+1 }등 ${rank.mem_email }		
					</span>
					</c:forEach>
				</div>
			</div>
			<img src="<c:url value='/resources/images/smartlogo.png'/>" alt="">
		</div>
		<div class="item">
			<div class="slider-caption h2slider">
				<div class="container">
					<c:forEach items="${kitRecommand }" var="kit">
						<div class="col-lg-3 col-md-6 col-sm-6"
							style="display: inline-block; text-align: center;">
									<img src="<c:url value='/resources/images/${kit.kit_main_img }'/>" alt="사진을 너어 주세요로~">
									<span style="font-size: 15px; color:black;"> ${kit.kit_prpos} ${kit.kit_name} </span>
							<a href="#" style="float: right;">구  경</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<img src="<c:url value='/resources/images/smartlogo.png'/>" alt="" style="height: 40vh;">
		</div>

	</section>
	<!--Slider End-->
<div class="container">

<!-- 테이블로 바꿀 예정 -->
<div class="col-lg-3 col-md-6 col-sm-6" style="display: inline-block;">
<!-- a태그 달아야함. -->
<c:forEach items="${recentlyNotice }" var="notice" varStatus="no">
${no.index+1 } : ${notice.notice_title }<br>
</c:forEach>
</div>

<div class="col-lg-3 col-md-6 col-sm-6" style="display: inline-block;">
<c:forEach items="${recentlyFree }" var="free" varStatus="no">
${no.index+1 } : ${free.free_title } <br>
</c:forEach>
</div>


<div class="col-lg-3 col-md-6 col-sm-6" style="display: inline-block;" >
<c:forEach items="${recentlyUseRevw }" var="useRevw" varStatus="no">
${no.index+1 } : ${useRevw.use_revw_title } <br>
</c:forEach>
</div>

</div>
</body>

</html>

<%-- <div class="item">
			<div class="slider-caption h2slider">
				<div class="container">
					<c:forEach items="${aucnEnable }" var="aucn">
					  <div class="col-md-4 col-sm-6">
						<div class="blog-post">
							<div class="blog-thumb">
								<img src="<c:url value='/resources/nft/merge/${aucn.nft_img }'/>" alt="">
							</div>
						</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div> --%>