<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
<meta charset="UTF-8">
<title>how to grow</title>



</head>
<body>
<script src="https://kit.fontawesome.com/1874543bef.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

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
						<div class="event-txt" style="width: 100%; padding: 0; margin-top: 50px;">
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
											
											
						<div style="display:flex; justify-content:space-between;">
							<div style="display: inline-block; height: 400px; width: 20%;">
								<ul id="daily" class="check-list" style="margin-top: 20px;">
									<!-- 로그 리스트 -->
								</ul>
							</div>
							
							<div style="display: inline-block; width: 75%; border: 1px solid black; height: 400px; overflow: auto; white-space: nowrap;">
								<ul id="log" class="check-list">
									<!-- 로그 내용 -->
								</ul>
							</div>
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
                              <h5>재배관리 바로가기</h5>
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

	function format(d) {
		var year = d.getFullYear();
		var month = ('0' + (d.getMonth() + 1)).slice(-2);
		var day = ('0' + d.getDate()).slice(-2);
		return dateString = year + '-' + month  + '-' + day;
	}

	$("#growKitList").on("click", "li", function(event)	{
		$(event.target).parent().children().css('background-color', '');
		$(event.target).css('background-color', 'green');
        $("#log").empty();
		$("#start").html("");
	    $("#percent").html("연결중..");
	    $("#end").html("");
	    $("#p-bar").css("width","0%");

        $("#daily").empty();
        
		var day1 = new Date();
		/* var day1 = new Date('2022-03-12'); */
		console.log(day1);
		
		$.ajax({
			type:'get',
			/* url:event.target.dataset.url+"checkGrow", */
			url:event.target.id+"checkGrow",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		}).done(function (result) {
			$("#start").html(result.startDate);
		    $("#percent").html(result.percent+ "%");
		    $("#end").html(result.end);
		    $("#p-bar").css("width",result.percent+"%");
			console.log(result.status);
			console.log(result.id);
			console.log(result.startDate.substr(0,10));
			var day2 = new Date(result.startDate.substr(0,10));
			var difference= Math.abs(day1-day2);
			days = difference/(1000 * 3600 * 24)
			console.log(days)
			if(result.status != 0) {
				for(var i=0; i<=days; i++) {
					var j = new Date();
					var k = format(new Date(j.setDate(day1.getDate() + i)));
					console.log(k);
					var li = document.createElement("li");
					var txt = '${SPRING_SECURITY_CONTEXT.authentication.principal.username}' + result.id +format(day2);
					console.log(txt);
					li.data = txt;
					li.setAttribute('data-log', txt);
					li.setAttribute('style', 'cursor:pointer;');
					li.innerHTML=k;
					$("#daily").append(li);
		            /* $("#daily").html("<li data-log='"+txt+"'" ) */
				}
			}
		})
		
		
	})


$("#daily").on("click", "li", function(event){ 
	console.log(event.target.dataset.log);
    $.ajax({
        url: 'logBody.do',
        type: 'post',
        data: {"file" : event.target.dataset.log, "date" : event.target.innerText},
        success: function(result) {
            $("#log").empty();
			for(i=0; i<result.length; i++) {
         	   $("#log").append("<li>" + result[i] + "</li>");
			}
        }
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
