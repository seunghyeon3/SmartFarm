<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>aucn</title>
</head>
<body>
	<!--Blog Start-->
         <section class="wf100 p80 blog">
            <div class="blog-grid">
               <div class="container">
                  <div class="row">
                     <!--Blog Small Post Start-->
                     <c:forEach items="${aucnList }" var="aucn">
                     <div class="col-md-4 col-sm-6">
                        <div class="blog-post">
                           <div class="blog-thumb"> <a href="#"><i class="fas fa-link"></i></a> <img src="resources/nft/merge/${aucn.nft_img }" alt=""> </div>
                           <div class="post-txt">
                              <ul class="post-meta">
                                 <li> <a href="#"><i class="fas fa-clock"> 남은시간</i></a> 
                              <div class="countdown" id="countdown${aucn.aucn_no }" data-date="12-03-2022" data-time="09:00">
						      <div class="day" style="display:none"><span class="num"></span><span class="word"></span></div>
						      <div class="sec" style="float:right;"><span class="num"></span><span class="word"></span></div>
						      <div class="min" style="float:right; margin-right:5px"><span class="num"></span><span class="word"></span></div>
						      <div class="hour" style="float:right; margin-right:5px"><span class="num"></span><span class="word"></span></div>
						   		</div>
						   		</li>
                                 <br>
                                 <li> <a href="#"><i class="fas fa-calendar-alt"></i>현재 최고 입찰가 : ${aucn.now_bid }</a> </li>
                              </ul>
                              <a href="#" class="read-post" style="float:right">경매</a>
                           </div>
                           
                        </div>
                     </div>
                     </c:forEach>
                     <!--Blog Small Post End--> 
                  </div>
                  <div class="gt-pagination">
                     <nav>
                        <ul class="pagination">
                           <li class="page-item"> <a class="page-link" href="#" aria-label="Previous"> <i class="fas fa-angle-left"></i> </a> </li>
                           <li class="page-item"><a class="page-link" href="#">1</a></li>
                           <li class="page-item active"><a class="page-link" href="#">2</a></li>
                           <li class="page-item"><a class="page-link" href="#">3</a></li>
                           <li class="page-item"> <a class="page-link" href="#" aria-label="Next"> <i class="fas fa-angle-right"></i> </a> </li>
                        </ul>
                     </nav>
                  </div>
               </div>
            </div>
         </section>
	
	<script type="text/javascript" src="resources/js/countdown.js"></script>
	<script>
	var countAucn = document.querySelectorAll('.countdown');
	
	var efcc_countdown = {}
		 console.log(countAucn[0].attributes[1].textContent);
	
	console.log(test);
	for(var i =0; i<countAucn.length; i++){
		var test = "#"+countAucn[i].attributes[1].textContent
		  efcc_countdown = new countdown({
		  target: test,
		  dayWord: ' days',
		  hourWord: ' hours',
		  minWord: ' mins',
		  secWord: ' secs'
		});
		}
	</script>
	
</body>
</html>
