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
				<div class="col-md-12">
					<a href="plantProductAdd.do" class="view-more"
						style="color: white; cursor: pointer;">삭제</a> <a
						href="plantProductUpdate.do" class="view-more"
						style="color: white; cursor: pointer; margin-right: 5px">수정</a>
				</div>
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
								<h3>${kitSelectOne.kit_name }</h3>
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
										<input type="number" id="kitCount" min="0" value="1"
											class="form-control">
									</div>
									<div class="col-md-2" style="float: left; margin-left: 0px;">
										<a onclick="changeNum(this)" id="plus" class="view-more"
											style="color: white; cursor: pointer; margin-top: 0px; padding-top: 5px; padding-bottom: 5px;">+</a>
									</div>
								</div>
							</li>
							<li class="full" id="price">
								
							</li>
							<li class="full"><a href="plantProductAdd.do"
								class="view-more" style="color: white; cursor: pointer;">구매</a>
								<a href="plantProductAdd.do" class="view-more"
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

	$(document).ready(function () {
		$("#price").empty();
		$("#price").append($("<h5>").text( "가격 : "+ (parseInt(${kitSelectOne.kit_price } * 1)).toLocaleString('ko-KR') ),
				$("<br>"), $("<hr>") );
		
	})
	
	function changeNum(e) {
		
		//console.log(e.id);
		var kitCount = parseInt($("#kitCount").val());
		
		var num = 0;
		
		if(e.id === "minus" && kitCount > 0){
			num = -1;
		}else if(e.id==="plus") {
			num = 1;
		}
		
		$("#kitCount").val(kitCount + num);
		
		$("#price").empty();
		$("#price").append($("<h5>").text( "가격 : "+ (parseInt(${kitSelectOne.kit_price }*(kitCount + num))).toLocaleString('ko-KR') ),
				$("<br>"), $("<hr>") );
		console.log( "가격 : "+ (parseInt(${kitSelectOne.kit_price }*(kitCount + num))) );
	}
		</script>
</body>

</html>