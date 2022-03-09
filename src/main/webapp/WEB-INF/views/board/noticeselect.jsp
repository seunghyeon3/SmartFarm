<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
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

ul>li>p{
	border: 2px solid #e1e1e1;
	background: #fafafa;
	color: #555555;
	height: auto;
	line-height: 49px;
	padding: 0 20px;
}
</style>
<body>
<section class="contact-page wf100 p80">
            <div class="container">
               <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-10">
                     <div class="contact-form mb60">
                        <h3>공지사항</h3>
                        <ul class="cform">
                           <li class="half pr-15">
                               <p>제목: ${notice.notice_title}</p>
                           </li>
                           <li class="half pr-15">
                               <p>날짜: ${notice.notice_day}</p>
                           </li>
                           <li class="full">
                               <p>내용: ${notice.notice_con}</p>
                           </li>
                           <li class="full">
                             <img src="download.do?img=${notice.notice_img}"onError="this.style.visibility='hidden'">
                            </li>
                            <li class="full">
                             <a href="download.do?img=${notice.notice_img}">${notice.notice_img}</a>
                            
                            </li>
                            <li class="half pr-15">
 							   <input type="button" value="수정하기" onclick="location.href='noticeupdateForm.do?notice_no=${notice.notice_no}'" class="fsubmit"> 
                               </li>
                                <li class="half pr-15">
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