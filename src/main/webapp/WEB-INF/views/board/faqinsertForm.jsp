<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록페이지</title>
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
                        <form action="faqinsert.do" method="post" enctype="multipart/form-data">
                        <ul class="cform">
                           <li class="full">
                              <input type="text" class="form-control" placeholder="제목" name="faq_title" required>
                           </li>
                            <li class="full">
                              <textarea class="textarea-control" placeholder="내용" name="faq_con" required></textarea>
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