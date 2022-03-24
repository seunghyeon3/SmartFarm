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

<style>

.line {
  fill: none !important;
  stroke: #000 !important;
  stroke-width: 1.5px !important;
}

</style>
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
								<i style="cursor:pointer; font-size: 25px; display: inline-block; text-align: center; color: green;" id = "${grow.pur_his_order_no }" class="fa-brands fa-raspberry-pi"></i>
								<li class="tags" data-index="${status.index}" data-tp="${grow.kit_tp }" data-hd="${grow.kit_hd }" data-sun="${grow.kit_sun }" data-water="${grow.kit_water }" data-pes="${grow.kit_pes }" data-kit="${grow.kit_no }" data-percent="${grow.percent }" data-end="${grow.end_estimate }" data-url="http://${grow.pur_his_kit_address}/" id="http://${grow.pur_his_kit_address}/" style="cursor:pointer; font-size: 25px; display: inline-block; text-align: center; border-radius: 10px;">${grow.pur_his_order_no }(${grow.kit_plant_name })</li>
								
								</c:forEach>
								
							</ul>
						</div>
						<!--재배 키트 목록 종료-->
						
						<!--재배 관리 화면 출력부 시작-->
						<div class="event-txt" style="width: 100%; padding: 0;">
							<div class="campaign-txt" style="margin-left: 10px; padding: 0;">
								<ul class="funds"">
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
							<div style="display:flex; justify-content:space-between;">
								<ul class="check-list" style="margin-top: 20px; width: 40%">
									<li>현재 온도 : <strong id="temp"></strong></li>
									<svg id="svg" class="svg" width="550" height="350" style="margin-left: -60px;"></svg>
								</ul>
								<ul class="check-list" style="margin-top: 20px; width: 40%">
									<li style="height: 110px;">현재 습도 : <strong id="hum"></strong></li>
									<li style="height: 110px;">조명 여부 : <strong id="light"></strong></li>
									<li style="height: 110px;">당일 급액량 : <strong id="water"></strong></li>
									<li style="height: 110px;">당일 농약량 : <strong id="pes"></strong></li>
								</ul>
							</div>
						</div>
						
						<div style="float: left;">


						</div>
						<!--재배 관리 화면 출력부 종료-->
						
					</div>
					
			<!--TEST-->
					<div class="col-lg-3 col-md-4">
                      <div class="sidebar">
                          <!--Widget Start-->
                    	  <div class="side-widget">
           				  	 <h6>태그</h6>
           				 	 <div class="single-post-tags"> 
           				 		<a href="#">친환경</a> <a href="#"> Plant Ecology </a> <a href="#"> Wildlife </a> <a href="#"> Eco Ideas </a> <a href="#"> 자원관리 </a> <a href="#"> 물 </a> <a href="#"> Forest Planting </a> <a href="#"> Donation </a><a href="#"> 재활용 </a> 
           					 </div>
          				  </div>
          				  <!--Widget End--> 
                         <!--Widget Start-->
                         <div class="side-widget text-widget">
                            <h6>최신글</h6>
                            <c:forEach items="${recentlyFree}" var="free" begin="0" end="5">
                           	 <a style="width:200px;white-space: nowrap;overflow:hidden;text-overflow:ellipsis;" href="freeOne.do?free_no=${free.free_no}">${free.free_title}</a>
                            </c:forEach>
                         </div>
                         <!--Widget End--> 
                         <!--Widget Start-->
                         <div class="side-widget">
                            <h6>NFT경매 목록</h6>
                            <ul class="lastest-products">
						<c:forEach items="${aucnEnable }" var="aucn" begin="0" end="3">
                               <li> 
							<img src="<c:url value='../upload/${aucn.nft_img }'/>" alt="" style="width: 45px; height: 60px;">
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
                            <h6>재배 바로가기</h6>
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
<button onclick="vsvs()"></button>
  
<script src="//d3js.org/d3.v4.min.js"></script>
<script>

function vsvs() {
	d3.selectAll(".line").transition();
}

var test;

$("#growKitList").on("click", "li", function(event)	{
	$(event.target).parent().children().css({'background-color': '', 'color':'#999999'});
	$(event.target).css({'background-color': '#009000', 'color':'white'});
	$(event.target).prev().css('color','#009000');
	$("#temp").html('');
	$("#hum").html('');
	$("#light").html('');
	$("#water").html('');
	$("#pes").html('');
	vsvs();
	
	$("#svg").empty();
	
	
	test = event.target.id;
	
	

	var n = 40,
	    random = function(){
			return 0;
		},
		data = d3.range(n).map(random);
	
	var svg = d3.select("svg"),
	    margin = {top: 50, right: 50, bottom: 50, left: 100},
	    width = +svg.attr("width") - margin.left - margin.right,
	    height = +svg.attr("height") - margin.top - margin.bottom,
	    g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	var x = d3.scaleLinear()
	    .domain([0, n - 1])
	    .range([0, width]);

	var y = d3.scaleLinear()
	    .domain([-10, 40])
	    .range([height, 0]);

	var line = d3.line()
	    .x(function(d, i) { return x(i); })
	    .y(function(d, i) { return y(d); });

	g.append("defs").append("clipPath")
	    .attr("id", "clip")
	  .append("rect")
	    .attr("width", width)
	    .attr("height", height);

	g.append("g")
	    .attr("class", "axis axis--x")
	    .attr("transform", "translate(0," + y(0) + ")")
	    .call(d3.axisBottom(x));

	g.append("g")
	    .attr("class", "axis axis--y")
	    .call(d3.axisLeft(y));

    g.append("g")
    .attr("clip-path", "url(#clip)")
    .append("path")
    .datum(data)
    .attr("class", "line")
    .transition()
    .duration(1000)
    .ease(d3.easeLinear)
    .on("start", tick);

	function tick() {

		
		
	    $.ajax({
	        url: test+"sensor",
	        type: 'get',
	        success: function(result) {
	        	console.log(result);
				data.push(result.temp);
				$("#temp").html(result.temp);
				$("#hum").html(result.hum);
				$("#light").html(result.light);
				$("#water").html(result.water);
				$("#pes").html(result.pes);
	        },
	        error: function(){
	        	d3.selectAll(".line").transition();
	        	$("#temp").html('');
	        	$("#hum").html('');
	        	$("#light").html('');
	        	$("#water").html('');
	        	$("#pes").html('');
	        }
	    })	
		
	  // Push a new data point onto the back.
	/*   data.push(random());
	 */
	  // Redraw the line.
	  console.log(this);
	  d3.select(this)
	      .attr("d", line)
	      .attr("transform", null);

	  // Slide it to the left.
	  d3.active(this)
	      .attr("transform", "translate(" + x(-1) + ",0)")
	    .transition()
 	      .on("start", tick);

	  // Pop the old data point off the front.
	  data.shift();
/* 	  
	  $("#svg").css("margin-left", "-60px");
	  $("#svg").css("margin-top", "-50px");
	  $("#svg").css("margin-bottom", "-50px");
	   */

	}

	
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
		$("#start").html(result.startDate);
	    $("#percent").html(result.percent+ "%");
	    $("#end").html(result.end);
	    $("#p-bar").css("width",result.percent+"%");
	    
	    
	console.log(data);
		if(result.status == 2) {
		}
	})	
	
		console.log(event.target.dataset.percent);
	
})


	
$(function() {
	console.log(${no});
		console.log($("#${no}").parent());
		$("#${no}").next().click();
});

</script>
</body>
</html>
