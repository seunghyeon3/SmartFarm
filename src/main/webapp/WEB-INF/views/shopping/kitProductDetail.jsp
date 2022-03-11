<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* input number에서 화살표 없애기 Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
	padding: 0;
}
</style>
</head>

<body>
	<section class="shop wf100 p80">
		<div class="container">
			<div class="row">
				<!-- <div class="col-md-12">
					<a href="plantProductAdd.do" class="view-more"
						style="color: white; cursor: pointer;">삭제</a> <a
						href="plantProductUpdate.do" class="view-more"
						style="color: white; cursor: pointer; margin-right: 5px">수정</a>
				</div> -->
				<div class="col-md-6">
					<div class="section-title-2">
						<h5>키트 판매</h5>
						<h2>${kitSelectOne.kit_name }</h2>
						<img alt="이미지 들어가야함" src="resources/images/aboutimg.jpg"
							style="width: 300px">
					</div>
				</div>
				<div class="col-md-6">
					<div class="contact-form mb60">
						<ul class="cform">
							<li class="full">
								<h3>${kitSelectOne.kit_name}</h3>
								<hr>
							</li>
							<li class="full">
								<h5>수량</h5>
								<div class="col-md-12">
									<div class="col-md-2"
										style="float: left; margin-right: 1px; margin-left: 0">
										<a onclick="changeNum(this)" id="minus" class="view-more"
											style="color: white; cursor: pointer; margin-top: 0px; padding-top: 5px; padding-bottom: 5px;">-</a>
									</div>
									<div class="col-md-2"
										style="float: left; margin: 0; padding-left: 0px; padding-right: 0px;">
										<input type="number" id="cartCount" min="1" value="1"
											class="form-control" readonly>
									</div>
									<div class="col-md-2" style="float: left; margin-left: 0px;">
										<a onclick="changeNum(this)" id="plus" class="view-more"
											style="color: white; cursor: pointer; margin-top: 0px; padding-top: 5px; padding-bottom: 5px;">+</a>
									</div>
								</div>
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
				<div class="col-md-12">내용이 들어 가유 ~~~</div>
				<div class="col-md-12">내용 후기가 들어가유~~~</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">

	//페이지 로드되면 가격에 콤마 넣기
	$(document).ready(function () {
		$("#price").empty();
		$("#price").append($("<h5>").text( "가격 : "+ (parseInt(${kitSelectOne.kit_price } * 1)).toLocaleString('ko-KR') ),
				$("<br>"), $("<hr>") );
	})
	
	//======버튼 누르면 내역 바뀜======
	function changeNum(e) {
		var cartCount = parseInt($("#cartCount").val());
		
		var num = 0;
		
		if(e.id === "minus" && cartCount > 1){
			num = -1;
		}else if(e.id==="plus") {
			num = 1;
		}
		
		$("#cartCount").val(cartCount + num);
		
		$("#price").empty();
		$("#price").append($("<h5>").text( "가격 : "+ (parseInt(${kitSelectOne.kit_price }*(cartCount + num))).toLocaleString('ko-KR') ),
				$("<br>"), $("<hr>") );
		console.log( "가격 : "+ (parseInt(${kitSelectOne.kit_price }*(cartCount + num))) );
	}
	
	function insertCart() {
		var link = "cartInsert.do?cart_kit_no="+${kitSelectOne.kit_no }+"&cart_price="+${kitSelectOne.kit_price}+"&cart_sale_count=";
		var cartSaleCount = $("#cartCount").val();
		console.log(link + cartSaleCount);	
		location.href = link + cartSaleCount;
		toastr.success("상품이 장바구니에 담겼습니다.");
		
	}
		</script>
</body>

</html>