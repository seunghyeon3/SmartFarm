<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <link href="<c:url value="/resources/css/tui-grid.css" />" rel="stylesheet" />
   <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/color.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/responsive.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/owl.carousel.min.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/prettyPhoto.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/all.min.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/popup.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/table.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/slick.css" />" rel="stylesheet">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
      integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />

   <style type="text/css">
      body {
         background-image: url("${pageContext.request.contextPath}/resources/images/aboutbg.jpg");
         background-size: cover;
         background-repeat: repeat;
         background-color: #fff;
      }

      div[name=settingMenu]>h3 {
         color: white;
      }

      div[name=settingMenu]>h3>a {
         color: white;
      }

      div[name=settingMenu]>h3>a:hover {
         color: yellow;
      }
      div[name=settingMenu]>h3>a:active {
         color: red;
      }
      #headerfont > li > a{
      padding: 14px;
      font-size: 22px;
      }
   </style>



   
</head>

<body>
   
  <header class="header-style-2">
            <nav class="navbar navbar-expand-lg">
               <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do"><img src="<c:url value='/resources/images/smartlogo.png'/>" alt="" style="max-width: 100%; height: auto;"></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <i class="fas fa-bars"></i> </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent" >
                  <ul class="navbar-nav mr-auto" id = "headerfont">
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="intro.do" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 스마트 팜 안내 </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/intro.do?intro_board_class=intro3">스마트 팜 안내</a></li>
                           <li><a href="${pageContext.request.contextPath}/introg.do?intro_board_class=intro2">과수 분야</a></li>
                           <li><a href="${pageContext.request.contextPath}/intron.do?intro_board_class=intro1">노지 분야</a></li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="events-grid.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 스마트 팜 알림 </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/notice.do">공지사항</a></li>
                           <li><a href="${pageContext.request.contextPath}/archieve.do">자료실</a></li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="plantShopList.do" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 판매 </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/plantShopList.do">작물 판매</a></li>
                           <li><a href="${pageContext.request.contextPath}/kitShopList.do">키트 판매</a></li>
                        </ul>
                     </li>
                     <!-- 220308 PSH 회원 일 경우만 사용 가능 하도록 구분 -->
                     <c:if test="${member ne null}">
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 경매 </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/aucnMain.do">NFT 경매</a></li>
                        </ul>
                     </li>
                     </c:if>
                     
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="blog.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/free.do">자유 게시판</a></li>
                           <li><a href="${pageContext.request.contextPath}/useRevwMain.do">이용 후기</a> </li>
                           
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 고객지원 </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/qna.do">QnA</a></li>
                           <li><a href="${pageContext.request.contextPath}/faq.do">FAQ</a> </li>

                         </ul>  
                     </li>
                       <!-- 220308 PSH 회원 일 경우만 사용 가능 하도록 구분 -->
                     <c:if test="${member ne null }">
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
                     </c:if>
                     
                       <!-- 220308 PSH 회원 일 경우만 사용 가능 하도록 구분 -->
                        <c:if test="${member.mem_athr eq 'B0' }">
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="contact.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 관리자 페이지 </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/admin/adminHome.do">매출</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminPurchaseList.do">키트 구매 현황</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminManageMember.do ">회원관리</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminManageKit.do">키트관리</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminManageNFT.do">NFT 현황 조회</a> </li>
                        </ul>
                     </li>
                     </c:if>
                  </ul>
                            <!-- 220308 PSH session 값에 따라 출력 다르게 함. -->
                  <ul class="topnav-right"  id="headerfont">
                     
					<c:if test="${member eq null}">
					 <li class="login-reg"> <a href="${pageContext.request.contextPath}/login.do">Login</a> | <a href="${pageContext.request.contextPath}/register.do">Signup</a> </li>
					</c:if>
					
					<c:if test="${member ne null }">
					<!-- 220308 PSH mypage -> mem_name 대체 -->
					 <li class="login-reg"> <a href="${pageContext.request.contextPath}/logout.do">Logout</a> | <a href="mypage.do">${member.mem_name}님</a> </li>
					 <li class="dropdown">
                        <a class="cart-icon" href="${pageContext.request.contextPath}/cartDetail.do" role="button" id="cartdropdown" data-toggle="dropdown" style="padding: 0px;"> <i class="fas fa-shopping-cart"></i></a>
                     </li>					 
					</c:if>
                  </ul>
               </div>
            </nav>
         </header> 
   <!-- 각자 페이지에 맞게 추가 해아함 -->
   <section class="wf100 p100 inner-header" style="margin-bottom: 50px; display: none;" id="topMenu">
      <div class="container" id="menuPan" name="settingMenu">

      </div>
   </section>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

   <script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-1.4.1.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/isotope.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/movePage.js"></script>

   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
      integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script type="text/javascript" src="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.js"></script>
   
    <script type="text/javascript">
    /* 220309 PSH home, header 통합 작업 진행, 외부 js 파일은 movePage.js 참고 */
    movePage(window.location.pathname, "${pageContext.request.contextPath}")
   </script> 
</body>
</html>