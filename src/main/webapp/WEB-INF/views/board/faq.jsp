<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>FAQ</title>
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
          	<h3>FAQ</h3>
            <div class="col-md-12">
             <!-- grid 불러오기 -->
                       <div id="grid"></div>
               <a href="faqinsertForm.do" class="view-more" style="color: white; cursor: pointer;">글쓰기</a>
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
   
   <div>

   </div>
              <!-- 4 --> 
      <script>
		//표 출력
	const grid = new tui.Grid({
	  rowHeight : 'auto',
	  rowWidth : 'auto',
      el: document.getElementById('grid'),
      data: ${faq},
      rowHeaders: ['checkbox'],
      bodyHeight: 500,
      treeColumnOptions: {
    	    name: 'faq_title',
    	    useCascadingCheckbox: true,
    	    indentWidth:22
    	  },
      columns: [
        {
          header: '번호',
          name: 'faq_no',
          width: 300
        },
        {
          header: '제목',
          name: 'faq_title'
        },
        
      ]
    });

    grid.on('click', ev => {
      const { rowKey } = ev;
      const descendantRows = grid.getDescendantRows(rowKey);

      console.log('rowKey: ' + rowKey);
      console.log('descendantRows: ' + descendantRows);

      if (!descendantRows.length) {
    	  grid.appendRow(
	          {
	        	
	            name: 'faq.faq_title',
	            
	            _children: [
	          	{   
	          		name: 'faq.faq_con'
	          	},
	           {
	             name: 'faq.faq_con',
	            _children: []
	           }
	               ]
	              },
	                
	          { parentRowKey: rowKey }
	        );
	      }
    });
   
    grid.on('expand', (ev) => {
    	  const {rowKey} = ev;
    	  const descendantRows = grid.getDescendantRows(rowKey);

    	  console.log('rowKey: ' + rowKey);
    	  console.log('descendantRows: ' + descendantRows);
    	});
  
 </script>
   </body>
</html>