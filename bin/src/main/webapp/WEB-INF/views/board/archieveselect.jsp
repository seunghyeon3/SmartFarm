<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 상세페이지</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
    <script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script> 
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
                        <h3>자료실 상세페이지</h3>
                        <div id="grid"></div> <!-- grid 불러오기 -->
                        <ul class="cform">
         
                           <li class="full">
                                ${archieve.archieve_title}
                           </li>
                            <li class="full">
                                 ${archieve.mem_name}
                           </li><li class="full">
                              ${archieve.archieve_day}
                           </li>
                           <li class="full">
                                ${archieve.archieve_con}
                           </li>
                           <li class="full">
                          	<img src="c:/Temp/${archieve.archieve_img}">
                           </li>
                           <li class="full">
 								 <%-- <input type="button" value="수정하기" onclick="location.href='noticeupdateForm.do?notice_no=${archieve.archieve_no}'" class="fsubmit"> --%>
 								 <input type="button" value="수정하기" onclick="location.href='archieveupdateForm.do?archieve_no=${archieve.archieve_no}'" class="fsubmit">
                               <input type="button" value="뒤로가기" onclick="history.back(-1);"class="fsubmit">
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </section>    
</body>
</html>