<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />

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
							<a href="kitShopList.do?kitPrpos=&orderBy=name" id="all">전체</a> <a
								href="kitShopList.do?kitPrpos=business&orderBy=name"
								id="business">상업용</a> <a
								href="kitShopList.do?kitPrpos=hobby&orderBy=name" id="hobby">취미용</a>
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
					<a href="" id="name" class="orderByBtn aTag"> <span
						id="nameTag">이름순</span>
					</a> <span class="orderByBtn">|</span> <a href="" id="hit"
						class="orderByBtn aTag"> <span id="hitTag">조회순</span>
					</a> <span class="orderByBtn">|</span> <a href="" id="saleCount"
						class="orderByBtn aTag"> <span id="saleCountTag">판매순 </span></a>
				</div>

				<!-- 판매 리스트 출력 시작 -->
				<%-- <c:forEach items="${kitSelectList}" var="list">
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
								<p class="pro-price" id="kitPrice">${list.kit_price}</p>
							</div>
						</div>
					</div>
				</c:forEach> --%>
				<!-- 판매 리스트 출력 시작 -->
				<div class="col-md-12" id="kitShopListP">
				
				</div>
			</div>

			

			<!--페이징처리 시작-->
			<div class="row" style="display: flex; justify-content: center;">
				<div id="pagination" style="margin: 0 auto;"></div>
			</div>
			<!--페이징처리 종료-->
		</div>

	</section>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>

	<script type="text/javascript">
	//페이징
    $(function () {
    	console.log(${kitSelectListP});
    	
    	var kitSelectListP = ${kitSelectListP};
    	if (kitSelectListP.length > 0){ // 리스트가 있는 경우
    	
    	let container = $('#pagination');
	        container.pagination({
	            dataSource: ${kitSelectListP},
	            callback: function (data, pagination) {
	            	var kitList ="";
					var temp = "";
	            	
	                $.each(data, function (index, item) {
	                	
	                	 //모든 돈에 콤마 넣기
		           		 var tmp = `\${item.kit_price}`
		           		 
		           		 var price = (parseInt(tmp) * 1).toLocaleString('ko-KR');
		           			
		           		 
	                	
	                	temp = `<div class="col-lg-3 col-sm-6" style="float:left;">
							<div class="product-box">
								<div class="pro-thumb">
									<a onclick="insertCart('cartInsert.do?cart_kit_no=\${item.kit_no }&cart_price=\${item.kit_price}&cart_sale_count=1')"
										href="javascript:void(0);">장바구니 추가</a> <img style="width:300px; height:180px;"
										src="../upload/\${item.kit_main_img}" alt="">
								</div>
								<div class="pro-txt">
									<p style="margin: 0;">(\${item.kit_prpos})</p>
									<h6>
									<a href="kitProductDetail.do?kit_no=\${item.kit_no }">
										\${item.kit_name}</a>
									</h6>
									<p class="pro-price" id="kitPrice">` + price + `</p>
									<div style="height: 10px; margin: 10px 0 10px 0;">
										<span style="float:left; font-size:small;">조회수 : \${item.kit_hit}</span>
										<span style="float:left; font-size:small; padding: 0 10px 0 10px;">|</span>
										<span style="float:left; font-size:small;">판매수 : \${item.kit_sale_count}</span>
									</div>
									
								</div>
							</div>
						</div>`;
						kitList += temp;
	                });
	                
	                $("#kitShopListP").html(kitList);
	            },
	            pageSize: 12
	        });
	        
    	} else {// 리스트가 없는 경우
    		toastr.error('검색 결과가 없습니다');
    		var temp = `<div class="col-lg-3 col-sm-6" style="float:left;"> <h5> 검색 결과가 없습니다 </h5> </div>`
    		$("#kitShopListP").html(temp);
    	}
	      
	
		//페이지가 시작될 때 url 에 정보가 담겨있으면 색 바꾸기
   
    	var kitPrpos = '${param.kitPrpos}';
    	 
 		if(kitPrpos == ''){//전체
    		 
    		 //css 색 바꾸기
    		 document.getElementById('all').style.backgroundColor='#66bb6a';
    		 document.getElementById('all').style.color='#f8f9fa';
    	 	 
    		 kitPrpos='';
    		 
    	 } else if(kitPrpos=='hobby'){//취미용
    		 document.getElementById('hobby').style.backgroundColor='#66bb6a';
    		 document.getElementById('hobby').style.color='#f8f9fa';
    		 
    	 } else if(kitPrpos == 'business'){//상업용
    		 document.getElementById('business').style.backgroundColor='#66bb6a';
    		 document.getElementById('business').style.color='#f8f9fa';
    	 }
    	 
    	 //키트 정렬별 색 바꾸기
    	 var orderBy = '${param.orderBy}';
    	 
    	 if(orderBy == 'name'){
    		 document.getElementById('nameTag').style.color='#66bb6a';
    		 
    	 }else if(orderBy =='saleCount'){
    		 document.getElementById('saleCountTag').style.color='#66bb6a';
    	 }else if(orderBy == 'hit'){
    		 document.getElementById('hitTag').style.color='#66bb6a';
    	 }
    	 
    	 
    	 document.getElementById('saleCount').href = "kitShopList.do?kitPrpos="+kitPrpos+"&orderBy=saleCount";
		 document.getElementById('hit').href =  "kitShopList.do?kitPrpos="+kitPrpos+"&orderBy=hit";
		 document.getElementById('name').href =  "kitShopList.do?kitPrpos="+kitPrpos+"&orderBy=name";
	
		 /* //모든 돈에 콤마 넣기
		 var price = document.querySelectorAll('#kitPrice');
		 for(var i=0;i<price.length;i++) {
			 
			 price[i].innerText = (parseInt(price[i].innerText) * 1).toLocaleString('ko-KR');
			
		 } */
		 
    }); // $(function (){})
	
 	// 검색 창에 자동완성 기능
    fetch("kitSelectName.do")
       .then(result =>
          result.json()
       )
       .then(result =>
          showAuto(result)
       );
	// ===== url 자르는 함수 ===== 
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		 	return results [1] || 0;
	}
	
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

      

      // 자동완성 기능 함수
      function showAuto(lists) {
    	 console.log(lists)
         var arr = [];
         for (index in lists) {
            console.log(lists[index].kit_name);
            arr.push(lists[index].kit_name);
         }
         
         $("#kitName").autocomplete({
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
  			location.href = "login.do";
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
                  $('<a>').attr('href', 'plantShopDetail.do?id=' + $ {
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