<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />


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
      padding: 30px;
      font-size: 16px;
      }
   </style>



   
</head>

<body>
   
  <header class="header-style-2">
            <nav class="navbar navbar-expand-lg">
               <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do" style="width: 200px;">
               <img src="<c:url value='/resources/images/smartlogo.png'/>" alt="" style="max-width: 60%; height: auto;"></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <i class="fas fa-bars"></i> </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent" >
                  <ul class="navbar-nav mr-auto" id = "headerfont">
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="intro.do" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ????????? ??? ?????? </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/intro.do?intro_board_class=intro3">????????? ??? ??????</a></li>
                           <li><a href="${pageContext.request.contextPath}/introg.do?intro_board_class=intro2">?????? ??????</a></li>
                           <li><a href="${pageContext.request.contextPath}/intron.do?intro_board_class=intro1">?????? ??????</a></li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="events-grid.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ????????? ??? ?????? </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/notice.do">????????????</a></li>
                           <li><a href="${pageContext.request.contextPath}/archieve.do">?????????</a></li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="plantShopList.do" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ?????? </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/plantShopList.do">?????? ??????</a></li>
                           <li><a href="${pageContext.request.contextPath}/kitShopList.do?kitPrpos=&orderBy=name">?????? ??????</a></li>
                        </ul>
                     </li>
                     <!-- 220308 PSH ?????? ??? ????????? ?????? ?????? ????????? ?????? -->
                     <sec:authorize access="isAuthenticated()">
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ?????? </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/aucnMain.do">NFT ??????</a></li>
                        </ul>
                     </li>
                     </sec:authorize>
                     
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="blog.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ???????????? </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/free.do">?????? ?????????</a></li>
                           <li><a href="${pageContext.request.contextPath}/useRevwMain.do">?????? ??????</a> </li>
                           
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ???????????? </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/qna.do">QnA</a></li>
                           <li><a href="${pageContext.request.contextPath}/faq.do">FAQ</a> </li>

                         </ul>  
                     </li>
                       <!-- 220308 PSH ?????? ??? ????????? ?????? ?????? ????????? ?????? -->
                     <sec:authorize access="hasAnyRole('MEMBER','FARMER')">
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="blog.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ????????? ????????? </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/grow.do">?????? ???</a></li>
                           <li><a href="${pageContext.request.contextPath}/howTo.do">?????????</a> </li>
                           <li><a href="${pageContext.request.contextPath}/cctv.do">CCTV</a></li>
                           <li><a href="${pageContext.request.contextPath}/control.do">????????????</a> </li>
                           <li><a href="${pageContext.request.contextPath}/sensor.do">????????? ??????</a></li>
                           <li><a href="${pageContext.request.contextPath}/log.do">?????? ??????</a></li>
                           <li><a href="${pageContext.request.contextPath}/diary.do">?????? ??????</a></li>
                        </ul>
                     </li>
                     </sec:authorize>
                       <!-- 220308 PSH ????????? ??? ????????? ?????? ?????? ????????? ?????? -->
                    	<sec:authorize access="hasRole('ADMIN')">
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="contact.html" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ????????? ????????? </a>
                        <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/admin/adminHome.do">??????</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminPurchaseList.do">?????? ?????? ??????</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminManageMember.do ">????????????</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminManageKit.do">????????????</a> </li>
                           <li><a href="${pageContext.request.contextPath}/admin/adminManageNFT.do">NFT ?????? ??????</a> </li>
                        </ul>
                     </li>
                    </sec:authorize>
                  </ul>
                            <!-- 220308 PSH session ?????? ?????? ?????? ????????? ???. -->
                  <ul class="topnav-right"  id="headerfont">
                     
					<sec:authorize access="isAnonymous()">
					 <li class="login-reg"> <a href="${pageContext.request.contextPath}/login.do">Login</a> | <a href="${pageContext.request.contextPath}/register.do">Signup</a> </li>
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
					<!-- 220308 PSH mypage -> mem_name ?????? -->
					 <sec:authorize access="hasAnyRole('ADMIN')">
					 <li class="login-reg"> <a href="${pageContext.request.contextPath}/logout.do">Logout</a> | <a href="javascript:void(0)" style="cursor: default; color:#cee5cb;">${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name}???</a> </li>
					 				 
					 </sec:authorize>
					 <sec:authorize access="hasAnyRole('FARMER','MEMBER')">
						<li class="login-reg"> <a href="${pageContext.request.contextPath}/logout.do">Logout</a> | <a href="enterPw.do">${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name}???</a> </li>
					 				 
					 </sec:authorize>
					 <%-- <li class="login-reg"> <a href="${pageContext.request.contextPath}/logout.do">Logout</a> | <a href="enterPw.do">${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name}???</a> </li> --%>
					 </sec:authorize>
					 <sec:authorize access="hasAnyRole('FARMER','MEMBER')">
					 <li class="dropdown">
                        <a class="cart-icon" href="${pageContext.request.contextPath}/cartDetail.do" role="button" id="cartdropdown"  style="padding: 0px;"> <i class="fas fa-shopping-cart"></i></a> 
                     </li>					 
					 </sec:authorize>
                  </ul>
               </div>
            </nav>
         </header> 
   <!-- ?????? ???????????? ?????? ?????? ????????? -->
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
   <script src="${pageContext.request.contextPath}/resources/js/websocket.js"></script>

   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
      integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script type="text/javascript" src="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.js"></script>
   
   <!-- toast ui pagination -->
   <script type="text/javascript"
		src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
   <script type="text/javascript"
		src="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.js"></script>
	
    <script type="text/javascript">
    /* 220309 PSH home, header ?????? ?????? ??????, ?????? js ????????? movePage.js ?????? */
    console.log(window.location.pathname);
	console.log("${pageContext.request.contextPath}");
	
	console.log("${SPRING_SECURITY_CONTEXT.authentication.principal}");
	
    movePage(window.location.pathname, "${pageContext.request.contextPath}")
    
   </script> 
</body>
</html>