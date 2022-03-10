<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기 메인페이지</title>
</head>
<body>
	<div class="container p80">
		<div class="col-lg-9 col-md-8 side-widget"></div>
		<!-- 검색 버튼 추가 -->
		<div class="col-lg-3 col-md-4 side-search">
			<input type="search" class="form-control" placeholder="Search"
				id="autoCompt">
			<button>
				<i class="fas fa-search"></i>
			</button>
		</div>
	</div>

	<section class="shop wf100 p80">
		<div class="container">
			<div class="row" id="prolist">
				<!-- 판매 리스트 출력 시작 -->
				<c:forEach items="${useRevwList}" var="useRevw">
					<div class="col-lg-3 col-sm-6">
						<div class="product-box">
								 <a href="useRevwDetail.do?use_revw_no=${useRevw.use_revw_no }">
									 <img src="resources/images/shop/pro1.jpg" alt="">
								 </a>
							<div class="pro-txt">
								<h6>
									<a href="useRevwDetail.do?use_revw_no=${useRevw.use_revw_no }">
										${useRevw.use_revw_title}</a>
								</h6>
								<p class="pro-price">작성자 : ${useRevw.mem_name }</p>
								<p class="pro-price">조회수 : ${useRevw.use_revw_hit }</p>
								<p class="pro-price">작성일자 : ${useRevw.use_revw_write_day }</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 판매 리스트 출력 끝 -->
				<div class="col-md-12">
					<a href="useRevwInsertForm.do" class="view-more"
						style="color: white; cursor: pointer;">이용후기 등록 버튼</a>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="gt-pagination">
						<nav>
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <i class="fas fa-angle-left"></i>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <i class="fas fa-angle-right"></i>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>