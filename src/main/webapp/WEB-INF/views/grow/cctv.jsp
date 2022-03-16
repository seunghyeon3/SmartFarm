<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<sec:authorize access="isAnonymous()" >
	<c:redirect url="home.do"></c:redirect>
</sec:authorize>
<script src="https://kit.fontawesome.com/1874543bef.js" crossorigin="anonymous"></script>

	<!--본문 시작-->
	<section class="wf100 p80 blog">
		<div class="blog-details">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12">


						<!--재배 키트 목록 시작-->
						<div class="blog-single-content" style="overflow: auto; white-space: nowrap;">
							<ul id="growKitList" class="post-meta">
							
								<c:forEach items="${kitList}" var="grow" varStatus="status">
								
								<%-- <li class="tags" style="font-size: 25px; display: inline-block; text-align: center;"><i class="fa-brands fa-raspberry-pi"></i> <a data-index="${status.index}" data-tp="${grow.kit_tp }" data-hd="${grow.kit_hd }" data-sun="${grow.kit_sun }" data-water="${grow.kit_water }" data-pes="${grow.kit_pes }" data-kit="${grow.kit_no }" data-startdate="${grow.grow_status }" data-percent="${grow.percent }" data-end="${grow.end_estimate }" data-url="http://${grow.pur_his_kit_address}/" id="http://${grow.pur_his_kit_address}/" href="javascript:void(0);">${grow.pur_his_order_no }(${grow.kit_plant_name })</a></li> --%>
								<li class="tags" data-index="${status.index}" data-tp="${grow.kit_tp }" data-hd="${grow.kit_hd }" data-sun="${grow.kit_sun }" data-water="${grow.kit_water }" data-pes="${grow.kit_pes }" data-kit="${grow.kit_no }" data-percent="${grow.percent }" data-end="${grow.end_estimate }" data-url="http://${grow.pur_his_kit_address}/" id="http://${grow.pur_his_kit_address}/" style="cursor:pointer; font-size: 25px; display: inline-block; text-align: center;"><i id = "${grow.pur_his_order_no }" class="fa-brands fa-raspberry-pi"></i>${grow.pur_his_order_no }(${grow.kit_plant_name })</li>
								
								</c:forEach>
								
							</ul>
						</div>
						<!--재배 키트 목록 종료-->
						
						<!--cctv 화면 출력부 시작-->
						<h3>CCTV 화면</h3><br><br>
						
						
						<div>
								<iframe style="width: 800px; height: 450px;" src="https://player.vimeo.com/video/89009039"></iframe>
						</div>
						<!--cctv 화면 출력부 종료-->

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--본문 종료-->

<script type="text/javascript">
$("#growKitList").on("click", "li", function(event)	{
	$(event.target).parent().children().css('background-color', '');
	$(event.target).css('background-color', 'green');
		})

</script>
</body>
</html>
