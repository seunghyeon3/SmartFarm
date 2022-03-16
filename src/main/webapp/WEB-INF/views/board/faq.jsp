<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">
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
				<div class="col-md-6 col-sm-6"></div>
				<div class="col-md-6 col-sm-1">
					<div class="side-search">
						<!--<form action="noticeSearch.do" method="post"> -->
						<select class="form-control" id="key" name="key"
							style="width: 120px; float: left">
							<!--<option value="faq_con">내용</option>  -->
							<option value="faq_title">제목</option>
						</select> <input type="search" id="val" name="val" class="form-control"
							placeholder="검색"
							style="margin: 0 10px; width: 380px; float: left;">
						<button onclick="searchFnc()" type="submit">
							<i class="fas fa-search"></i>
						</button>
						<!-- </form> -->
					</div>
				</div>
				<div class="col-md-12 col-sm-6" style="padding: 20px;">
					<!-- grid 불러오기 -->
					<div id="grid">
						<div class="accordion" id="accordionExample">
							<c:forEach var="values" items="${faq}" varStatus="status">
								<div class="card">
									<div class="card-header" id="headingOne">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapse${status.count}" aria-expanded="false"
												aria-controls="collapse${status.count}">
												${values.faq_no} ${values.faq_title}</button>
										</h2>
									</div>

									<div id="collapse${status.count}" class="collapse"
										aria-labelledby="headingOne" data-parent="#accordionExample">
										<div class="card-body">${values.faq_con}
											<sec:authorize access="hasRole('ADMIN')">
												<a href="faqdelete.do?faq_no=${values.faq_no}"
													class="view-more" style="color: white; cursor: pointer;">삭제</a>
												<a href="faqupdateForm.do?faq_no=${values.faq_no}"
													class="view-more" style="color: white; cursor: pointer;">수정</a>
											</sec:authorize>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<sec:authorize access="hasRole('ADMIN')">
							<a href="faqinsertForm.do" class="view-more"
								style="color: white; cursor: pointer;">글쓰기</a>

						</sec:authorize>
					</div>
				</div>
			</div>
		</div>
		<!--페이징처리 시작-->
		<div class="row">
			<div class="col-md-12">
				<div id="pagination"></div>
			</div>
		</div>
		<!--페이징처리 종료-->
	</section>
	<script type="text/javascript">
	    $(function () {
	        let container = $('#pagination');
	        container.pagination({
	            dataSource: ${faqP},
	            callback: function (data, pagination) {
				var faq;
	                $.each(data, function (index, item) {
	                	faq += '<div class="card>"';
	                	faq += '<div class="card-header" id="headingOne">';
	                	faq += '<h2 class="mb-0">';
	                	faq += '<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse'+index+'" aria-expanded="false" aria-controls="collapse'+index+'">'+item.faq_no+item.faq_title+'</button>';
	                	faq += '</h2></div>';
	                	faq += '<div id="collapse"'+index+'class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">';
	                	faq += '<div class="card-body">'+ item.faq_con;
	                	fqa += '<sec:authorize access="hasRole("'+ADMIN+'")">';
	            	    faq += '<a href="faqdelete.do?faq_no='+item.faq_no+'" class="view-more" style="color: white; cursor: pointer;">삭제</a>'
	            	    faq += '<a href="faqupdateForm.do?faq_no='+item.faq_no+'"class="view-more" style="color: white; cursor: pointer;">수정</a>'
	            	    faq += '</sec:authorize>';
	            	    faq += '</div></div></div>';
	                });
	                $("#accordionExample").html(faq);
	            },
	            pageSize: 3
	        })
	    })
	</script>
</body>
</html>