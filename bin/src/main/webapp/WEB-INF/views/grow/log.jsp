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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<!--본문 시작-->
	<section class="wf100 p80 blog">
		<div class="blog-details">
			<div class="container">
			
			
				<div class="row">
					<div class="col-lg-12 col-md-12">


						<!--재배 키트 목록 시작-->
						<div class="blog-single-content" style="overflow: auto; white-space: nowrap;">
							<ul class="post-meta">
							
								<c:forEach items="${kitList}" var="grow">
								
								<li class="tags" style="font-size: 25px; display: inline-block; text-align: center;"><i class="fa-brands fa-raspberry-pi"></i> <a href="#">${grow.kit_no }</a></li>
								
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
							    <c:forEach items="${filenames}" var="log">
								<li><strong>${log}</strong></li>
								</c:forEach>
								
							</ul>
						</div>
						
						<div style="display: inline-block; width: 75%; border: 1px solid black;">
							<ul id="log" class="check-list">
								<li>00:00 자동재배중입니다/온도30 습도60 일사량5 급액량400 재배중입니다</li>
								<li>10:17 온도변화를 감지하였습니다 27 -> 33</li>
								<li>15:20 온도를 설정값을 30도로 변경하였습니다</li>
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

$("#daily").on("click", "li", function(event){ 

    $.ajax({
        url: 'logBody.do',
        type: 'post',
        data: {"file" : event.target.innerText},
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
