<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기 메인페이지</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />

</head>
<body>
	<div class="container p80">
		<div class="col-lg-9 col-md-8 side-widget"></div>
		<!-- 검색 버튼 추가 -->
		<div class="col-lg-3 col-md-4 side-search">
			<input type="search" class="form-control"
				placeholder="제목을 입력하세요" id="useRevwTitle">
			<button onclick="searchUseRevw()">
				<i class="fas fa-search"></i>
			</button>
		</div>
	</div>

	<section class="shop wf100 p80">
		<div class="container">
			<div class="row" id="prolist">
				<!-- 판매 리스트 출력 시작 -->
				<%-- <c:forEach items="${useRevwList}" var="useRevw">
					<div class="col-lg-3 col-sm-6">
						<div class="product-box">
								 <a href="javascript:void(0)" onclick="useRevwHit('${useRevw.use_revw_no }')">
									 <img src="resources/images/shop/pro1.jpg" alt="">
								 </a>
							<div class="pro-txt">
								<h6>
									<a href="javascript:void(0)" onclick="useRevwHit('${useRevw.use_revw_no }')">
										${useRevw.use_revw_title}</a>
								</h6>
								<p class="pro-price">작성자 : ${useRevw.mem_name }</p>
								<p class="pro-price">조회수 : ${useRevw.use_revw_hit }</p>
								<p class="pro-price">작성일자 : ${useRevw.use_revw_write_day }</p>
							</div>
						</div>
					</div>
				</c:forEach> --%>
				<!-- 판매 리스트 출력 끝 -->
			</div>
				<sec:authorize access="isAuthenticated()">
					<div class="col-md-12">
						<a href="useRevwInsertForm.do" class="view-more"
							style="color: white; cursor: pointer;">이용후기 등록</a>
					</div>
				</sec:authorize>

		<!--페이징처리 시작-->
		<div class="row" style="display: flex; justify-content: center;">
				<div id="pagination" style="margin: 0 auto;"></div>
		</div>
		<!--페이징처리 종료-->
		
		</div>
	</section>
	
	<script>
	    $(function () {
	        let container = $('#pagination');
	        container.pagination({
	            dataSource: ${useRevwList},
	            callback: function (data, pagination) {
				var useRevw ="";
				var temp = "";
	                $.each(data, function (index, item) {
	                	temp = `<div class="col-lg-3 col-sm-6">
							<div class="product-box">
							 <a href="javascript:void(0)" onclick="useRevwHit('\${item.use_revw_no }')">
								 <img src="../upload/${item.use_revw_ori_rou}" alt="">
							 </a>
						<div class="pro-txt">
							<h6>
								<a href="javascript:void(0)" onclick="useRevwHit('\${item.use_revw_no }')">
									\${item.use_revw_title}</a>
							</h6>
							<p class="pro-price">작성자 : \${item.mem_name }</p>
							<p class="pro-price">조회수 : \${item.use_revw_hit }</p>
						</div>
					</div>
				</div>`;
				useRevw += temp
	                });
	                $("#prolist").html(useRevw);
	            },
	        })
	    })
	
		function searchUseRevw(){
	    	var useRevwTitle = document.getElementById("useRevwTitle").value;
	    	var url = "useRevwSearch.do?useRevwTitle="+useRevwTitle;
			location.href=url;
		}
		
		function useRevwHit(useRevwNo){
			var useRevwHitUrl = "useRevwHit.do?useRevwNo="+useRevwNo;
			var useRevwDetailUrl = "useRevwDetail.do?useRevwNo="+useRevwNo; 
			$.ajax({
				type : "POST",
				url : useRevwHitUrl,
				success : function() {

					location.href = useRevwDetailUrl; 
							
				} //success
			});
		}
	</script>
</body>
</html>