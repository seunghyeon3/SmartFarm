<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>

<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />

</head>

<body>


	<section class="shop wf100 p80">
		<div class="container">
			<div class="row" id="prolist">


				<div class="col-md-12">
					<div class="col-lg-9 col-md-8 side-widget"></div>


					<!-- 검색 버튼 추가 -->
					<div class="col-lg-3 col-md-4 side-search"
						style="margin-bottom: 70px;">
						<input type="search" class="form-control"
							placeholder="작물 이름을 입력해주세요" id="plantSaleTitle">
						<button onclick="searchFnc()">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
				<br> <br>

				<!-- 판매 리스트 출력 시작 -->
				<div class="col-md-12" id="psListP">
					
				</div>
				<%-- <c:forEach items="${plantSaleList}" var="list">
					<div class="col-lg-3 col-sm-6">
						<div class="product-box">
							<div class="pro-thumb">
								<a
									onclick="insertCart('cartInsert.do?cart_plant_no=${list.plant_sale_no }&cart_price=${list.plant_sale_price}&cart_sale_count=1')"
									href="javascript:void(0);">장바구니 추가</a> <img
									src="resources/images/shop/pro1.jpg" alt="">
								<!-- 추후수정(이미지 링크) -->
							</div>
							<div class="pro-txt">
								<h6>
									<a
										href="plantProductDetail.do?plant_sale_no=${list.plant_sale_no }">${list.plant_sale_title}</a>
								</h6>
								<p class="pro-price" id="plantSalePrice">${list.plant_sale_price }</p>
							</div>
						</div>
					</div>
				</c:forEach> --%>
				<!-- 판매 리스트 출력 끝 -->

				<sec:authorize access="hasRole('FARMER')">

					<div class="col-md-12">
						<a href="plantProductAdd.do" class="view-more"
							style="color: white; cursor: pointer;">작물등록버튼</a>
					</div>
				</sec:authorize>
			</div>

			
			<!-- 페이징 -->
		</div>
		<!--페이징처리 시작-->
		<div class="row" style="display: flex; justify-content: center;">
			<div id="pagination" style="margin: 0 auto;"></div>
		</div>
		<!--페이징처리 종료-->
	</section>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<script src='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/js/jquery.circliful.min.js'></script>

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
      
      //로딩될 때 실행되는 함수
      $(function () {
    	  //페이징
    	  let container = $('#pagination');
	        container.pagination({
	            dataSource: ${plantSaleListP},
	            callback: function (data, pagination) {
				var psList ="";
				var temp = "";
	                $.each(data, function (index, list) {
	                	temp = `<div class="col-lg-3 col-sm-6" style="float:left;">
						<div class="product-box">
							<div class="pro-thumb">
								<a
									onclick="insertCart('cartInsert.do?cart_plant_no=\${list.plant_sale_no }&cart_price=\${list.plant_sale_price}&cart_sale_count=1')"
									href="javascript:void(0);">장바구니 추가</a> <img
									src="resources/images/shop/pro1.jpg" alt="">
							</div>
							<div class="pro-txt">
								<h6>
									<a
										href="plantProductDetail.do?plant_sale_no=\${list.plant_sale_no }">\${list.plant_sale_title}</a>
								</h6>
								<p class="pro-price" id="plantSalePrice">\${list.plant_sale_price }</p>
							</div>
						</div>
					</div>`;
	            	    psList += temp
	                });
	                
	                $("#psListP").html(psList);
	            },
	            pageSize: 12
	        })
	})
      
      
      //로딩되면 금액에 콤마넣기
      $(document).ready(function () {
    	  var price = document.querySelectorAll('#plantSalePrice');
 		 for(var i=0;i<price.length;i++) {
 			 
 			 price[i].innerText = (parseInt(price[i].innerText) * 1).toLocaleString('ko-KR');
 			
 		 }
	})
      
     // 검색 창에 자동완성 기능
      fetch("plantSaleTit.do")
         .then(result =>
            result.json()
         )
         .then(result =>
            showAuto(result)
         );
   	
     // 자동완성 기능 함수
      function showAuto(lists) {
         var arr = [];
         for (index in lists) {
            console.log(lists[index].plant_sale_title);
            arr.push(lists[index].plant_sale_title);
         }
         $("#plantSaleTitle").autocomplete({
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
        
    	 if('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}' ==''){
  			alert('로그인 후 사용해 주세요');
  			
  		} else {
	         location.href = link;
	         toastr.success("상품이 장바구니에 담겼습니다.");
  		}
      }
      
      //검색 함수
      function searchFnc() {
    	 var plantSaleTitle = document.getElementById('plantSaleTitle').value;
    	 var url = "plantSaleSearch.do?plantSaleTitle="+plantSaleTitle;
    	 location.href=url;
		/* $.ajax({
			url :url,
			method: 'get',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function (res) {
				console.log(res)
			}
		}) */
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