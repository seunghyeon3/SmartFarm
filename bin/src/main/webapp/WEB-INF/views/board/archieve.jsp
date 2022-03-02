<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>자료실 페이지</title>
   <!-- 게시판 리스트 출력 하는 부분 -->
   
    <script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script> 
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
${archieve}
   <div class="container p80">
      <div class="col-lg-9 col-md-8 side-widget">       
      </div>
   </div>
   
   
   <section class="shop wf100 p80">
      <div class="container">
         <div class="row" id="prolist">
          	<h3>자료실</h3>
            <div class="col-md-12">
                       <div id="grid"></div> <!-- grid 불러오기 -->
               <a href="archieveinsertForm.do" class="view-more" style="color: white; cursor: pointer;">글쓰기</a>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <div class="gt-pagination">
                  <nav>
                     <ul class="pagination">
                        <li class="page-item"> <a class="page-link" href="#" aria-label="Previous"> <i
                                 class="fas fa-angle-left"></i> </a> </li>
                        <li class="page-item active"><a class="page-link" href="archieve.do">1</a></li>
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
   
   <div>

   </div>
              <!-- 4 --> 
      <script>
		//표 출력
		var grid = new tui.Grid({
			rowHeight : 'auto',
			rowWidth : 'auto',
			el : document.getElementById('grid'),
			rowHeaders : [ 'rowNum' ],//번호 매기기
			scrollX : false,
			scrollY : false,
			columns : [{
	              header: '번호',
	              name: 'archieve_no',
	            },{
	              header: '제목',
	              name: 'archieve_title',
	            },{
	              header: '내용',
	              name: 'archieve_con',
	            },{
	               header: '조회',
	               name: 'archieve_hit',
	            },{
	               header: '등록일',
	               name: 'archieve_day',
	            },{
	               header: '첨부파일',
	               name: 'archieve_img',
	            },{
	                header: '작성자',
	                name: 'mem_name',
	             }]
		});

		// GRID 에 데이터를 입력
		var gridData = ${archieve};	
		grid.resetData(gridData);
		
		grid.on('click', (ev) => {
			  if (ev.columnName === 'archieve_title') {
				  location.href='archieveselect.do?archieve_no='+gridData[ev.rowKey].archieve_no
			  }
			});
 </script>
   </body>
</html>
