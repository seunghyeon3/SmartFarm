<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">

<head>
<title>노지분야 소개</title>
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
</style>
</head>
<body>
	<div class="wrapper">
		<section class="wf100 about">
			<div class="wf100 comment-form">
				<div class="about-video-section wf100">
					<div class="container">
						<h3>노지분야 소개</h3>
						<br> <br> <br>
						<div class="row">
							<div class="about-text">
								<img src="resources/images/${intron[0].intro_img}"
									alt="내용을 등록 해주세요">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div align="right" class="bt_se">
			<sec:authorize access="hasRole('ADMIN')">
				<c:if test="${intron ne null}">
					<a class="aboutus"
						href="introupdateForm.do?intro_no=${intron[0].intro_no }&intro_img=${intron[0].intro_img}">수정</a>
				</c:if>
				<c:if test="${intron eq null}">
					<a class="aboutus" href="introinsertForm.do">글쓰기</a>
				</c:if>
			</sec:authorize>
		</div>
	</div>
</body>
</html>