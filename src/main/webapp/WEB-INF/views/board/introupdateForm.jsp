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

<style>
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #5cb85c;
  cursor: pointer;
  border: 1px solid #4cae4c;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.filebox label:hover {
  background-color: #6ed36e;
}

.filebox label:active {
  background-color: #367c36;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
</style>
</head>
<body>
	<div class="wrapper">

		<!--Inner Header End-->
		<!--About Start-->
		<section class="contact-page wf100 p80">
            <div class="container">
               <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-10">
                     <div class="contact-form mb60">
                        <h3>수정</h3>
                        <ul class="cform">
                           <!-- 파일업로드 버튼 구성 -->
                           <div class="filebox" style="float: right">
  								<label for="ex_file">사진 업로드</label>
  								<input type="file" id="ex_file">
						   </div>
                           
                           <li class="full">
                              <input type="submit" value="수정" onclick="location.href='intro.do'"class="fsubmit">
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </section>


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