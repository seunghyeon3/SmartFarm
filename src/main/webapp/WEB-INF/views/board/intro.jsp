<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>스마트팜 소개</title>
<style>
.about-text {
	width: 1000px;
	margin: auto;
	text-align: center;
}

.bt_se {
	width: 100;
	margin: auto;
	text-align: center;
}

.aboutus {
	width: 105px;
	margin: 10;
	text-align: center;
}
</style>
</head>
<body>
	<div class="wrapper">
		<section class="wf100 about">
			<div class="wf100 comment-form">
				<div class="about-video-section wf100">
					<div class="container">
						<h3>스마트팜 소개</h3>
						<br>
						<br>
						<br>
						<div class="row">
							<div class="about-text">
								<img src="resources/images/${intro[0].intro_img}"
									style="width: 1000px" >

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div align="right" class="bt_se">
			<sec:authorize access="hasRole('ADMIN')">
				<c:if test="${!empty intro }">
					<a class="aboutus"
						href="introupdateForm.do?intro_no=${intro[0].intro_no}&intro_img=${intro[0].intro_img}">수정</a>
				</c:if>
			<c:if test="${empty intro}">
				<a class="aboutus" href="introinsertForm.do">글쓰기</a>
			</c:if>
			</sec:authorize>
		</div>
	</div>
</body>
</html>