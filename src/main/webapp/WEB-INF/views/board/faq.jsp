<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">
<style>

</style>
<head>
<meta charset="utf-8">
<title>FAQ</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />

</head>
<body>
	<section class="shop wf100 p80">
		<div class="container">
			<h1>FAQ</h1>
			<div class="row" id="prolist">
			<!-- 	<div class="col-md-6 col-sm-6"></div>
				<div class="col-md-6 col-sm-1">
					<div class="side-search">
						<form action="noticeSearch.do" method="post">
						<select class="form-control" id="key" name="key"
							style="width: 120px; float: left">
							<option value="faq_con">내용</option> 
							<option value="faq_title">제목</option>
						</select> <input type="search" id="val" name="val" class="form-control"
							placeholder="검색"
							style="margin: 0 10px; width: 380px; float: left;">
						<button onclick="searchFnc()" type="submit">
							<i class="fas fa-search"></i>
						</button>
						</form>
					</div>
				</div> -->
				<div class="col-md-12 col-sm-6" style="padding: 20px;">
						<div class="accordion" id="accordionExample">
						</div>
						<sec:authorize access="hasRole('ADMIN')">
							<a href="faqinsertForm.do" class="view-more"
								style="color: white; cursor: pointer;">글쓰기</a>

						</sec:authorize>
				</div>
			</div>
		</div>
		<!--페이징처리 시작-->
		<div class="row" style="display: flex; justify-content: center;">
				<div id="pagination" style="margin: 0 auto;"></div>
		</div>
		<!--페이징처리 종료-->
	</section>
	<script type="text/javascript">
	    $(function () {
	        let container = $('#pagination');
	        container.pagination({
	            dataSource: ${faqP},
	            callback: function (data, pagination) {
				var faq ="";
				var temp = "";
	                $.each(data, function (index, item) {
	                	temp = `<div class="card" style="padding-bottom:10px;">
	                	<div class="card-header" id="headingOne">
	                	<h2 class="mb-0">
	                	<button class="btn btn-link btn-block text-left" data-toggle="collapse" data-target="#collapse\${index}"aria-expanded="false" aria-controls="collapse\${index}">\${item.faq_no}. \${item.faq_title}</button>
	                	</h2></div>
	                	<div id="collapse\${index}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
	                	<div class="card-body"> \${ item.faq_con}
	                	<sec:authorize access="hasRole('ADMIN')">
	                	<br>
	            	    <a href="faqdelete.do?faq_no=\${item.faq_no}" class="view-more" style="color: white; cursor: pointer; margin: 0px 10px 0px 10px;">삭제</a>
	            	    <a href="faqupdateForm.do?faq_no=\${item.faq_no}"class="view-more" style="color: white; cursor: pointer; margin: 0px 10px 0px 10px;">수정</a>
	            	    </sec:authorize> </div></div></div>`;
	            	    faq += temp
	                });
	                $("#accordionExample").html(faq);
	            },
	        })
	    })
	</script>
</body>
</html>