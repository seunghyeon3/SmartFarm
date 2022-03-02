<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
      <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">
      <link href="<c:url value="/resources/css/color.css" />" rel="stylesheet">
      <link href="<c:url value="/resources/css/responsive.css" />" rel="stylesheet">
      <link href="<c:url value="/resources/css/owl.carousel.min.css" />" rel="stylesheet">
      <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
      <link href="<c:url value="/resources/css/prettyPhoto.css" />" rel="stylesheet">
      <link href="<c:url value="/resources/css/all.min.css" />" rel="stylesheet">
      <link href="<c:url value="/resources/css/popup.css" />" rel="stylesheet">
      <link href="<c:url value="/resources/css/table.css" />" rel="stylesheet">
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <style type="text/css">
      body{
      background-image: url("${pageContext.request.contextPath}/resources/images/aboutbg.jpg");
      background-size: cover;
      background-repeat: no-repeat;
      background-color: #fff;
      }
      </style>
</head>
<body >
<header class="header-style-2">
            <nav class="navbar navbar-expand-lg">
               <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do"><img src="<c:url value='/resources/images/smartlogo.png'/>" alt=""></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <i class="fas fa-bars"></i> </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="intro.do" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 스마트 팜 안내 </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/intro.do">스마트 팜 안내</a></li>
                           <li><a href="${pageContext.request.contextPath}/introg.do">과수 분야</a></li>
                           <li><a href="${pageContext.request.contextPath}/intron.do">노지 분야</a></li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="events-grid.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 스마트 팜 알림 </a>
                        <ul class="dropdown-menu">
                           <li><a href="notice.do">공지사항</a></li>
                           <li><a href="#">자료실</a></li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="plantShopList.do" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 판매 </a>
                        <ul class="dropdown-menu">
                           <li><a href="plantShopList.do">작물 판매</a></li>
                           <li><a href="#">키트 판매</a></li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="blog.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
                        <ul class="dropdown-menu">
                           <li><a href="#">자유 게시판</a></li>
                           <li><a href="#">이용 후기</a> </li>
                           
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 고객지원 </a>
                        <ul class="dropdown-menu">
                           <li><a href="#">QnA</a></li>
                           <li><a href="#">FAQ</a> </li>

                         </ul>  
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="blog.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 컨트롤 페이지 </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/grow.do">재배 홈</a></li>
                           <li><a href="${pageContext.request.contextPath}/howTo.do">사용법</a> </li>
                           <li><a href="${pageContext.request.contextPath}/cctv.do">CCTV</a></li>
                           <li><a href="${pageContext.request.contextPath}/control.do">재배관리</a> </li>
                           <li><a href="${pageContext.request.contextPath}/sensor.do">실시간 정보</a></li>
                           <li><a href="${pageContext.request.contextPath}/log.do">일별 로그</a></li>
                           <li><a href="${pageContext.request.contextPath}/diary.do">영농 일지</a></li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="contact.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 관리자 페이지 </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/admin/adminHome.do">매출</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminPurchaseList.do">키트 구매 현황</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminManageMember.do ">회원관리</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminManageKit.do">작물관리</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminManageNFT.do">NFT 현황 조회</a> </li>
                        </ul>
                     </li>
                  </ul>
                  <ul class="topnav-right">
                     <li class="dropdown">
                        <a class="cart-icon" href="#" role="button" id="cartdropdown" data-toggle="dropdown"> <i class="fas fa-shopping-cart"></i></a>
                     </li>


                     <li class="login-reg"> <a href="${pageContext.request.contextPath}/login.do">Login</a> | <a href="#">Signup</a> </li>
                     <li class="login-reg"> <a href="#">Logout</a> | <a href="mypage.do">Mypage</a> </li>

                  </ul>
               </div>
            </nav>
         </header>
         <!-- 각자 페이지에 맞게 추가 해아함 -->    
         <section class="wf100 p100 inner-header">
            <div class="container" id="menu">
            <h1>header파일에 링크 넣어주세요</h1>
            <!--    <h1>About Us</h1>
               <ul>
                  <li><a href="#">Home</a></li>
                  <li><a href="#">About Us</a></li>
               </ul> -->
            </div>
         </section>
            
         <h5>메인 내용 들어가야할 곳</h5>  
           
         <footer class="footer">
            <div class="footer-top wf100">
               <div class="container">
                  <div class="row">
                     <div class="col-lg-3 col-md-6 col-sm-6">
                        <!--Footer Widget Start-->
                        <div class="footer-widget">
                           <h4>주식회사 Gr.Miner</h4>
                           <p> 사업자등록번호 : 347-01-003325 </p> 
                           <p> 대표이사 : 이익준 </p>
                           <p> 주소 : 대구광역시 중구 남일동 중앙대로 403 </p>
                        </div>
                        <!--Footer Widget End--> 
                     </div>
                     <div class="col-lg-3 col-md-6 col-sm-6">
                        <!--Footer Widget Start-->
                        <div class="footer-widget">
                           <h4>운영시간</h4>
                           <p> 월요일 ~ 금요일 </p>
                           <p> 주말 및 공휴일 휴무 </p>
                           <p> AM 09:00 ~ PM 06:00 </p>
                           <p> Lunch Time PM 12:00 ~ 01:30 </p>
                        </div>
                        <!--Footer Widget End--> 
                     </div>
                     <div class="col-lg-3 col-md-6 col-sm-6">
                        <!--Footer Widget Start-->
                        <div class="footer-widget">
                           <h4>고객센터</h4>
                           <p> yedam@yedam.ac </p>
                           <p> 전화 : 053-421-2460 </p>
                        </div>
                     </div>
                     <div class="col-lg-3 col-md-6 col-sm-6">
                          <img src="https://media1.giphy.com/media/l1J9yYblNRmcHXNok/giphy.gif?cid=ecf05e47vzqiqpqp4axb33ff0druao7l8xe339rc7etnf518&rid=giphy.gif&ct=g" alt="사진이 엄서용" style="width: 400px">
                       </div>
                  </div>
               </div>
            </div>
         </footer>
         
        <!-- 로딩 페이지 관련 소스, popup.css 같이 확인 하면됨. -->
        <!--  <script type="text/javascript">
        <div id="loading" class="loading">
 		<img src="resources/images/loadingicon.gif" alt="로딩중입니다." class="mx-auto d-block">
 		</div>
         function test(){
        	 $('#loading').css({
        		 'align-items':'center', 'display': 'flex', 'justify-content':'center'
        	 });
         }
         </script> -->
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
      <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-1.4.1.min.js"></script> 
      <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script> 
      <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
      <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script> 
      <script src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script> 
      <script src="${pageContext.request.contextPath}/resources/js/isotope.min.js"></script> 
      <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>