<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />

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

				<div class="col-md-6">
					<div class="section-title-2">
						<h5>키트 판매</h5>
						<h2>(${kitSelectOne.kit_prpos })&nbsp;${kitSelectOne.kit_name }</h2>
						<img style="width:550px; height:380px;"
										src="../upload/${kitSelectOne.kit_main_img}" alt="">
						<!-- 추후수정 -->
					</div>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-5" style="margin-top: 50px;">
					<div class="contact-form mb60">
						<ul class="cform"  style="">
							<li class="full">
								<h3>${kitSelectOne.kit_name }</h3>
								<hr>
							</li>
							<li class="full">
								
								<h5 style="margin-bottom: 10px;">수량</h5>
								<div class="col-md-12">
									<div class="col-md-2"
										style="float: left; margin-right: 1px; ">
										<a onclick="changeNum(this)" id="minus" class="view-more"
											style="color: white; cursor: pointer; margin-top: 0px; padding-top: 5px; padding-bottom: 5px; ">-</a>
									</div>
									<div class="col-md-2"
										style="float: left; margin: 0; padding-left: 0px; padding-right: 0px;">
										<input type="number" id="cartCount" min="1" value="1"
											class="form-control" readonly>
									</div>
									<div class="col-md-2" style="float: left; margin-left: 8px;">
										<a onclick="changeNum(this)" id="plus" class="view-more"
											style="color: white; cursor: pointer; margin-top: 0px; padding-top: 5px; padding-bottom: 5px;">+</a>
									</div>
								</div>
							</li>
							<li><h5>용도&nbsp;:&nbsp;${kitSelectOne.kit_prpos }</h5></li> 
							<li class="full" id="price"></li>
							<!-- 장바구니 넣기 -->
							<li class="full" style="text-align: center;"><a onclick="insertCart()" class="view-more" 
								style="cursor: pointer; margin-top: 0px;width: 120px; float:left; margin-left: 100px; margin-right: 20px;color: #66bb6a; background-color: #fff; border: 1px solid #66bb6a;">장바구니</a> <a
								onclick="purchase()" class="view-more"
								style="color: white; cursor: pointer; margin-right: 5px; width: 120px; float:left; margin-top: 0px;">구매</a>
							</li>
								
							
						</ul>
					</div>
				</div>
				<div class="col-md-12">
					<img style="width:100%; border:2px solid black;"
							src="../upload/${kitSelectOne.kit_exp_img}">
				</div>

				<!-- 리뷰 출력 -->
				<div class="col-md-12" style="margin-top:80px">
					
					<div class="sidebar">
						<!--이용후기-->
						<div class="side-widget">
							<h5>이용후기</h5>
							<hr>
							<ul class="lastest-products" id="useRevw" > 
								<!-- <li><img src="/resources/images/flp2.jpg" alt=""> 
								<strong><a href="" style="font-size: large;">Eliminate your plastic bottle pollution</a></strong>
										
										<p>내용자리 ex 딸기가 마싱ㅆ습니다 ㅁ잩추니다ㅑ <br>dkcnfklewl <br> dlcksfdlkjerwjl <br> </p>
										 <span
									class="pdate"><i class="fas fa-calendar-alt"></i> 2022-03-18</span><hr></li>
									
								<li><img src="resources/images/flp3.jpg" alt=""> <strong><a
										href="">How you can keep alive wild animals for...</a></strong> <span
									class="pdate"><i class="fas fa-calendar-alt"></i>2022-03-18</span><hr></li> -->
							</ul>
						</div>
						<!--Widget Start-->
					</div>
					

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

	
	$(document).ready(function () {
		
		//페이지 로드되면 가격에 콤마 넣기
		$("#price").empty();
		$("#price").append($("<h5>").text( "가격 : "+ (parseInt(${kitSelectOne.kit_price } * 1)).toLocaleString('ko-KR') ),
				$("<br>"), $("<hr>") );
		
		//이용후기 가져오기
		var kitNo = '${param.kit_no}';
		var url = "kitSelectRevwList.do?kitNo=" + kitNo;
		$.ajax({
			url: url,
			method:'get',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function (res) {
				console.log(res);
				//showRevw(res);
				paginationRevw(res);
			}
			
		})
	});
	// ===== url 자르는 함수 ===== 
	/* $.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		 	return results [1] || 0;
	} */
	
	// ===== 이용후기 뿌리기 =====
	function showRevw(list) {
		console.log(list);
		var kitRevw = $('#useRevw');
		
		var tmp = "";
		for(index in list){
			tmp += `<li><img src="../upload/${list[index].use_revw_phy_rou}" alt=""> 
				<strong><a href="useRevwDetail.do?useRevwNo=\${list[index].use_revw_no}" style="font-size: large;">\${list[index].use_revw_title}</a>`;
				
			var date = new Date(1 * `\${list[index].use_revw_write_day}`);
			tmp += `</strong>  <p>\${list[index].use_revw_con}</p>
				<spanclass="pdate"><i class="fas fa-calendar-alt"></i>`+date.toLocaleString()+`</span><hr></li>`;
			
		}
		
		$('#useRevw').append(tmp);
		
	}
	
	
	// ===== 페이징 처리하기 =====
	function paginationRevw(list) {
		console.log("================");
		console.log(list);
	
		if (list.length > 0){ // 리스트가 있는 경우
	    	
	    	let container = $('#pagination');
		        container.pagination({
		            dataSource: list,
		            callback: function (data, pagination) {
		            	var revw ="";
						var tmp = "";
		            	
		                $.each(data, function (index, item) {
		                	
		                	tmp += `<li><img src="../upload/${list[index].use_revw_phy_rou}" alt=""> 
		        				<strong><a href="useRevwDetail.do?useRevwNo=\${list[index].use_revw_no}" style="font-size: large;">\${list[index].use_revw_title}</a>`;
		        				
		        			var date = new Date(1 * `\${list[index].use_revw_write_day}`);
		        			tmp += `</strong>  <p>\${list[index].use_revw_con}</p>
		        				<spanclass="pdate"><i class="fas fa-calendar-alt"></i>`+date.toLocaleString()+`</span><hr></li>`;
		        			revw += tmp;
							
		                });
		                
		                $('#useRevw').html(revw);
		            },
		            pageSize: 3
		        });
		        
	    	} else {// 리스트가 없는 경우
	    		var temp = `<div class="col-lg-12 col-sm-12" style="float:left;"> <h5> 아직 작성된 이용후기가 없습니다 </h5> </div>`
	    		$("#useRevw").html(temp);
	    	}
	
	}
	
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
	
	// ===== 장바구니 넣기 ===== 
	function insertCart() {
		
		
		if('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}' == ''){
			alert('로그인 후 사용해 주세요');
			location.href = "login.do";
		}else{
			var link = "cartInsert.do?cart_kit_no="+${kitSelectOne.kit_no }+"&cart_price="+${kitSelectOne.kit_price}+"&cart_sale_count=";
			var cartSaleCount = $("#cartCount").val();
			console.log(link + cartSaleCount);	
			location.href = link + cartSaleCount;
			
			alert('상품이 장바구니에 담겼습니다.')
		}
		
	}
	
	// ===== 키트 바로 구매하기 =====
	function purchase() {
		// 로그인 안한 경우 alert 띄우고 login 페이지로 이동
		if('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}' == ''){
			alert('로그인 후 사용해 주세요');
			location.href = "login.do";
			
		}else{//로그인 한 경우 cartCount, mem_email 가져와서 pay.do로 넘기기
			var payList = ${payList};
			console.log(payList);
			payList[0].mem_email = '${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}';
			payList[0].cart_sale_count = document.getElementById('cartCount').value;
			payList[0].cart_sum = (payList[0].cart_sale_count) * (payList[0].cart_price);
			localStorage.setItem("payList", JSON.stringify(payList));
			location.href = "pay.do";
		}
		
	}
	
	
		</script>
</body>

</html>