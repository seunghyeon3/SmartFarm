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
								
								<%-- <li class="tags" style="font-size: 25px; display: inline-block; text-align: center;"><i class="fa-brands fa-raspberry-pi"></i> <a data-index="${status.index}" data-tp="${grow.kit_tp }" data-hd="${grow.kit_hd }" data-sun="${grow.kit_sun }" data-water="${grow.kit_water }" data-pes="${grow.kit_pes }" data-kit="${grow.kit_no }" data-startdate="${grow.grow_status }" data-percent="${grow.percent }" data-end="${grow.end_estimate }" data-url="http://${grow.pur_his_kit_address}/" id="http://${grow.pur_his_kit_address}/" href="javascript:void(0);">${grow.pur_his_order_no }(${grow.kit_plant_name })</a></li> --%>
								<li class="tags" data-index="${status.index}" data-tp="${grow.kit_tp }" data-hd="${grow.kit_hd }" data-sun="${grow.kit_sun }" data-water="${grow.kit_water }" data-pes="${grow.kit_pes }" data-kit="${grow.kit_no }" data-percent="${grow.percent }" data-end="${grow.end_estimate }" data-url="http://${grow.pur_his_kit_address}/" id="http://${grow.pur_his_kit_address}/" style="cursor:pointer; font-size: 25px; display: inline-block; text-align: center;"><i id = "${grow.pur_his_order_no }" class="fa-brands fa-raspberry-pi"></i>${grow.pur_his_order_no }(${grow.kit_plant_name })</li>
								
								</c:forEach>
								
							</ul>
						</div>
						<!--재배 키트 목록 종료-->
						
						<!--재배 관리 화면 출력부 시작-->
						<div class="event-txt" style="width: 100%; padding: 0;">
							<div class="campaign-txt" style="margin-left: 10px; padding: 0;">
								<ul class="funds">
									<li class="text-left">재배 시작일<strong id="start">^^^</strong></li>
									<li class="text-center">진행률<strong id="percent">상단 목록에서 키트를 선택해 주세요</strong></li>
									<li class="text-right">예상 종료일<strong id="end">^^^</strong></li>
								</ul>
								<div class="progress">
									<div id="p-bar" class="progress-bar" role="progressbar"
										style="width: 0%" aria-valuenow="55" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
											
						<div style="display: block;">
							<div>
								<ul class="check-list" style="margin-top: 20px;">
									<li><strong id="name"> </strong></li>
									<li><strong>자동 재배:</strong><input id="auto" type="checkbox"></li>
									<li><strong>온도(적정값: 1~40):</strong><input class="value" id="temp" name="temp" type="number" min="1" max="40"></li>
									<li><strong>습도(적정값: 10~90):</strong><input class="value" id="hum" name="hum" type="number" min="10" max="90"></li>
									<li><strong>하루 중 일사시간(적정값: 1~15):</strong><input class="value" id="light" name="light" type="number" min="1" max="15"></li>
									<li><strong>하루 중 급액량(적정값: 10~500):</strong><input class="value" id="water" name="water" type="number" min="10" max="400"></li>
									<li><strong>하루 중 농약량(적정값: 0~70):</strong><input class="value" id="pes" name="pes" type="number" min="0" max="70"></li>
								</ul>
							</div>
						</div>
						
						<div style="float: left;">
							<a id="growstart" href="#" class="dn-btn">재배 시작</a>
							<a id="growstop" href="#" class="dn-btn">재배 중지</a>
							<a id="growchange" href="#" class="dn-btn">값 변경</a>
							
							<a style="display: none;" id="complete" href="#" class="dn-btn">재배 완료(일지 저장)</a>
							<a style="display: none;" id="cancel" href="#" class="dn-btn">취소(일지 저장 안함)</a>
							
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
		$("#name").html(event.target.innerText);
		$("#complete").hide();
		$("#cancel").hide();
		$("#auto").prop("checked", false);
		$("input.value").removeAttr("disabled");
		$("#temp").val("");
		$("#hum").val("");
		$("#light").val("");
		$("#water").val("");
		$("#pes").val("");
		$("#start").html("");
	    $("#percent").html("연결중..");
	    $("#end").html("");
	    $("#p-bar").css("width","0%");
		$.ajax({
			type:'get',
			/* url:event.target.dataset.url+"checkGrow", */
			url:event.target.id+"checkGrow",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			error: function(){
			    $("#percent").html("키트 연결 상태를 확인하세요");
			}
		}).done(function (result) {
			console.log(result.status)
			$("#temp").val(result.temp);
			$("#hum").val(result.hum);
			$("#light").val(result.light);
			$("#water").val(result.water);
			$("#pes").val(result.pes);
			$("#start").html(result.startDate);
		    $("#percent").html(result.percent+ "%");
		    $("#end").html(result.end);
		    $("#p-bar").css("width",result.percent+"%");
			if(result.status == 2) {
				$("#complete").show();
				$("#cancel").show();				
			}
		})	
		
 		console.log(event.target.dataset.percent);
		
		$("#growstart").attr("data-url", event.target.id);
        $("#growstop").attr("data-url", event.target.id);
        $("#growchange").attr("data-url", event.target.id);
        $("#complete").attr("data-url", event.target.id);
        $("#cancel").attr("data-url", event.target.id);
        /* if(!event.target.dataset.startdate){ */
/* 	        $("#start").html("");
	        $("#percent").html("재배를 시작해주세요");
	        $("#end").html("");
	        $("#p-bar").css("width","0"); */
		/* }else { */
/*         $("#start").html(event.target.dataset.startdate); */
       /*  $("#percent").html(event.target.dataset.percent + "%"); */
        /* $("#end").html(event.target.dataset.end); */
        /* $("#p-bar").css("width",event.target.dataset.percent+"%") */
        
		/* } */
        
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
	
	$("#complete").on("click",function(event) {
		console.log(event.target.dataset.url);
		$.ajax({
			type:'get',
			url:event.target.dataset.url+"complete",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		}).done( function (result) {
			toastr.info(result);
		})		
	})
	
	$(function() {
		console.log(${no});
			console.log($("#${no}").parent());
			$("#${no}").parent().click();
	});
	
</script>

</body>
</html>
