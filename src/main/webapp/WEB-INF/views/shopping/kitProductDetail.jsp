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
						<h2>${kitSelectOne.kit_name }</h2>
						<img alt="이미지 들어가야함" src="resources/images/aboutimg.jpg"
							style="width: 300px">
						<!-- 추후수정 -->
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
							<!-- 장바구니 넣기 -->
							<sec:authorize access="permitAll">
								<sec:authentication property="principal" var="member" />
								<li class="full"><a onclick="purchase()" class="view-more"
									style="color: white; cursor: pointer;">구매</a> <a
									onclick="insertCart()" class="view-more"
									style="color: white; cursor: pointer; margin-right: 5px">장바구니</a>
								</li>
							</sec:authorize>
						</ul>
					</div>
				</div>
				<div class="col-md-12">
					<img alt="" src=" resources/kit/${kitSelectOne.kit_exp_img}">
					<!-- 추후수정 -->
				</div>

				<!-- 리뷰 출력 -->
				<div class="col-md-12" >
					
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
		</div>
	</section>
	<script type="text/javascript">

	
	$(document).ready(function () {
		
		//페이지 로드되면 가격에 콤마 넣기
		$("#price").empty();
		$("#price").append($("<h5>").text( "가격 : "+ (parseInt(${kitSelectOne.kit_price } * 1)).toLocaleString('ko-KR') ),
				$("<br>"), $("<hr>") );
		
		//이용후기 가져오기
		var kitNo = $.urlParam('kit_no');
		var url = "kitSelectRevwList.do?kitNo=" + kitNo;
		$.ajax({
			url: url,
			method:'get',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function (res) {
				console.log(res);
				showRevw(res);
			}
			
		})
	});
	// ===== url 자르는 함수 ===== 
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		 	return results [1] || 0;
	}
	
	// ===== 이용후기 뿌리기 =====
	function showRevw(list) {
		console.log(list);
		var kitRevw = $('#useRevw');
		/* var hr = document.createElement('hr');
		var br = document.createElement('br');
		
		kitRevw.append(hr, br); */
		var tmp = "";
		for(index in list){
			tmp += `<li><img src="/resources/images/flp2.jpg" alt=""> 
				<strong><a href="useRevwDetail.do?useRevwNo=\${list[index].use_revw_no}" style="font-size: large;">\${list[index].use_revw_title}</a>`;
				
				
			if ('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}' == `\${list[index].mem_email}`) {
				
				tmp += `<a href="useRevwCommDelete.do?useRevwCommNo=\${list[index].use_revw_no}" style="float: right; color: #e11f3e">삭제</a>`;
			}
			
			var date = new Date(1 * `\${list[index].use_revw_write_day}`);
			tmp += `</strong>  <p>\${list[index].use_revw_con}</p>
				<spanclass="pdate"><i class="fas fa-calendar-alt"></i>`+date.toLocaleString()+`</span><hr></li>`;
			
			
		}
		$('#useRevw').append(tmp);
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
			localStorage.setItem("payList", JSON.stringify(payList));
			location.href = "pay.do";
		}
		
	}
	
	
		</script>
</body>

</html>