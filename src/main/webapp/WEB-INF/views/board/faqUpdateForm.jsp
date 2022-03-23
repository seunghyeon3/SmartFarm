<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<section class="contact-page wf100 p80">
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="contact-form mb60">
						<h3>수정페이지</h3>
						<form action="faqupdate.do" method="post"
							enctype="multipart/form-data">
							<ul class="cform">
								<li class="full"><input type='hidden' name="faq_no"
									value=${faq.faq_no}> <input type="text"
									class="form-control" placeholder="제목" name="faq_title" required
									value=${faq.faq_title}></li>
								<li class="full"><textarea class="textarea-control"
										placeholder="내용" name="faq_con" required>${faq.faq_con}</textarea>
								</li>
								<li class="full">
									<div style="text-align: center;">
										<input type="submit" value="확인"
											onclick="location.href=faupdate.do" class="fsubmit"
											style="width: 112px;">
									</div>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>