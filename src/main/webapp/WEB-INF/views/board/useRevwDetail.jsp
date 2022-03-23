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
			
			<!-- 삭제수정조건 -->
			<c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email eq useRevwDetail.mem_email}">
				<div class="col-md-12">
					<a href="useRevwDelete.do?useRevwNo=${useRevwDetail.use_revw_no }" class="view-more"
						style="cursor: pointer;background-color:#e11f3e;color:#ffffff;">삭제</a> <a
						href="useRevwUpdateForm.do?useRevwNo=${useRevwDetail.use_revw_no }&purHisNo=${useRevwDetail.pur_his_order_no }" class="view-more"
						style="color: white; cursor: pointer; margin-right: 5px">수정</a>
				</div>
			</c:if>
			
			<!-- 이용후기시작 -->
				<div class="col-md-1"></div>
				<div class="blog-single-content col-md-10">

					<h3>${useRevwDetail.use_revw_title}</h3>
					<ul class="post-meta">
						<li><i class="fas fa-user-circle"></i>${useRevwDetail.mem_name}</li>
						<li><i class="fas fa-calendar-alt"></i>${useRevwDetail.use_revw_write_day}</li>
						<li><i class="fas fa-comments"></i>${useRevwDetail.use_revw_hit } 조회수</li>
					</ul>

					<div class="blog-single-thumb" style="border-bottom:thick double #32a1ce;">
						<img src="../upload/${useRevwDetail.use_revw_phy_rou }" alt="">
					</div>

					<h5 style="margin-top:80px">${useRevwDetail.use_revw_con}</h5>
					
					</div>
				<div class="col-md-1"></div>
				<!-- 댓글 -->
				<div class="col-md-1"></div>
				<div class="col-md-10" style="margin-top:100px">
				<div class="wf100 comment-form" style="border-bottom: 1px solid #dddddd; margin-bottom:40px;">
					<h5>이용후기 댓글</h5>
					<br><br>
					<sec:authorize access="isAuthenticated()">
					<form action="useRevwCommInsert.do" method ="POST" enctype="application/x-www-form-urlencoded">
						 <div class="form-group">
							${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name} 
			                <input type="text" class="form-control" name="use_revw_comm_con" id="use_revw_comm_con" placeholder="댓글을 입력하세요..." style="margin-bottom:20px">
			                <input type="hidden" name="use_revw_no" id="use_revw_no" value= '${useRevwDetail.use_revw_no }' >
			                <input style="float:right; cursor: pointer; background-color:#66ba6a; color:#ffffff;" type="submit" value="댓글등록" class="fsubmit">
			              </div>	
						</form>
						<br><br>
					</sec:authorize>
				</div>
				
				 <c:forEach items="${useRevwComment}" var="useRevwComment">
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
											href="useRevwCommDelete.do?useRevwCommNo=${useRevwComment.use_revw_comm_no}"
						style="cursor: pointer; color:#e11f3e; float:right; font-size:1.2em">삭제</a></li>
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