<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
   <meta charset="UTF-8">
   <title>공지사항 메인 페이지</title>
   <!-- 게시판 리스트 출력 하는 부분 --> 
   <link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
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
   <div class="container p80">
      <div class="col-lg-9 col-md-8 side-widget">       
      </div>
   </div>
   <section class="shop wf100 p80">
      <div class="container">
         <div class="row" id="prolist">
            <div class="col-md-12">
                         <div id="grid"></div> <!-- grid 불러오기 -->
               <a href="noticeinsert.do" class="view-more" style="color: white; cursor: pointer;">글쓰기</a>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <div class="gt-pagination">
                  <nav>
                     <ul class="pagination">
                        <li class="page-item"> <a class="page-link" href="#" aria-label="Previous"> <i
                                 class="fas fa-angle-left"></i> </a> </li>
                        <li class="page-item active"><a class="page-link" href="noticea.do">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"> <a class="page-link" href="#" aria-label="Next"> <i
                                 class="fas fa-angle-right"></i> </a> </li>
                     </ul>
                  </nav>
               </div>
            </div>
         </div>
      </div>
   </section>
   
   
                 
      <script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
      <script>
      const gridData = [{
    	 	 notice_no: '10012',  //데이터 생성
      	  	notice_title: 'Seoul',
      	  	notice_img: '1',
          	notice_name:'1',
          	notice_day:'1',
          	notice_hit:'1',
          	notice_con: 'South Korea'
          },{
        	  notice_no: '10012',  //데이터 생성
          	  notice_title: 'Seoul',
          	  notice_img:'1',
              notice_name:'1',
              notice_day:'1',
              notice_hit:'1',
              notice_con: 'South Korea'
          },{
        	  notice_no: '10012',  //데이터 생성
          	  notice_title: 'Seoul',
          	  notice_img: '1',
              notice_name:'1',
              notice_day:'1',
              notice_hit:'1',
              notice_con: 'South Korea'
          },{
        	  notice_no: '10012',  //데이터 생성
          	  notice_title: 'Seoul',
          	  notice_img:'1',
              notice_name:'1',
              notice_day:'1',
              notice_hit:'1',
              notice_con: 'South Korea'
          },{
        	  notice_no: '10012',  //데이터 생성
          	  notice_title: 'Seoul',
          	  notice_img:'1',
              notice_name:'1',
              notice_day:'1',
              notice_hit:'1',
              notice_con: 'South Korea'
          }, {
        	  notice_no: '10012',  //데이터 생성
          	  notice_title: 'Seoul',
          	  notice_img:'1',
              notice_name:'1',
              notice_day:'1',
              notice_hit:'1',
              notice_con: 'South Korea', 
      		},];

        const grid = new tui.Grid({
          el: document.getElementById('grid'),
          data: gridData,
          scrollX: false,
          scrollY: false,
          columns: [{
              header: '번호',
              name: 'notice_no',
            },{
              header: '제목',
              name: 'notice_title',
            },{
              header: '첨부파일',
              name: 'notice_img',
            },{
               header: '작성자',
               name: 'mem_name',
            },{
               header: '등록일',
               name: 'notice_day',
            },{
               header: '조회',
               name: 'notice_hit',
            },{
                header: '내용',
                name: 'notice_con',
             }],
        });
 </script>
   </body>
</html>