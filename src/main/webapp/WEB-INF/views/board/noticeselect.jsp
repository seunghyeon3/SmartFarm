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

ul>li>p{
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
			<div class="col-lg-9 col-md-8">
				<!--Blog Single Content Start-->
				<div class="blog-single-content">

					<h3>${notice.notice_title}</h3>
					<ul class="post-meta">
						<li><i class="fas fa-user-circle"></i>${notice.mem_name}</li>
						<li><i class="fas fa-calendar-alt"></i>${notice.notice_day}</li>
			<%-- 			<li><i class="fas fa-comments"></i>${notice.notice_com}</li> --%>
					</ul> 
					          <li class="full">
                             <img src="download.do?img=${notice.notice_img}"onError="this.style.visibility='hidden'">
                            </li>
                            <li class="full">
                             <a href="download.do?img=${notice.notice_img}">${notice.notice_img}</a>
                            </li>
					<%-- <p>${notice.notice_con}</p> --%>
                         <input type="button" value="수정하기" onclick="location.href='noticeupdateForm.do?notice_no=${notice.notice_no}'" class="fsubmit"> 
                             
                         <input type="button" value="뒤로가기" onclick="history.back(-1);"class="fsubmit">
			 		<!--Author Comments Start-->
					<!--  <div class="post-comments wf100">
						<h4>Comments on Post</h4>
						<ul class="comments">
							Comment Start
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
							Comment End
						</ul>
					</div>
					Author Comments End

					Leave a Comment Start
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
					</div> -->
					<!--Leave a Comment End-->
				</div>
				<!--Blog Single Content End-->
			</div>
		</div>
	</section>
</body>
</html>