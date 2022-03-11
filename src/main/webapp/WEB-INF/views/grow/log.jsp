<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<div class="col-lg-12 col-md-12">

						<!--재배 키트 목록 시작-->
						<div id="growKitList" class="blog-single-content" style="overflow: auto; white-space: nowrap;">
							<ul class="post-meta">
							
								<c:forEach items="${kitList}" var="grow">
								
								<li class="tags" style="cursor:pointer; font-size: 25px; display: inline-block; text-align: center;" data-url="http://${grow.pur_his_kit_address}/" id="http://${grow.pur_his_kit_address}/" ><i class="fa-brands fa-raspberry-pi"></i>${grow.pur_his_order_no }(${grow.kit_plant_name })</li>
								
								</c:forEach>
								
							</ul>
						</div>
						<!--재배 키트 목록 종료-->
						
						<!--재배 관리 화면 출력부 시작-->
						<div class="event-txt" style="width: 100%; padding: 0;">
							<div class="campaign-txt" style="margin-left: 10px; padding: 0;">
								<ul class="funds">
									<li class="text-left">재배 시작일<strong>2022년 02월 20일 09:30am</strong></li>
									<li class="text-center">진행률<strong>33%</strong></li>
									<li class="text-right">예상 종료일<strong>2022년 03월 03일 09:30am</strong></li>
								</ul>
								<div class="progress">
									<div class="progress-bar" role="progressbar"
										style="width: 33%" aria-valuenow="55" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
											
						<div style="display: inline-block; width: 20%;">
							<ul id="daily" class="check-list" style="margin-top: 20px;">
								<!-- 로그 리스트 -->
							</ul>
						</div>
						
						<div style="display: inline-block; width: 75%; border: 1px solid black;">
							<ul id="log" class="check-list">
								<!-- 로그 내용 -->
							</ul>

						</div>
						
						<!--재배 관리 화면 출력부 종료-->
						
					</div>
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

        $("#daily").empty();
        
		var day1 = new Date();
		var day1 = new Date('2022-03-12');
		console.log(day1);
		
		$.ajax({
			type:'get',
			/* url:event.target.dataset.url+"checkGrow", */
			url:event.target.id+"checkGrow",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		}).done(function (result) {
			console.log(result.status);
			console.log(result.id);
			console.log(result.startDate.substr(0,10));
			var day2 = new Date(result.startDate.substr(0,10));
			var difference= Math.abs(day1-day2);
			days = difference/(1000 * 3600 * 24)
			console.log(days)
			if(result.status == 2) {
				for(var i=0; i<=days; i++) {
					var j = new Date();
					var k = format(new Date(j.setDate(day1.getDate() + i)));
					console.log(k);
					var li = document.createElement("li");
					var txt = '${member.mem_email}' + result.id +format(day2);
					console.log(txt);
					li.data = txt;
					li.setAttribute('data-log', txt);
					li.innerHTML=k;
					$("#daily").append(li);
		            /* $("#daily").html("<li data-log='"+txt+"'" ) */
				}
			}
		})
		
		
	})


$("#daily").on("click", "li", function(event){ 
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

</script>

</body>
</html>
