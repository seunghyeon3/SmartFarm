<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
</head>

<body>
	<section class="contact-page wf100 p80">
		<div class="container">
			<div class="col-lg-9 col-md-8">
				<!--Blog Single Content Start-->
				<div class="blog-single-content">

					<h3>${freeVO.free_title}</h3>
					<ul class="post-meta">
						<li><i class="fas fa-user-circle"></i>${freeVO.mem_name}</li>
						<li><i class="fas fa-calendar-alt"></i>${freeVO.free_day}</li>
						<li><i class="fas fa-comments"></i> 134 Comments</li>
					</ul>

					<div class="blog-single-thumb">
						<img src="resources/images/blog/bf4.jpg" alt="">
					</div>

					<p>${freeVO.free_con}</p>

					<div>
						<input type="button" value="수정하기"
						onclick="location.href='archieveupdateForm.do?archieve_no=${archieve.archieve_no}'"
						class="fsubmit"> <input type="button" value="뒤로가기"
						onclick="history.back(-1);" class="fsubmit">
					</div>

					<!--Author Comments Start-->
					<div class="post-comments wf100">
						<h4>Comments on Post</h4>
						<ul class="comments">
							<!--Comment Start-->
							<li class="comment">
								<div class="user-thumb">
									<img src="images/auser.jpg" alt="">
								</div>
								<div class="comment-txt">
									<h6>Harry Butler</h6>
									<p>Personally I think a combination of all these methods is
										most effective, but in today’s post I will be focusing
										specifically on how to use and style WordPress’ built-in
										sticky post feature and highlighting it’s best use case based
										on my own experience.</p>
									<ul class="comment-time">
										<li>Posted: 09 July, 2018 at 2:37 pm</li>
										<li><a href="#"><i class="fas fa-reply"></i> Reply</a></li>
									</ul>
								</div>
							</li>
							<!--Comment End-->
						</ul>
					</div>
					<!--Author Comments End-->

					<!--Leave a Comment Start-->
					<div class="wf100 comment-form">
						<h4>Leave a Comment</h4>
						<ul>
							<li class="w3"><input type="text" class="form-control"
								placeholder="Full Name"></li>
							<li class="full"><textarea class="form-control"
									placeholder="Write Comments"></textarea></li>
							<li class="full">
								<button class="post-btn">Post Your Comment</button>
							</li>
						</ul>
					</div>
					<!--Leave a Comment End-->
				</div>
				<!--Blog Single Content End-->
			</div>
		</div>
	</section>



</body>
</html>