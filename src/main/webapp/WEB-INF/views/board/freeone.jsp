<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						<li id="count"><i class="fas fa-comments"></i> ${count.comm_count } Comments</li>
					</ul>

					<div class="blog-single-thumb">
						<img src="resources/images/blog/bf4.jpg" alt="">
						<img src="${freeVO.free_phy_rou }" alt="">
					</div>
					<div class="content" style="min-height: 300px;">
						<p>${freeVO.free_con}</p>
					</div>
					<div style="display: flex; flex-direction: row-reverse;">
						<a href='free.do' class="dn-btn" style="margin-top: 10px; width: 150px; text-align: center;">뒤로가기</a>
						<a href='freeDelete.do?free_no=${freeVO.free_no}' class="dn-btn" style="margin-top: 10px; width: 150px; text-align: center;">삭제</a>
						<a href='freeUpdateForm.do?free_no=${freeVO.free_no}' class="dn-btn" style="margin-top: 10px; width: 150px; text-align: center;">수정하기</a>
					</div><br><hr>

					<!--Author Comments Start-->

					<div id="comments" class="post-comments wf100">
						<h4>Comments on Post</h4>
						<c:forEach items="${comments }" var="comm">
						<ul class="comments">
							<!--Comment Start-->
							
							<li class="comment">
								<div class="user-thumb">
									<img src="images/auser.jpg" alt="">
								</div>
								<div class="comment-txt">
									<h6>${comm.mem_name }</h6>
									<p>${comm.free_comm_con }</p>
									<ul class="comment-time">
										<li>Posted: ${comm.free_comm_day }</li>
									</ul>
								</div>
							</li>
							<!--Comment End-->
						</ul>
						</c:forEach>
					</div>
					<!--Author Comments End-->

					<!--Leave a Comment Start-->
					<div class="wf100 comment-form">
						<h4>Leave a Comment</h4>
						<ul>
							<li class="full"><textarea id="areacomm" class="form-control"
									placeholder="Write Comments"></textarea></li>
							<li class="full">
								<button id="postcomm" class="post-btn">Post Your Comment</button>
							</li>
						</ul>
					</div>
					<!--Leave a Comment End-->
				</div>
				<!--Blog Single Content End-->
			</div>
		</div>
	</section>

<script type="text/javascript">

$("#postcomm").on("click",function(event) {
	if(!$("#areacomm").val()) {
		alert("내용을 입력하시오");
		return;
	}
	console.log($("#areacomm").val());
	$.ajax({
		type:'get',
		url:"freeCommInsert.do",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: {
			"free_no":${freeVO.free_no},
			"free_comm_con":$("#areacomm").val()
		},
		error: function() {
			alert("fail");
		}
	}).done(function(result) {
		$("#count").html('<i class="fas fa-comments"></i> '+ result.newcount[0].comm_count +' Comments');
		$("#comments").empty();
		$("#areacomm").val('');
		$("#comments").append('<h4>Comments on Post</h4>');
		for(var i = 0; i<result.newcomments.length; i++) {
			console.log(result.newcomments[i].free_comm_con);
 			var html ='<ul id="comments" class="comments"><li class="comment"><div class="user-thumb"><img src="images/auser.jpg" alt=""></div><div class="comment-txt"><h6>'+result.newcomments[i].mem_name+'</h6><p>'+result.newcomments[i].free_comm_con+'</p><ul class="comment-time"><li>Posted: '+result.newcomments[i].free_comm_day+'</li></ul></div></li></ul>';
 			$("#comments").append(html);
		}
	})
})

</script>

</body>
</html>