<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NFT 보유현황</title>
<style>
.team-box:after{
background : none
}
</style>
</head>
<body>
	<div class="team-grid team-small-grid p80">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>My NFT</h1>
				</div>
				<!--Team Box Start-->
				<c:forEach items="${nftList }" var="nft">
					<!--Team Box Start-->
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="team-box">
							<img src="resources/nft/merge/${nft.nft_img }" alt="">
							<div class="team-info">
								<h5>Johnson Alven</h5>
								<p>Project Coordinator</p>
								<ul>
									<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
									<li><a href="#"><i class="fab fa-twitter"></i></a></li>
									<li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
				<!--Team Box End-->
			</div>
		</div>
	</div>
</body>
</html>