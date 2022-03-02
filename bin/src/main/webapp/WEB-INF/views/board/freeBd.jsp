<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>how to grow</title>
<style type="text/css">
	.lastest-products img {
		width: 68px;
		height: 68px;	
	}
</style>
</head>
<body>

	<!--본문 시작-->

	<section class="wf100 p80 events">
		<div class="event-list-two">
			<div class="container">

				<!--주 화면 시작-->
				<div class="row">
					<div class="col-lg-12 col-md-12">

						<%-- <c:forEach items="${growVOList}" var="grow"> --%>

							<!--Widget Start-->
							<div class="">
								<h5>News &amp; Articles</h5>
								<ul class="lastest-products">
									<li>
										<img src="resources/images/flp1.jpg" alt="">
										<strong><a href="#">뭔 글만 쓰면 어그로네 (1)</a></strong>
										<strong><a href="#">뭔 글만 쓰면 어그로네 (1)</a></strong>
										<span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>
									</li>
									<li>
										<img src="resources/images/flp2.jpg" alt="">
										<strong><a href="#">킹15 우리의 히가시 죠는 왜이리 슬프냐 (2)</a></strong>
										<span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>
									</li>
									<li>
										<img src="resources/images/flp3.jpg" alt="">
										<strong><a href="#">쉐오툼은 진짜 최적화가 아주좋긴하네 (2)</a></strong>
										<span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>
									</li>
									<li>
										<img src="resources/images/fc1.jpg" alt="">
										<strong><a href="#">잠자고있는 구형 맥북에어를 꺼냈다 (2)</a></strong>
										<span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>
									</li>
									<li>
										<img src="resources/images/fc2.jpg" alt="">
										<strong><a href="#">오늘 뭔가 계속 찝찝한게 느껴졌는데 (3)</a></strong>
										<span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>
									</li>
									<li>
										<img src="resources/images/fc3.jpg" alt="">
										<strong><a href="#">64기가로 충분한 저한테</a></strong>
										<span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>
									</li>
									<li>
										<img src="resources/images/flp1.jpg" alt="">
										<strong><a href="#">몇년만에 폰 구입.. (6)</a></strong>
										<span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>
									</li>
									<li>
										<img src="resources/images/flp1.jpg" alt="">
										<strong><a href="#">코로나 걸린듯 (4)</a></strong>
										<span class="pdate"><i class="fas fa-calendar-alt"></i>29 September, 2018</span>
									</li>
								</ul>
							</div>
							<!--Widget end-->

						<%-- </c:forEach> --%>

					</div>
				</div>
				<!--주 화면 종료-->
				
				<!--페이징처리 test시작-->
					<div>
					    <section>
					        <div id="data-container"></div>
					        <div id="pagination"></div>
					    </section>
					</div>
				<!--페이징처리 test종료-->
			</div>
		</div>
	</section>
	<!--본문 종료-->
	
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
    
	<script type="text/javascript">

	    $(function () {
	        let container = $('#pagination');
	        container.pagination({
	            dataSource: [
	                {name: "hello1"},
	                {name: "hello2"},
	                {name: "hello3"},
	                {name: "hello4"},
	                {name: "hello5"},
	                {name: "hello6"},
	                {name: "hello7"},
	                {name: "hello8"},
	                {name: "hello9"},
	                {name: "hello10"},
	                {name: "hello11"},
	                {name: "hello12"},
	                {name: "hello13"},
	                {name: "hello14"},
	                {name: "hello15"},
	                {name: "hello16"},
	                {name: "hello17"},
	            ],
	            callback: function (data, pagination) {
	                var dataHtml = '<ul>';

	                $.each(data, function (index, item) {
	                    dataHtml += '<li>' + item.name + '</li>';
	                });

	                dataHtml += '</ul>';

	                $("#data-container").html(dataHtml);
	            }
	        })
	    })
	
	</script>

</body>
</html>
