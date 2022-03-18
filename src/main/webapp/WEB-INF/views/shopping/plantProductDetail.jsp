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
				<div class="col-md-12" id="update" style="display: none;">
					<a onclick="deletePlant(${plantSaleDet.plant_sale_no })" class="view-more"
						style="color: white; cursor: pointer;background-color:#e11f3e;color:#ffffff;  width:100px; text-align:center;">삭제</a> <a
						href="plantProductUpdate.do?plant_sale_no=${plantSaleDet.plant_sale_no }" class="view-more"
						style="color: white; cursor: pointer; margin-right: 5px;  width:100px; text-align:center;">수정</a>
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
							
							<li class="full"><a
								class="view-more" onclick="purchase()" style="color: white; cursor: pointer; width:100px; text-align:center;">구매</a>
								<a onclick="insertCart()" class="view-more"
								style="color: white; cursor: pointer; margin-right: 5px; border: 1px solid #66bb6a; width:100px;  background-color: #f8f9fa; color: #66bb6a;">장바구니</a>
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
			
			//세션과 작물을 판매하는 아이디가 같은 경우 수정,삭제 버튼을 보여줌
			if('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}' == '${plantSaleDet.mem_email}'){
				document.getElementById('update').style.display="block";
			}
		});
 		
 		//장바구니에 입력
		function insertCart() {
			if('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}'  ==''){
				alert('로그인 후 사용해 주세요');
				location.href = "login.do";
			}else{
				var link = "cartInsert.do?cart_plant_no="+${plantSaleDet.plant_sale_no }+"&cart_price="+${plantSaleDet.plant_sale_price}+"&cart_sale_count=";
				var cartSaleCount = ${plantSaleDet.plant_count}
				console.log(link + cartSaleCount);	
				location.href = link + cartSaleCount;
				alert('상품이 장바구니에 담겼습니다.');
			}
			
		}
 		
 		// ===== 작물 바로 구매하기 =====
 		function purchase() {
 			if('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}' == ''){
 				alert('로그인 후 사용해 주세요');
 				location.href = "login.do";
 				
 			}else{
	 			var payList = ${payList};
	 			payList[0].mem_email = '${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}';
	 			localStorage.setItem("payList", JSON.stringify(payList));
	 			location.href = "pay.do";
 			}
		}
 		
 		
 		// ===== 작물판매 삭제하기 ===== 
 		function deletePlant(plantSaleNo) {
			if(confirm('삭제할 경우 데이터를 복구할 수 없습니다. 정말로 삭제하시겠습니까?')){
				var url = "plantSaleDelete.do?plantSaleNo="+plantSaleNo;
				$.ajax({
					url:url,
					method:'get',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function (res) {
						if (res == 1) {
							alert('삭제되었습니다.');
						} else {
							alert('오류가 발생했습니다. 다시 시도해주세요.');
						}
						
						location.href = "plantShopList.do";
					}
				})
				
			}
		}
   </script>
</body>

</html>