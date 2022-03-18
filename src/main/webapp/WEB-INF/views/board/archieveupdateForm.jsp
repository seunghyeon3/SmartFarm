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
   ${archieve}
   <section class="contact-page wf100 p80">
      <div class="container">
         <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
               <div class="contact-form mb60">
                  <h3>수정페이지</h3>
                  <form action="archieveupdate.do" method="post"
                     enctype="multipart/form-data">
                     <ul class="cform">
                        <li class="full"><input type='hidden' name="archieve_no"value=${archieve.archieve_no}> 
                        <input type="text"class="form-control" placeholder="제목" name="archieve_title" required value=${archieve.archieve_title}></li>
                        <div class="filebox" style="float: right"><label for="ex_file">사진 업로드</label><input type="file"id="ex_file" name="archievefile">
                        </div>
                        <li class="full"><textarea class="textarea-control"placeholder="내용" name="archieve_con" required>${archieve.archieve_con}</textarea>
                        </li>
                        <li class="half pr-15"><input type="submit" value="확인" onclick="location.href=archieveupdate.do" class="fsubmit">
                        </li>
                        <li class="half pr-15">
                        <input type=button value="삭제" onclick="location.href='archievedelete.do?archieve_no=${archieve.archieve_no}'"class="fsubmit">
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