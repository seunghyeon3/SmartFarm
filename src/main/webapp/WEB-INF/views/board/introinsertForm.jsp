<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>스마트팜 등록</title>

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
.full{
	display: inline-block;
	text-align: center;

}
.filebox{
	float: right;
}

</style>
</head>
<body>
	<div class="wrapper">
		<section class="contact-page wf100 p80">
            <div class="container">
               <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-10">
                     <div class="contact-form mb60">
                     	<h1>등록</h1>
                     	 <br><br><br>
                     	<form action="introinsert.do" method="post" enctype="multipart/form-data">
                        <ul class="cform">
 						<input type="hidden" name="intro_board_class" value="intro3">	
                           <!-- 파일업로드 버튼 구성 -->
         
  							<!-- 	<label for="ex_file">사진 업로드</label>
  								<input type="file" id="ex_file" name="introfile" value=${intro.intro_img}> -->
  								<div class="filebox">
										<input class="upload-name" value="파일선택" disabled="disabled">
										<label for="ex_filename">업로드</label> <input type="file"
											id="ex_filename" class="upload-hidden" name="introfile">
									</div>
					     <br><br><br>
                           <li class="half pr-15">
                              <input type="submit" value="등록" class="fsubmit">
                           </li>
                           <li class="half pr-15">
                              <input type="submit" value="취소" onclick="history.back(-1);"class="fsubmit">
                           </li>
                        </ul>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         </div>
         <script type="text/javascript">
	$(document).ready(
			function() {
				var fileTarget = $('.filebox .upload-hidden');
				fileTarget.on('change', function() { // 값이 변경되면 
					if (window.FileReader) { // modern browser 
						var filename = $(this)[0].files[0].name;
					} else { // old IE 
						var filename = $(this).val().split('/').pop().split(
								'\\').pop(); // 파일명만 추출 
					} // 추출한 파일명 삽입 
					$(this).siblings('.upload-name').val(filename);
				});
			});
</script>
</body>

</html>