<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
					<div class="col-lg-9 col-md-8">

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
						<div class="event-txt" style="width: 100%; padding: 0; margin-top: 50px; margin-bottom: 50px;">
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
											
						<div style="display: inline-block; width: 60%; margin-right: 10%;">
							<div>
								<ul class="check-list" style="margin-top: 20px;">
									<li><strong style="font-size: 30px;" id="name"> </strong></li><br><hr>
									<li style="height: 40px;"><strong>자동 재배:</strong><input id="auto" type="checkbox"></li><hr>
									<li style="height: 40px;"><strong>NFT 자동재배:</strong><select id="nft" style="float: right; width: 150px;"></select></li><hr>
									<li style="height: 40px;"><strong>온도(적정값: 1~40):</strong><input style="float: right; width: 150px;" class="value" id="temp" name="temp" type="number" min="1" max="40"></li><hr>
									<li style="height: 40px;"><strong>습도(적정값: 10~90):</strong><input style="float: right; width: 150px;" class="value" id="hum" name="hum" type="number" min="10" max="90"></li><hr>
									<li style="height: 40px;"><strong>일사시간(적정값: 1~15):</strong><input style="float: right; width: 150px;" class="value" id="light" name="light" type="number" min="1" max="15"></li><hr>
									<li style="height: 40px;"><strong>급액량(적정값: 10~500):</strong><input style="float: right; width: 150px;" class="value" id="water" name="water" type="number" min="10" max="400"></li><hr>
									<li style="height: 40px;"><strong>농약량(적정값: 0~70):</strong><input style="float: right; width: 150px;" class="value" id="pes" name="pes" type="number" min="0" max="70"></li>
								</ul>
							</div>
 						</div>
						<div style="height: 586px; display: flex; justify-content: flex-end; align-content:space-between; flex-direction: column; float: right; width: 19%">
							<div id="score" style="font-size: 50px;"></div>
							<a id="complete" href="#" class="dn-btn" style="margin-top: 10px; width: 150px; text-align: center; display: none;">재배 완료(일지 저장)</a>
							<a id="growstart" href="#" class="dn-btn" style="margin-top: 10px; width: 150px; text-align: center;">재배 시작</a>
							<a id="growstop" href="#" class="dn-btn" style="margin-top: 10px; width: 150px; text-align: center;">취소</a>
							<a id="growchange" href="#" class="dn-btn" style="margin-top: 10px; width: 150px; text-align: center;">값 변경</a><br>
						</div>
						<!--재배 관리 화면 출력부 종료-->
						
					</div>
					
					<!--TEST-->
					<div class="col-lg-3 col-md-4">
                        <div class="sidebar">
                           <!--Widget Start-->
                           <div class="side-widget text-widget">
                              <h5>최신글</h5>
                              <c:forEach items="${recentlyFree}" var="free" begin="0" end="5">
                             	 <a style="width:200px;white-space: nowrap;overflow:hidden;text-overflow:ellipsis;" href="freeOne.do?free_no=${free.free_no}">${free.free_title}</a>
                              </c:forEach>
                           </div>
                           <!--Widget End--> 
                           <!--Widget Start-->
                           <div class="side-widget">
                              <h5>NFT경매 목록</h5>
                              <ul class="lastest-products">
								<c:forEach items="${aucnEnable }" var="aucn" begin="0" end="3">
                                 <li> 
									<img src="<c:url value='/resources/nft/merge/${aucn.nft_img }'/>" alt="" style="width: 45px; height: 60px;">
                                 	<strong>
                                 		<a href="aucnDetail.do?aucnNo=${aucn.aucn_no}">${aucn.aucn_title}</a>
									</strong> <span class="pdate">
									<i class="fas fa-calendar-alt"></i>현재 가격 : ${aucn.now_bid }</span> </li>
                              	</c:forEach>
                              </ul>
                           </div>
                           <!--Widget Start--> 
                           <!--Widget Start-->
                           <div class="side-widget project-list-widget">
                              <h5>나의 키트</h5>
                              <ul>
                              	<c:forEach items="${kitList}" var="grow">
                                 <li><a href="control.do?no=${grow.pur_his_order_no }">${grow.kit_plant_name}</a></li>
                                 </c:forEach>
                              </ul>
                           </div>
                           <!--Widget End--> 
                        </div>
                     </div>
					<!--TEST END-->
					

				</div>
			</div>
		</div>
	</section>
	<!--본문 종료-->

