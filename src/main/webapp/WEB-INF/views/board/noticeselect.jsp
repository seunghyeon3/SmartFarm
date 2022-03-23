<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
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
</style>

<body>
	<section class="contact-page wf100 p80">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-6">
					<div class="blog-single-content" style="width: 100%;">
						
						<ul class="cform"style="margin:20px;">
						<li class="half pl-15"></li>
							<sec:authorize access="hasRole('ADMIN')">
								<li class="half pr-15"><input type="button" value="수정" style="width:200px;"
									onclick="location.href='noticeupdateForm.do?notice_no=${notice.notice_no}'"
									class="fsubmit">
							    <input type=button value="삭제" style="width:200px;  background-color:#e11f3e;color:#ffffff;" onclick="location.href='noticedelete.do?notice_no=${notice.notice_no}'"class="fsubmit">
							    </li>
							</sec:authorize>
						</ul>
						<h3>${notice.notice_title}</h3>
						<ul class="post-meta">
							<li><i class="fas fa-user-circle"></i>${notice.mem_name}</li>
							<li><i class="fas fa-calendar-alt"></i>${notice.notice_day}</li>
							<li><i class="fas fa-comments"></i> ${notice.notice_hit} 조회수</li>
						</ul>

						<div style="width: 100%; text-align: center;">
							<img src="../upload/${notice.notice_img}"
								style="width: 100%; max-width: 1200px; vertical-align: middle"
								onError="this.style.visibility='hidden'">
						</div>

						<div class="content" style="min-height: 300px;">
							<p>${notice.notice_con}</p>
						</div>
						<div style="margin-top: 50px; margin-bottom: 50px;">
							<!-- style="text-align : center;" -->
							<span>첨부파일 : </span><a href="download.do?img=${notice.notice_img}">${notice.notice_img}</a>
						</div>

						<ul class="cform">
							<li class="full">
							<div style="text-align: center;">
									<input type="button" value="뒤로가기" style="width:200px; display: inline-block;"
										onclick="history.back(-1);" class="fsubmit">
								</div>
								</li>
						</ul>
						<!--Leave a Comment End-->
					</div>
					<!--Blog Single Content End-->
				</div>
			</div>
	</section>
</body>
</html>