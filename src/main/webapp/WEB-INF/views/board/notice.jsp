<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
   <header>
   <link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
   </header>
   
   <body>
      <div class="wrapper">
         <!--Header Start-->
        
         <div id="search">
            <button type="button" class="close">Ã</button>
            <form class="search-overlay-form">
               <input type="search" value="" placeholder="type keyword(s) here" />
               <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
            </form>
         </div>
             <div id="grid"></div>
            
        
                  <div class="row">
                     <div class="col-md-12">
                        <div class="gt-pagination mt20">
                           <nav>
                              <ul class="pagination">
                                 <li class="page-item"> <a class="page-link" href="#" aria-label="Previous"> <i class="fas fa-angle-left"></i> </a> </li>
                                 <li class="page-item active"><a class="page-link" href="">1</a></li>
                                 <li class="page-item"><a class="page-link" href="noticea.do">2</a></li>
                                 <li class="page-item"><a class="page-link" href="#">3</a></li>
                                 <li class="page-item"> <a class="page-link" href="#" aria-label="Next"> <i class="fas fa-angle-right"></i> </a> </li>
                              </ul>
                           </nav>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!--Causes End--> 
         <!--Footer Start-->
        
      </div>
      <script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
      <script>
      const gridData = [  //데이터 입력
          {
            notice_no: '10012',
            notice_title: 'Seoul',
            notice_con: 'South Korea',
            notice_hit:
            notice_day:
            notice_img:
            notice_name:
          },
          {
        	  notice_no: '10012',
              notice_title: 'Seoul',
              notice_con: 'South Korea',
              notice_hit:
              notice_day:
              notice_img:
              notice_name:
          },
          {
        	  notice_no: '10012',
              notice_title: 'Seoul',
              notice_con: 'South Korea',
              notice_hit:
              notice_day:
              notice_img:
              notice_name:
          },
          {
        	  notice_no: '10012',
              notice_title: 'Seoul',
              notice_con: 'South Korea',
              notice_hit:
              notice_day:
              notice_img:
              notice_name:
          },
          {
        	  notice_no: '10012',  //데이터 생성
              notice_title: 'Seoul',
              notice_con: 'South Korea',
              notice_hit:
              notice_day:
              notice_img:
              notice_name:
          },
        ];

        const grid = new tui.Grid({
          el: document.getElementById('grid'),
          data: gridData,
          scrollX: false,
          scrollY: false,
          columns: [
            {
              header: '번호',
              name: 'notice_no',
            },
            {
              header: '제목',
              name: 'notice_title',
            },
            {
              header: '첨부파일',
              name: 'notice_img',
            },
            {
                header: '작성자',
                name: 'mem_name',
             },
             {
                  header: '등록일',
                  name: 'notice_day',
             },
             {
                 header: '조회',
                 name: 'notice_hit',
               },
            
          ],
        });


 </script>
      
   </body>


</html>