<script type="text/javascript">

	$("#growKitList").on("click", "li", function(event)	{
		$(event.target).parent().children().css('background-color', '');
		$(event.target).css('background-color', 'green');
/* 		$("input.value").removeAttr("disabled");
		$("#auto").removeAttr("disabled"); */
		$("#score").html('');
		$("#nft").empty();
		var dop = $("<option>");
		dop.html("선택하세요");
		dop.attr("value", "0");
		$("#nft").append(dop);
		$("#nft").val("0").trigger('change');
		$("#name").html(event.target.innerText);
		$("#complete").hide();
/* 		$("#auto").prop("checked", false);
		$("input.value").removeAttr("disabled"); */
		if($("#auto").is(":checked")){
			$("#auto").click();
		}
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
		    $("#score").html("점수: "+result.score);
		    if(result.score == undefined) {
		    	$("#score").empty();
		    }
		    if(result.auto == 1) {
				$("#auto").click();
		    }
			if(result.status == 2) {
				$("#complete").show();
			}
		})
		
		$.ajax({
			type:'get',
			/* url:event.target.dataset.url+"checkGrow", */
			url:"nftList.do",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: {
				"kit_no" : event.target.dataset.kit
			},
			error: function(){

			}
		}).done(function (result) {

 			for (var i = 0; i<result.length; i++) {
				var op = $("<option>");
				op.html(result[i].nft_no + "(" + result[i].grow_diary_grd + ")");
				op.attr("value",result[i].grow_diary_log_rou);
				$("#nft").append(op);
			} 
		})
		
 		console.log(event.target.dataset.percent);
		
		$("#growstart").attr("data-url", event.target.id);
        $("#growstop").attr("data-url", event.target.id);
        $("#growchange").attr("data-url", event.target.id);
        $("#complete").attr("data-url", event.target.id);
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
						"pes":$("input#auto")[0].dataset.pes,
						"auto":$("input#auto")[0].dataset.auto
				}
			}).done( function (result) {
				toastr.info(result);
			})
		}else if($("#nft option:selected").val() != "0") {
			$.ajax({
				type:'get',
				url:event.target.dataset.url+"startGrow",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data :{
						"temp":$("#nft")[0].dataset.tp,
						"hum":$("#nft")[0].dataset.hd,
						"light":$("#nft")[0].dataset.sun,
						"water":$("#nft")[0].dataset.water,
						"pes":$("#nft")[0].dataset.pes,
						"auto":$("#nft")[0].dataset.auto
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
						"pes":$("#pes").val(),
						"auto":"0"
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
		if($("input#auto").is(":checked")){
			$.ajax({
				type:'get',
				url:event.target.dataset.url+"changeValue",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data :{
					"temp":$("input#auto")[0].dataset.tp,
					"hum":$("input#auto")[0].dataset.hd,
					"light":$("input#auto")[0].dataset.sun,
					"water":$("input#auto")[0].dataset.water,
					"pes":$("input#auto")[0].dataset.pes,
					"auto":$("input#auto")[0].dataset.auto
				}
			}).done( function (result) {
				toastr.info(result);
			})
		}else if($("#nft option:selected").val() != "0") {
			$.ajax({
				type:'get',
				url:event.target.dataset.url+"changeValue",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data :{
					"temp":$("#nft")[0].dataset.tp,
					"hum":$("#nft")[0].dataset.hd,
					"light":$("#nft")[0].dataset.sun,
					"water":$("#nft")[0].dataset.water,
					"pes":$("#nft")[0].dataset.pes,
					"auto":$("#nft")[0].dataset.auto
				}
			}).done( function (result) {
				toastr.info(result);
			})
		}else {
			$.ajax({
				type:'get',
				url:event.target.dataset.url+"changeValue",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data :{
					"temp":$("#temp").val(),
					"hum":$("#hum").val(),
					"light":$("#light").val(),
					"water":$("#water").val(),
					"pes":$("#pes").val(),
					"auto":"0"
				}
			}).done( function (result) {
				toastr.info(result);
			})			
		}
	})
	
	$("#auto").on("click",function(event) {
		console.log("test");
		if($(this).is(":checked")){
			$("input.value").attr("disabled",true);
			$("#nft").attr("disabled",true);
			$("input.value").val("");
	        $("input#auto").attr("data-auto", "1");
		}else {
			$("input.value").removeAttr("disabled");
			$("#nft").removeAttr("disabled");
	        $("input#auto").attr("data-auto", "0");
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
	
	
    $("#nft").on("change",function(){
		$("input.value").val("");
		$("input.value").attr("disabled",true);
		$("#auto").attr("disabled",true);
        var sel_one = $("#nft option:selected").val();
        if(sel_one === "0"){
        	$("#nft").removeAttr("data-tp")
        	$("#nft").removeAttr("data-hd")
        	$("#nft").removeAttr("data-sun")
        	$("#nft").removeAttr("data-water")
        	$("#nft").removeAttr("data-pes")
			$("input.value").removeAttr("disabled");
			$("#auto").removeAttr("disabled");
            return false;
        }
        
        $.ajax({
            type: 'post',
            url:'nftValue.do',
            data: {nft:$(this)[0].value},
            success: function (data) {
            	console.log(data);
            	$("#nft").attr("data-tp", data.temp);
                $("#nft").attr("data-hd", data.hum);
                $("#nft").attr("data-sun", data.light);
                $("#nft").attr("data-water", data.water);
                $("#nft").attr("data-pes", data.pes);
                $("#nft").attr("data-auto", "1");
            },
            error: function () {
                console.log('error');
            }
        }); 
    });
	
	
</script>

</body>
</html>
