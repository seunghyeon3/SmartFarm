<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<script src="https://kit.fontawesome.com/1874543bef.js" crossorigin="anonymous"></script>

	<!--본문 시작-->
	<section class="wf100 p80 blog">
		<div class="blog-details">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12">


						<!--재배 키트 목록 시작-->
						<div class="blog-single-content" style="overflow: auto; white-space: nowrap;">
							<ul class="post-meta">
							
								<c:forEach items="${kitList}" var="grow">
								
								<li class="tags" style="font-size: 25px; display: inline-block; text-align: center;"><i class="fa-brands fa-raspberry-pi"></i> <a href="#">${grow.kit_no }</a></li>
								
								</c:forEach>
								
							</ul>
						</div>
						<!--재배 키트 목록 종료-->
						
						<!--cctv 화면 출력부 시작-->
						<div>
								<iframe style="width: 800px; height: 450px;" src="https://player.vimeo.com/video/89009039"></iframe>
						</div>
						<!--cctv 화면 출력부 종료-->

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--본문 종료-->


</body>
</html>
