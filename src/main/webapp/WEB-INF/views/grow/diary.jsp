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
					
					
						<div style="display: block;">
							<a href="#" class="dn-btn">NFT 생성 바로가기</a>
						</div>
	
						<div style="display: inline-block; width: 20%;">
							<ol id="diary" style="margin-top: 20px;">
							    <c:forEach items="${test}" var="test">
							
								<li><strong>${test.grow_diary_grow_nick }</strong></li>
								</c:forEach>

							</ol>
						</div>
						<div style="display: inline-block; width: 75%; border: 1px solid black;">
							<ul id="log" class="check-list">
								<li>1일차 00:00 자동재배중입니다/온도30 습도60 일사량5 급액량400 재배중입니다</li>
								<li>2일차 10:17 온도변화를 감지하였습니다 27 -> 33</li>
								<li>3일차 15:20 온도를 설정값을 30도로 변경하였습니다</li>
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

$("#diary").on("click", "li", function(event){ 
	console.log("test")
	
	$("#log").empty();
	
	for(var i=0; i<10; i++) {
		$("#log").append("<li>New li tag</li>");
	}
}) 

</script>

</body>
</html>
