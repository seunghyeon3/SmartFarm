<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
.orderByBtn {
	padding: 10px;
	position: relative;
	top: 25%;
	color: #666666;
	margin-left: 13px;
}

.aTag:hover {
	color: #66bb6a;
}
</style>
</head>

<body>


	<section class="shop wf100 p80">
		<div class="container">
			<div class="row" id="prolist">
				<div class="col-lg-12">
					<div class="col-lg-9 col-md-8 side-widget">

						<!-- 상업용, 취미용 구분 할 수 있는 태그.. 매개변수에 따라 상품리스트 바뀔 예정, 매개변수 정하면 끝> -->
						<div class="single-post-tags">
							<a href="kitShopList.do?kitPrpos=">전체</a> <a
								href="kitShopList.do?kitPrpos=business">상업용</a> <a
								href="kitShopList.do?kitPrpos=hobby">취미용</a>
						</div>
					</div>


					<!-- 검색 버튼 추가 -->
					<div class="col-lg-3 col-md-4 side-search">
						<input type="search" class="form-control"
							placeholder="키트 이름을 입력하세요" id="kitName">
						<button onclick="searchKit()">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
				<!-- <div class="col-lg-8 col-md-8 "></div>
				<div class="col-lg-4 col-md-8 ">

					<!-- 상업용, 취미용 구분 할 수 있는 태그.. 매개변수에 따라 상품리스트 바뀔 예정, 매개변수 정하면 끝>
					<div class="single-post-tags">
						<a href="kitShopList.do?orderBy=name">이름순</a> <a
							href="kitShopList.do?orderBy=hit">조회수</a> <a
							href="kitShopList.do?orderBy=saleCount">판매순</a>
					</div> 
				</div> -->

				<div class="col-lg-12"
					style="height: 50px; background-color: #f7f7f7; margin: 10px; border-bottom: solid #666666;">
					<!-- -->
					<a href="kitShopList.do?orderBy=name" class="orderByBtn aTag">
						<span>이름순</span>
					</a> <span class="orderByBtn">|</span> <a
						href="kitShopList.do?orderBy=hit" class="orderByBtn aTag">조회수</a>
					<span class="orderByBtn">|</span> <a
						href="kitShopList.do?orderBy=saleCount" class="orderByBtn aTag">판매순</a>
				</div>

				<!-- 판매 리스트 출력 시작 -->
				<c:forEach items="${kitSelectList}" var="list">
					<div class="col-lg-3 col-sm-6">
						<div class="product-box">


							<div class="pro-thumb">
								<a
									onclick="insertCart('cartInsert.do?cart_kit_no=${list.kit_no }&cart_price=${list.kit_price}&cart_sale_count=1')"
									href="javascript:void(0);">장바구니 추가</a> <img
									src="resources/images/shop/pro1.jpg" alt="">
							</div>
							<div class="pro-txt">
								<p style="margin: 0;">(${list.kit_prpos})</p>
								<h6>
									<a href="kitProductDetail.do?kit_no=${list.kit_no }">
										${list.kit_name}</a>
								</h6>
								<p class="pro-price">${list.kit_price }</p>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>

			<div class="row">
				<div class="col-md-12">
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
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
      /* //작물 판매 화면 올 때 전체 리스트 출력 하는 부분
      $.ajax({
         url: '',
         method: 'get',
         success: function (result) {
            showList(result);
         },
         error: function () {
            console.log(err);
         }
      }) */

      // 검색 창에 자동완성 기능
      fetch(
            "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101"
         )
         .then(result =>
            result.json()
         )
         .then(result =>
            showAuto(result)
         );

      // 자동완성 기능 함수
      function showAuto(lists) {
         var arr = [];
         for (index in lists.boxOfficeResult.dailyBoxOfficeList) {
            console.log(lists.boxOfficeResult.dailyBoxOfficeList[index].movieNm);
            arr.push(lists.boxOfficeResult.dailyBoxOfficeList[index].movieNm);
         }
         $("#autoCompt").autocomplete({
            source: arr,
            select: function (event, ui) {
               console.log(ui.item);
            },
            focus: function (event, ui) {
               return false;
            }
         });
      };

      //상업, 취미용 리스트 출력 함수
      function divisionList(id) {
         $.ajax({
            url: "getPlantList",
            data: {
               // event 에 따른 id 생성
            }
         }).done(function (result) {
            $('#prolist').empty();
            showList(result);
         });
      }

      // ===== 장바구니 추가 =====
      function insertCart(link) {
         //console.log(e);
         //toastr.success("상품이 장바구니에 담겼습니다.");
    	 if('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}' ==''){
  			alert('로그인 후 사용해 주세요');
  		} else {
	         location.href = link;
	         toastr.success("상품이 장바구니에 담겼습니다.");
  		}
      }
      
      //===== 키트 검색 =====
	  function searchKit() {
	    	var kitName = document.getElementById("kitName").value;
	    	var url = "kitShopList.do?kitName="+kitName;
			location.href=url;
	    	
		}

      /* //판매 리스트 출력하는 함수
      function showList(lists){
         var prolist = $('#prolist');
            var firstDiv = $('<div>').addClass('col-lg-3', 'col-sm-6');
            var secondDiv = $('<div>').addClass('product-box');
            var thirdDiv = $('<div>').addClass('pro-thumb');
            var fourDiv = $('<div>').addClass('pro-txt');
            thirdDiv.append(
               $('<a>').attr('href', '카트경로'),
               $('<img>').attr({
                  src: '경로',
                  alt: '파일 없슴'
               })
            )
            fourDiv.append(
               $('<h6>').append(
                  $('<a>').attr('href', 'plantProductDetail.do?id=' + $ {
                     데이터
                  }),
                  $('<p>').addClass('pro-price').html($ {
                     데이터
                  })
               )
            )
      } */
   </script>

</body>

</html>