<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>aucn</title>
</head>
<body>
   <!--Blog Start-->
   <section class="wf100 team">
      <div class="team-grid team-small-grid p80">
         <div class="container">
            <div class="row">
               <!--Blog Small Post Start-->

               <c:forEach items="${aucnEnable }" var="aucn">
                 <%--  <fmt:parseDate value="${aucn.aucn_start_time}" var="aucnStart"
                     pattern="yyyy-MM-dd HH:mm" />
                  <jsp:useBean id="aucnStartTime" class="java.util.Date" />
                  <jsp:setProperty name="aucnStartTime" property="time"
                     value="${aucnStart.time + 86400000}" /> --%>
    <%--               <fmt:parseDate value="${aucn.aucn_start_time }" var="aucnEnd"
                     pattern="yyyy-MM-dd" /> --%>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                           <div class="blog-post">
                              <div class="blog-thumb">
                                  <img
                                    src="../upload/${aucn.nft_img }" alt="">
                              </div>
                              <div class="post-txt">
                                 <ul class="post-meta">
                                    <li><a href="#"><i class="fas fa-clock"> 남은시간</i></a>

                                       <div class="countdown" id="countdown${aucn.aucn_no }"
                                          data-date="${aucn.aucn_start_time.substring(0,10) }"
                                          data-time="${aucn.aucn_start_time.substring(aucn.aucn_start_time.length()-5,aucn.aucn_start_time.length())}">
                                          <div class="sec" style="float: right;">
                                             <span class="num"></span><span class="word"></span>
                                          </div>
                                          <div class="min" style="float: right; margin-right: 5px">
                                             <span class="num"></span><span class="word"></span>
                                          </div>
                                          <div class="hour" style="float: right; margin-right: 5px">
                                             <span class="num"></span><span class="word"></span>
                                          </div>
                                          <div class="day" style="display: none">
                                             <span class="num"></span><span class="word"></span>
                                          </div>
                                       </div></li>
                                    <br>
                                    <li><i class="fas fa-money-bill"></i>현재
                                          최고 입찰가 : ${aucn.now_bid }</li>
                                 </ul>
                                 <a href="javascript:void(0)" onclick="aucnDetail(${aucn.aucn_no})" class="read-post" style="float: right">경매</a>
                              </div>

                           </div>
                        </div>
               </c:forEach>
               <!--Blog Small Post End-->
            </div>
            <div class="gt-pagination">
               <nav>
                  <ul class="pagination">
                     <li class="page-item"><a class="page-link" href="#"
                        aria-label="Previous"> <i class="fas fa-angle-left"></i>
                     </a></li>
                     <li class="page-item"><a class="page-link" href="#">1</a></li>
                     <li class="page-item active"><a class="page-link" href="#">2</a></li>
                     <li class="page-item"><a class="page-link" href="#">3</a></li>
                     <li class="page-item"><a class="page-link" href="#"
                        aria-label="Next"> <i class="fas fa-angle-right"></i>
                     </a></li>
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
      for (var i = 0; i < countAucn.length; i++) {
         var test = "#" + countAucn[i].attributes[1].textContent
         efcc_countdown = new countdown({
            target : test,
            dayWord : ' 일',
            hourWord : ' 시간',
            minWord : ' 분',
            secWord : ' 초'
         });
      }
      console.log(efcc_countdown);
      
      function aucnDetail(aucnNo){
    	  var countdownId = "countdown"+aucnNo ;
    	  var countdownDisable = document.getElementById(countdownId);
    	   if(countdownDisable.innerText == "경매가 종료되었습니다."){
    		  alert("이미 종료된 경매입니다.");
    		  location.reload();
    	  }
    	  else {
    		  location.href="aucnDetail.do?aucnNo="+aucnNo;
    	  } 
      }
   </script>

</body>
</html>