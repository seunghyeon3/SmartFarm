<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 상세페이지</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
</head>
<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #5cb85c;
	cursor: pointer;
	border: 1px solid #4cae4c;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.filebox label:hover {
	background-color: #6ed36e;
}

.filebox label:active {
	background-color: #367c36;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

ul>li>p {
	border: 2px solid #e1e1e1;
	background: #fafafa;
	color: #555555;
	height: auto;
	line-height: 49px;
	padding: 0 20px;
}

.pre {
	word-wrap: break-word; /* IE 5.5-7 */
	white-space: pre-wrap; /* current browsers */
}
</style>
<body>
	<section class="shop wf100 p80">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-6">
					<div class="blog-single-content" style="width: 100%;">
						<h3>${archieve.archieve_title}</h3>
						<ul class="post-meta">
							<li><i class="fas fa-user-circle"></i>${archieve.mem_name}</li>
							<li><i class="fas fa-calendar-alt"></i>${archieve.archieve_day}</li>
							<li><i class="fas fa-comments"></i>${archieve.archieve_hit}
								조회수</li>
						</ul>
						<!-- <div class="blog-single-thumb" style="border-bottom:thick double #32a1ce;"> -->
						<div class="content" style="min-height: 300px;">
							<p>${archieve.archieve_con}</p>
						</div>
						<div style="margin-top: 50px;margin-bottom: 50px;">
												<%-- 	<div style="width: 100%; text-align: center;">
								<img src="download.do?img=${archieve.archieve_img}"
									style="width: 100%; max-width: 1200px; vertical-align: middle"
									onError="this.style.visibility='hidden'">

							</div>
 --%>
							<a href="download.do?img=${archieve.archieve_img}"><p>첨부파일 : ${archieve.archieve_img}</p></a></div>
						</div>

						<ul class="cform">
							<sec:authorize access="hasRole('ADMIN')">
								<li class="half pr-15"><input type="button" value="수정하기"
									onclick="location.href='archieveupdateForm.do?archieve_no=${archieve.archieve_no}'"
									class="fsubmit"></li>
							</sec:authorize>
							<li class="half pr-15"><input type="button" value="뒤로가기"
								onclick="history.back(-1);" class="fsubmit"></li>
						</ul>
					</div>
				</div>
			</div>
	</section>
</body>
</html>