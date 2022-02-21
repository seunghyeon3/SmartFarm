<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="images/favicon.png">
<title>ECO HTML</title>
<!-- CSS FILES START -->
<link href="css/custom.css" rel="stylesheet">
<link href="css/color.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/all.min.css" rel="stylesheet">
<link href="css/slick.css" rel="stylesheet">
<!-- CSS FILES End -->
</head>
<body>
	<div class="wrapper">

		<!--Inner Header Start-->
		<section class="wf100 p100 inner-header">
			<div class="container">
				<h1>스마트팜 안내</h1>
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">About Us</a></li>
				</ul>
			</div>
		</section>
		<!--Inner Header End-->
		<!--About Start-->
		<section class="wf100 about">
			<!--About Txt Video Start-->
			<div class="about-video-section wf100">
				<div class="container">
								<form enctype="multipart/form-data"
									method="post">
									<div id="in_title">
										<textarea name="title" id="utitle" rows="1" cols="55"
											placeholder="제목" maxlength="100" required></textarea>
									</div>

									<div class="wi_line"></div>
									<div id="in_content">
										<textarea name="content" id="ucontent" placeholder="내용"
											required></textarea>
									</div>

									<input type="file" name="SelectFile" />


									<div class="bt_se">
									<a href="introinsert.do"><role="submit">등록</a>
									<input type="button" id="btn" value="취소" />
									</div>
								</form>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
			<!--About Txt Video End-->


			<!--   JS Files Start  -->
			<script src="js/jquery-3.3.1.min.js"></script>
			<script src="js/jquery-migrate-1.4.1.min.js"></script>
			<script src="js/popper.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/owl.carousel.min.js"></script>
			<script src="js/jquery.prettyPhoto.js"></script>
			<script src="js/slick.min.js"></script>
			<script src="js/custom.js"></script>
</body>

</html>