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
						style="color: white; cursor: pointer;background-color:#e11f3e;color:#ffffff;">삭제</a> <a
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
								<h3>${useRevwDetail.use_revw_title}</h3>
								<hr>
							</li>
							<li class="full">
								<div class="col-md-12">${useRevwDetail.use_revw_con}</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-8" style="margin-top:50px">
				<div class="wf100 comment-form">
					<h5>이용후기 댓글</h5>
					<br><br>
					<sec:authorize access="isAuthenticated()">
					<form action="useRevwCommInsert.do" method ="POST" enctype="application/x-www-form-urlencoded">
						 <div class="form-group">
							${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name} 
			                <input type="text" class="form-control" name="use_revw_comm_con" id="use_revw_comm_con" placeholder="댓글을 입력하세요...">
			                <input type="hidden" name="use_revw_no" id="use_revw_no" value= '${useRevwDetail.use_revw_no }' >
			                <input style="float:right"type="submit" value="댓글등록" class="fsubmit">
			              </div>	
						</form>
						<br><br>
					</sec:authorize>
				</div>
				
				 <c:forEach items="${useRevwComment }" var="useRevwComment">
					<!--Author Comments Start-->
					<div class="post-comments wf100">
						<ul class="comments">
							<!--Comment Start-->
							<li class="comment" style="padding-left: 0px;">
								<div class="comment-txt">
									<h6>${useRevwComment.mem_name}</h6>
									<p>${useRevwComment.use_revw_comm_con}</p>
									<ul class="comment-time">
										<li>${useRevwComment.use_revw_comm_write_day}</li>
										<c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email eq useRevwComment.mem_email}">
										<li><a
											href="useRevwCommDelete.do?useRevwCommNo=${useRevwComment.use_revw_comm_no}" style="float: right;">삭제</a></li>
										</c:if>	
									</ul>
								</div>
							</li>
							<!--Comment End-->
						</ul>
					</div>
					<!--Author Comments End-->
					</c:forEach>
			</div>
			</div>
		</div>
	</section>

	<script>
	    
	    function useRevwCommentCancel(e, id){
	    	
	    	  document.getElementById(id).style.display='none';
	    	  e.parentNode.parentNode.parentNode.parentNode.parentNode.children[0].style.display='block';
	    	  
	    	//console.log(e.parentNode.parentNode.parentNode.parentNode.parentNode.children[0]);
	    }
	</script>
	
</body>

</html>