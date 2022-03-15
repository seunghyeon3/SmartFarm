<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* input number에서 화살표 없애기 Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
	padding: 0;
}
</style>
</head>

<body>
	<section class="shop wf100 p80">
		<div class="container">
			<div class="row">
			<c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email eq useRevwDetail.mem_email}">
				<div class="col-md-12">
					<a href="useRevwDelete.do?useRevwNo=${useRevwDetail.use_revw_no }" class="view-more"
						style="color: white; cursor: pointer;">삭제</a> <a
						href="useRevwUpdateForm.do?useRevwNo=${useRevwDetail.use_revw_no }&purHisNo=${useRevwDetail.pur_his_order_no }" class="view-more"
						style="color: white; cursor: pointer; margin-right: 5px">수정</a>
				</div>
			</c:if>
				<div class="col-md-6">
					<div class="section-title-2">
						<h5>이용후기</h5>
						<img alt="이미지 들어가야함" src="resources/images/aboutimg.jpg"
							style="width: 300px">
					</div>
				</div>
				<div class="col-md-6">
					<div class="contact-form mb60">
						<ul class="cform">
							<li class="full">
								<h5>제목</h5> <br>
								<h3>${useRevwDetail.use_revw_title}</h3>
								<hr>
							</li>
							<li class="full">
								<h5>내용</h5> <br>
								<div class="col-md-12">${useRevwDetail.use_revw_con}</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="wf100 comment-form">
					<h4>이용후기 댓글</h4>
					
					<ul>
						<li class="w3"><input type="text" class="form-control"
							placeholder="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name }"></li>
						<li class="full"><textarea class="form-control"
								placeholder="댓글 작성"></textarea></li>
						<li class="full">
							<button class="post-btn">Post Your Comment</button>
						</li>
					</ul>

					<ul class="comments">
						<li class="comment">
							<div class="user-thumb">
								<img src="images/auser.jpg" alt="">
							</div>
							<div class="comment-txt">
								<h6>Harry Butler</h6>
								<p>Personally I think a combination of all these methods is
									most effective, but in today’s post I will be focusing
									specifically on how to use and style WordPress’ built-in sticky
									post feature and highlighting it’s best use case based on my
									own experience.</p>
								<ul class="comment-time">
									<li>Posted: 09 July, 2018 at 2:37 pm</li>
									<li><a href="#"><i class="fas fa-reply"></i> Reply</a></li>
								</ul>


							</div>
						</li>

					</ul>
				</div>

			</div>
		</div>
	</section>

	<script>
		//아작스 호출해서 댓글 들고와서 #comments에 넣어주기
	</script>
	
</body>

</html>