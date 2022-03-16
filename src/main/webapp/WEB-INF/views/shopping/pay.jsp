<!doctype html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../resources/images/favicon.png">
<title>ECO HTML</title>


<style type="text/css">
/* 테이블 css */
table {
	width: 100%;
	border-top: 1px solid #aaaaaa;
	border-collapse: collapse;
	background-color: white;
}

th {
	width: 150px;
	text-align: center;
	background-color: #f4f4f4;
}

th, td {
	border-bottom: 1px solid #aaaaaa;
	border-left: 1px solid #aaaaaa;
	padding: 10px;
}

th:first-child, td:first-child {
	border-left: none;
}

/* input 테두리 지우기 */
input {
	/* border: none; */
	border-right: 0px;
	border-top: 0px;
	border-left: 0px;
	/* border-bottom:1px; */
	border-width: thin;
	border-color: #555555;
}

#findAddBtn {
	padding: 3px 20px;
	background-color: #66bb6a;
	color: #f8f9fa;
	border: 1px solid #66bb6a;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 20px;
}
</style>
</head>

<body>


	<div class="wrapper">

		<!--Causes Start-->
		<section class="wf100 p80 blog">



			<div class="projects-grid"></div>
			<div class="container">
				<h1>결제</h1>
				<br> <br>
				<div class="row">
					<div class="col-md-12 col-sm-6"
						style="padding: 20px; margin-bottom: 20px;">
						<h3>배송정보</h3>
						<br>

						<table style="width: 60%;">
							<tr>
								<th>이름</th>
								<td><input type="text" id="pur_his_recv"
									value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name}"></td>
							</tr>
							<tr>
								<th>핸드폰</th>
								<td><input type="text" id="pur_his_tel1"
									style="width: 80px;"
									value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_tel.substring(0,3)}">
									<span style="font-size: small">&nbsp;&nbsp;-&nbsp;&nbsp;</span>
									<input type="text" id="pur_his_tel2"
									value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_tel.substring(4,8)}"
									style="width: 80px;"> <span style="font-size: small">&nbsp;&nbsp;-&nbsp;&nbsp;</span>
									<input type="text" id="pur_his_tel3"
									value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_tel.substring(9)}"
									style="width: 80px;"> <input type="hidden"
									id="pur_his_tel"></td>

							</tr>
							<tr>
								<th>우편번호</th>
								<td><input type="text" id="mem_addr1" style="width: 100px;"
									value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_addr.substring(1,6)}">
									<button type="button" id="findAddBtn" onclick="findAddr()">우편번호
										찾기</button></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" id="mem_addr2" style="width: 90%;"
									value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_addr.substring(8)}"></td>

							</tr>
							<tr>
								<th>상세주소</th>
								<td><input type="hidden" id="mem_addr3"><input
									type="hidden" id="mem_addr"
									value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_addr}"><input
									type="text" id="mem_det_addr"
									value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_det_addr}"
									style="width: 90%;"></td>
							</tr>
						</table>
					</div>

					<!-- toast ui grid -->
					<div class="col-md-12 col-sm-6" style="padding: 20px;">
						<h3>주문상품</h3>
						<br>
						<div id="gridInfo"></div>
					</div>

					<!-- 결제 취소 버튼 -->
					<div class="col-md-8 col-sm-3" id="showSum"></div>
					<div class="col-md-4 col-sm-3">

						<input type="button" id="select" onclick="requestPay()" value="결제"
							name="Add to Cart"
							style="padding: 10px 30px; margin-right: 25px; margin-left: 50px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a; border-radius: 5px; cursor: pointer">
						<input type="button" id="all" onclick="history.back()" value="취소"
							name="Add to Cart"
							style="padding: 10px 30px; background-color: #66bb6a; color: #f8f9fa; border: 1px solid #66bb6a; border-radius: 5px; cursor: pointer">

					</div>
				</div>
			</div>
		</section>
		<!--Causes End-->


	</div>

	<!-- 주소 찾기 api -->
	<div id="layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeFrm()" alt="닫기 버튼">
	</div>

	<!--   TOAST UI GRID js  -->
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

	<!-- 아임포트 결제 -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
		//console.log(localStorage.getItem("payList"));
		var payList = JSON.parse(localStorage.getItem("payList"));
		console.log(payList);
		// ===== toast ui GRID =====
		var grid = new tui.Grid(
				{
					el : document.getElementById('gridInfo'),
					scrollX : false,
					scrollY : false,
					minBodyHeight : 40 * payList.length,
					columns : [ {
						header : '상품정보',
						name : 'cart_detail'
					}, {
						header : '판매가',
						name : 'cart_price'
					}, {
						header : '수량',
						name : 'cart_sale_count'
					}, {
						header : '합계',
						name : 'cart_sum'
					} ],
					summary : {
						height : 40,
						position : 'bottom', // or 'top'
						columnContent : {
							cart_sum : {
								template : function(summary) {
									var sum = getSum().toLocaleString('ko-KR');
									if ($("#showSum") != null) {
										$("#showSum").empty();
									}
									$("#showSum").append(
											$("<h3>").text("총액 : " + sum));
									return '총액 : ' + sum;
								}
							}
						}
					}
				});

		// GRID 에 데이터를 입력하기
		var gridData = payList
		grid.resetData(gridData);
		var bodyHeight = payList.length * 17;
		grid.setBodyHeight(30);

		// 판매가와 총액에 콤마 찍기
		function setMoney() {

			for (var i = 0; i < gridData.length; i++) {
				var price = parseInt(grid.getValue(i, 'cart_price'))
						.toLocaleString('ko-KR');
				grid.setValue(i, 'cart_price', price, true);
				var sum = parseInt(grid.getValue(i, 'cart_sum'))
						.toLocaleString('ko-KR');
				grid.setValue(i, 'cart_sum', sum, true);
			}

		}
		setMoney();

		// ===== 총액 구하기 =====
		function getSum() {
			var sum = 0;
			for (var i = 0; i < payList.length; i++) {
				sum += payList[i].cart_sum;
			}
			return sum;
		}

		// ===== 결제하기 ===== 
		//가맹점 식별코드를 이용하여 IMP 객체를 초기화하기
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp58588362"); // 예: imp00000000

		function requestPay() {

			console.log(payList);

			// 구매품목이 여러개인 경우 "list[0].cart_detail 외 list.length 건"으로 설정
			var pur_name = payList[0].cart_detail; //구매품목 이름
			if (payList.length > 1) {
				pur_name = payList[0].cart_detail + " 외 " + payList.length
						+ "건";
			}

			// 결제 정보
			var pur_his_recv = $("#pur_his_recv").val();//구매자 이름
			var pur_his_tel = $("#pur_his_tel1").val() + '-'
					+ $("#pur_his_tel2").val() + '-' + $("#pur_his_tel3").val();//전화번호
			$("#pur_his_tel").val(pur_his_tel);
			var pur_his_addr = $("#mem_addr").val() + $("#mem_det_addr").val();// 구매자 주소 
			var pur_postcode = $("mem_addr1").val();//우편번호
			var pur_his_price = getSum(); //구매가격 
			console.log("총액" + pur_his_price);
			var uid = "ORD20180131" + new Date().getTime();
			var mem_email = payList[0].mem_email; //이메일

			// IMP.request_pay(param, callback);// 결제창 호출
			IMP.request_pay({ // param
				pg : "inicis",
				pay_method : "card",
				merchant_uid : uid, // uid
				name : pur_name, //구매품목
				amount : 1000, //총액  추후수정 pur_his_price
				buyer_email : mem_email, // 구매자 이메일
				buyer_name : pur_his_recv, // 구매자 이름
				buyer_tel : pur_his_tel, // 구매자 전화번호
				buyer_addr : pur_his_addr, //구매자 주소
				buyer_postcode : pur_postcode
			//우편번호
			//구매자 우편번호
			}, function(rsp) { // callback

				if (rsp.success) { // 결제 성공 시 로직

					console.log(rsp)
					console.log(rsp.success)
					//결제 후 pur_his에 insert하기
					insertPurHis(rsp);

				} else { // 결제 실패 시 로직

					console.log(rsp);
					toastr.error('결제에 실패했습니다. 다시 시도해주세요');

				}
			});
		}

		//삭제버튼에서 정보 받아와서 바꾸기!

		//===== 결제 완료 후 결제 내역을 cart에서 삭제하고 pur_his에 insert 하기 =====
		function insertPurHis(purHis) {

			payList.push(purHis);//결제 완료 후 결제 정보 받아서 payList에 넣기

			$.ajax({
				method : 'post',
				url : "insertPurHis.do",
				traditional : true,
				data : JSON.stringify(payList),
				contentType : "application/json; charset=utf-8",
				dataType : 'json',
				success : function(res) {
					alert('결제가 완료되었습니다.')
					location.href = "home.do";

				}
			});
		}

		//=====주소 api=====
		var element_layer = document.getElementById('layer');

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = 'none';
		}

		function findAddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
									//console.log("1"+extraAddr);
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
									//console.log("2"+extraAddr);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';

								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("mem_addr3").value = extraAddr;
								//console.log("3"+extraAddr);

							} else {
								document.getElementById("mem_addr3").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('mem_addr1').value = data.zonecode;//우편번호
							document.getElementById("mem_addr2").value = addr;//주소
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("mem_det_addr").focus();

							//전체 주소 합쳐서 mem_addr에 넣기
							var resultAddr = '[' + data.zonecode + ']' + ' '
									+ addr + extraAddr;
							//console.log(resultAddr);

							document.getElementById('mem_addr').value = resultAddr;

						}
					}).open();
		}
	</script>
</body>

</html>