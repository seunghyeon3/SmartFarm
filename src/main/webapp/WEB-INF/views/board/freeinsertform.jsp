<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<section class="contact-page wf100 p80">
            <div class="container">
               <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-10">
                     <div class="contact-form mb60">
                        <h3>글쓰기</h3>
                        <form action="archieveinsert.do" method="post" enctype="multipart/form-data">
                        <ul class="cform">
                           <li class="full">
                 
                              <input type="text" class="form-control" placeholder="제목" name="archieve_title" value=${archieve.archieve_title}>
                           </li>
                           <div class="filebox" style="float: right">
  								<label for="ex_file">사진 업로드</label>
  								<input type="file" id="ex_file" name="archievefile">
						   </div>
                            <li class="full">
                              <textarea class="textarea-control" placeholder="내용" name="archieve_con">${archieve.archieve_con}</textarea>
                           </li>
                           <li class="full">
                              <input type="submit" value="등록"  class="fsubmit">
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