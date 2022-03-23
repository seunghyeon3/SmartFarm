<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
			<div class="row">
		
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
							<img src="../upload/${freeVO.free_phy_rou }" alt="">
						</div>
						<div class="content" style="min-height: 300px;">
							<p>${freeVO.free_con}</p>
						</div>
						<div style="display: flex;">
							<a href='free.do' class="dn-btn" style="margin-top: 10px; width: 150px; text-align: center;">뒤로가기</a>
							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.username" var="user_id"/>
									<c:if test="${user_id eq freeVO.mem_email}">
							<a href='freeDelete.do?free_no=${freeVO.free_no}' class="dn-btn" style="margin-top: 10px; width: 150px; text-align: center;">삭제</a>
							<a href='freeUpdateForm.do?free_no=${freeVO.free_no}' class="dn-btn" style="margin-top: 10px; width: 150px; text-align: center;">수정하기</a>
									</c:if>
							</sec:authorize>
						</div><br><hr>
	
						<!--Author Comments Start-->
	
						<div id="comments" class="post-comments wf100">
							<h5>댓글</h5>
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
							<h5>댓글작성</h5>
							<ul>
								<li class="full"><textarea id="areacomm" class="form-control"
										placeholder="내용을 입력하세요.."></textarea></li>
								<li class="full">
									<button style="height:44px;" id="postcomm" class="post-btn">댓글쓰기</button>
								</li>
							</ul>
						</div>
						<!--Leave a Comment End-->
					</div>
					<!--Blog Single Content End-->
				</div>
								
			<!--TEST-->
					<div class="col-lg-3 col-md-4">
                      <div class="sidebar">
                          <!--Widget Start-->
                    	  <div class="side-widget">
           				  	 <h6>태그</h6>
           				 	 <div class="single-post-tags"> 
           				 		<a href="#">친환경</a> <a href="#"> Plant Ecology </a> <a href="#"> Wildlife </a> <a href="#"> Eco Ideas </a> <a href="#"> 자원관리 </a> <a href="#"> 물 </a> <a href="#"> Forest Planting </a> <a href="#"> Donation </a><a href="#"> 재활용 </a> 
           					 </div>
          				  </div>
          				  <!--Widget End--> 
                         <!--Widget Start-->
                         <div class="side-widget text-widget">
                            <h6>최신글</h6>
                            <c:forEach items="${recentlyFree}" var="free" begin="0" end="5">
                           	 <a style="width:200px;white-space: nowrap;overflow:hidden;text-overflow:ellipsis;" href="freeOne.do?free_no=${free.free_no}">${free.free_title}</a>
                            </c:forEach>
                         </div>
                         <!--Widget End--> 
                         <!--Widget Start-->
                         <div class="side-widget">
                            <h6>NFT경매 목록</h6>
                            <ul class="lastest-products">
						<c:forEach items="${aucnEnable }" var="aucn" begin="0" end="3">
                               <li> 
							<img src="<c:url value='/resources/nft/merge/${aucn.nft_img }'/>" alt="" style="width: 45px; height: 60px;">
                               	<strong>
                               		<a href="aucnDetail.do?aucnNo=${aucn.aucn_no}">${aucn.aucn_title}</a>
							</strong> <span class="pdate">
							<i class="fas fa-calendar-alt"></i>현재 가격 : ${aucn.now_bid }</span> </li>
                            	</c:forEach>
                            </ul>
                         </div>
                         <!--Widget Start--> 
                         <!--Widget Start-->
                         <div class="side-widget project-list-widget">
                            <h6>재배 바로가기</h6>
                            <ul>
                            	<c:forEach items="${kitList}" var="grow">
                               <li><a href="control.do?no=${grow.pur_his_order_no }">${grow.kit_plant_name}</a></li>
                               </c:forEach>
                            </ul>
                         </div>
                         <!--Widget End--> 
                      </div>
                   </div>
			<!--TEST END-->
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
		$("#comments").append('<h5>Comments on Post</h5>');
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