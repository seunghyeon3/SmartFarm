<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
   <meta charset="UTF-8">
   <title>Home</title>
</head>

<body>
   <div class="container p80">
      <div class="col-lg-9 col-md-8 side-widget">

         <!-- 상업용, 취미용 구분 할 수 있는 태그.. href 수정 필요 -->
         <div class="single-post-tags">
            <a href="#">상업용</a>
            <a href="#">취미용</a>
         </div>
      </div>
      
      <!-- 검색 버튼 추가 -->
      <div class="col-lg-3 col-md-4 side-search">
         <input type="search" class="form-control" placeholder="Search" style="float: right;">
         <button><i class="fas fa-search"></i></button>
      </div>
   </div>
   
   <section class="shop wf100 p80">
      <div class="container">
         <div class="row">
         <!-- 박스 리스트 추가 하도록 수정 필요 -->
            <!--Pro Box Start-->
            <div class="col-lg-3 col-sm-6">
               <div class="product-box">
                  <div class="pro-thumb"> <a href="#">Add To Cart</a> <img src="resources/images/shop/pro1.jpg" alt="파일없음"></div>
                  <div class="pro-txt">
                     <h6><a href="plantProductDetail.do">Happy Ninja Shirt</a></h6>
                     <p class="pro-price"><del>$25.00</del> $19.00</p>
                  </div>
               </div>
            </div>
            <!--Pro Box End-->
            <!--Pro Box Start-->
            <div class="col-lg-3 col-sm-6">
               <div class="product-box">
                  <div class="pro-thumb"> <a href="#">Add To Cart</a> <img src="resources/images/shop/pro2.jpg" alt=""></div>
                  <div class="pro-txt">
                     <h6><a href="#">Woo corlor shirt</a></h6>
                     <p class="pro-price"><del>$25.00</del> $19.00</p>
                  </div>
               </div>
            </div>
            <!--Pro Box End-->
            <div class="col-md-12">
               <a href="plantProductAdd.do" class="view-more" style="color: white; cursor: pointer;">작물등록버튼</a>
            </div>
         </div>

         <div class="row">
            <div class="col-md-12">
               <div class="gt-pagination">
                  <nav>
                     <ul class="pagination">
                        <li class="page-item"> <a class="page-link" href="#" aria-label="Previous"> <i
                                 class="fas fa-angle-left"></i> </a> </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active"><a class="page-link" href="#">2</a></li>
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
</body>

</html>