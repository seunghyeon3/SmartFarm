<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<section class="shop wf100 p80">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="plantProductAdd.do" class="view-more"
						style="color: white; cursor: pointer;">삭제</a> <a
						href="plantProductUpdate.do?plant_sale_no=${plantSaleDet.plant_sale_no }" class="view-more"
						style="color: white; cursor: pointer; margin-right: 5px">수정</a>
				</div>
				<div class="col-md-6">
					<div class="section-title-2">
						<h5>상품 판매</h5>
						<h2>${plantSaleDet.plant_sale_title }</h2>
						<img alt="resources/plant/${plantSaleDet.plant_sale_ori_rou}"
							src="resources/images/aboutimg.jpg" style="width: 300px">
					</div>
				</div>
				<div class="col-md-6">
					<div class="contact-form mb60">
						<ul class="cform">
							<li class="full">
								<h3>${plantSaleDet.plant_sale_title }</h3>
								<hr>
							</li>
							<li class="full">
								<h5>수량 : ${plantSaleDet.plant_count}</h5>
							</li>
							<li class="full" id="price"></li>
							
							<li class="full"><a href="plantProductAdd.do"
								class="view-more" style="color: white; cursor: pointer;">구매</a>
								<a onclick="insertCart()" class="view-more"
								style="color: white; cursor: pointer; margin-right: 5px">장바구니</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-12">${plantSaleDet.plant_sale_con }</div>
				<div class="col-md-12">내용 후기가 들어가유~~~</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
 		//페이지 로드되면 가격에 콤마 넣기
		$(document).ready(function () {
			$("#price").empty();
			$("#price").append($("<h5>").text( "가격 : "+ (parseInt(${plantSaleDet.plant_sale_price } * 1)).toLocaleString('ko-KR') ),
					$("<br>"), $("<hr>") );
		});
 		
 		//장바구니에 입력
		function insertCart() {
			var link = "cartInsert.do?cart_plant_no="+${plantSaleDet.plant_sale_no }+"&cart_price="+${plantSaleDet.plant_sale_price}+"&cart_sale_count=";
			var cartSaleCount = ${plantSaleDet.plant_count}
			console.log(link + cartSaleCount);	
			location.href = link + cartSaleCount;
			toastr.success("상품이 장바구니에 담겼습니다.");
			
		}
   </script>
</body>

</html>