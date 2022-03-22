<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
<section class="contact-page wf100 p80">
            <div class="container">
               <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-10">
                     <div class="contact-form mb60">
                        <h3>글쓰기</h3>
                        <form action="noticeinsert.do" method="post" enctype="multipart/form-data">
                        <ul class="cform">
                           <li class="full">
                              <input type="text" class="form-control" placeholder="제목" name="notice_title" required >
                           </li>
                           <div class="filebox" style="float: right">
  								<!-- <label for="ex_file">사진 업로드</label>
  								<input type="file" id="ex_file" name="noticefile"> -->
  								<input class="upload-name" value="파일선택" disabled="disabled">
										<label for="ex_filename">업로드</label> <input type="file"
											id="ex_filename" class="upload-hidden" name="noticefile">
						   </div>
                            <li class="full">
                              <textarea class="textarea-control" placeholder="내용"  name="notice_con" required></textarea>
                           </li>
                           <li class="full">
                              <input type="submit" value="등록" class="fsubmit">
                           </li>
                        </ul>
                        <input type="hidden" name="mem_name" value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name} ">
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </section>
</body>
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
</html>