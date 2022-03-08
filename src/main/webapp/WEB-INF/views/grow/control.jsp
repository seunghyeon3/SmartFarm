<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>how to grow</title>

</head>
<body>
<script src="https://kit.fontawesome.com/1874543bef.js" crossorigin="anonymous"></script>

	<!--본문 시작-->
	<section class="wf100 p80 blog">
		<div class="blog-details">
			<div class="container">
			
			
				<div class="row">
					<div class="col-lg-12 col-md-12">

						<!--재배 키트 목록 시작-->
						<div id="growKitList" class="blog-single-content" style="overflow: auto; white-space: nowrap;">
							<ul class="post-meta">
							
								<c:forEach items="${kitList}" var="grow" varStatus="status">
								
								<li class="tags" style="font-size: 25px; display: inline-block; text-align: center;"><i class="fa-brands fa-raspberry-pi"></i> <a data-index="${status.index}" data-tp="${grow.kit_tp }" data-hd="${grow.kit_hd }" data-sun="${grow.kit_sun }" data-water="${grow.kit_water }" data-pes="${grow.kit_pes }" data-kit="${grow.kit_no }" data-startdate="${grow.grow_status }" data-percent="${grow.percent }" data-end="${grow.end_estimate }" data-url="http://${grow.pur_his_kit_address}/" id="http://${grow.pur_his_kit_address}/" href="#">${grow.pur_his_order_no }(${grow.kit_plant_name })</a></li>
								
								</c:forEach>
								
							</ul>
						</div>
						<!--재배 키트 목록 종료-->
						
						<!--재배 관리 화면 출력부 시작-->
						<div class="event-txt" style="width: 100%; padding: 0;">
							<div class="campaign-txt" style="margin-left: 10px; padding: 0;">
								<ul class="funds">
									<li class="text-left">재배 시작일<strong id="start">2022년 02월 20일 09:30am</strong></li>
									<li class="text-center">진행률<strong id="percent">33%</strong></li>
									<li class="text-right">예상 종료일<strong id="end">2022년 03월 03일 09:30am</strong></li>
								</ul>
								<div class="progress">
									<div id="p-bar" class="progress-bar" role="progressbar"
										style="width: 33%" aria-valuenow="55" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
											
						<div style="display: block;">
							<div>
								<ul class="check-list" style="margin-top: 20px;">
									<li><strong>자동 재배:   </strong><input id="auto" type="checkbox"> </li>
									<li><strong>온도:</strong><input class="value" id="temp" name="temp" type="number"></li>
									<li><strong>습도:</strong><input class="value" id="hum" name="hum" type="number"></li>
									<li><strong>하루 중 일사량(시간):</strong><input class="value" id="light" name="light" type="number"></li>
									<li><strong>하루 중 급액량:</strong><input class="value" id="water" name="water" type="number"></li>
									<li><strong>하루 중 농약량:</strong><input class="value" id="pes" name="pes" type="number"></li>
								</ul>
							</div>
						</div>
						
						<div style="float: left;">
							<a id="growstart" href="#" class="dn-btn">재배 시작</a>
							<a id="growstop" href="#" class="dn-btn">재배 중지</a>
							<a id="growchange" href="#" class="dn-btn">값 변경</a>
							<a href="#" class="dn-btn">재배 완료(일지 저장)</a>
							<a href="#" class="dn-btn">취소(일지 저장 안함)</a>
						</div>
						<!--재배 관리 화면 출력부 종료-->
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--본문 종료-->

<script type="text/javascript">

	$("#growKitList").on("click", "li", function(event)	{
		$("#temp").val("");
		$("#hum").val("");
		$("#light").val("");
		$("#water").val("");
		$("#pes").val("");
		$.ajax({
			type:'get',
			/* url:event.target.dataset.url+"checkGrow", */
			url:event.target.id+"checkGrow",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		}).done(function (result) {
			console.log(result.hum);
			$("#temp").val(result.temp);
			$("#hum").val(result.hum);
			$("#light").val(result.light);
			$("#water").val(result.water);
			$("#pes").val(result.pes);
		})	
		
 		console.log(event.target.dataset.percent);
		console.log(event.target.dataset.startdate);
		
		$("#growstart").attr("data-url", event.target.id);
        $("#growstop").attr("data-url", event.target.id);
        $("#growchange").attr("data-url", event.target.id);
        if(!event.target.dataset.startdate){
	        $("#start").html("");
	        $("#percent").html("재배를 시작해주세요");
	        $("#end").html("");
	        $("#p-bar").css("width","0")
		}else {
        $("#start").html(event.target.dataset.startdate);
        $("#percent").html(event.target.dataset.percent + "%");
        $("#end").html(event.target.dataset.end);
        $("#p-bar").css("width",event.target.dataset.percent+"%")
		}
        $("input#auto").attr("data-tp", event.target.dataset.tp);
        $("input#auto").attr("data-hd", event.target.dataset.hd);
        $("input#auto").attr("data-sun", event.target.dataset.sun);
        $("input#auto").attr("data-water", event.target.dataset.water);
        $("input#auto").attr("data-pes", event.target.dataset.pes);
	})

	$("#growstart").on("click",function(event) {
		
		console.log(event.target.dataset.url);
		if($("input#auto").is(":checked")){
			$.ajax({
				type:'get',
				url:event.target.dataset.url+"startGrow",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data :{
						"temp":$("input#auto")[0].dataset.tp,
						"hum":$("input#auto")[0].dataset.hd,
						"light":$("input#auto")[0].dataset.sun,
						"water":$("input#auto")[0].dataset.water,
						"pes":$("input#auto")[0].dataset.pes
				}
			}).done( function (result) {
				toastr.info(result);
			})
		}else {
			$.ajax({
				type:'get',
				url:event.target.dataset.url+"startGrow",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data :{
						"temp":$("#temp").val(),
						"hum":$("#hum").val(),
						"light":$("#light").val(),
						"water":$("#water").val(),
						"pes":$("#pes").val()
				}
			}).done( function (result) {
				toastr.info(result);
			})
		}
	})
	
	$("#growstop").on("click",function(event) {
		
 		$.ajax({
			type:'get',
			url:event.target.dataset.url+"stopGrow",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		}).done( function (result) {
			toastr.info(result);
		})		
	})
	
	$("#growchange").on("click",function(event) {
		
		console.log(event.target.dataset.url);
		$.ajax({
			type:'get',
			url:event.target.dataset.url+"changeValue",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data :{
				"temp":$("#temp").val(),
				"hum":$("#hum").val(),
				"light":$("#light").val(),
				"water":$("#water").val(),
				"pes":$("#pes").val()
			}
		}).done( function (result) {
			toastr.info(result);
		})		
	})
	
	$("#auto").on("click",function(event) {
		console.log("test");
		if($(this).is(":checked")){
			$("input.value").attr("disabled",true);
			$("input.value").val("");
		}else {
			$("input.value").removeAttr("disabled");
		}
	})
	
</script>

</body>
</html>
