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

				<!--페이징처리 시작-->
				<div class="row">
					<div class="col-md-12">
						<div class="gt-pagination mt20">
							<nav>
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous"> <i class="fas fa-angle-left"></i>
									</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item active"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <i class="fas fa-angle-right"></i>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<!--페이징처리 종료-->

			</div>
		</div>
	</section>
	<!--본문 종료-->


	<script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script> 
	<script src="resources/js/GrowDiary.js"></script>
	<script type="text/javascript"
		src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<script type="text/javascript">
var grid = new tui.Grid({
	el : document.getElementById('content'),
	//rowHeight : 73,
	//rowWidth : 'auto',
	//rowHeaders : [ {
		//type : 'rowNum',
		//width : 80,
		//height : 73,
		//align : 'center',
		//valign : 'bottom'
	//} ],//번호 매기기
	//scrollX : false,
	//scrollY : false,
	
	columns : [ {
		header : '작물이름',
		name : 'plant_name',
		filter : 'select'
	}, {
		header : '품질',
		name : 'grow_diary_grd',
		filter : 'select'
	}, {
		header : '점수',
		name : 'grow_diary_point',
	}, {
		header : 'NFT생성여부',
		name : 'grow_diary_nft_create_ennc',
		sortable: true,
	    sortingType: 'desc'
	} ]
	//pageOptions : {
		//useClient : true,
		//perPage : 5
	//}
});

		$.ajax({
			type : "POST",
			url : "cultivationHistory.do",
			success : function(data) {
				//데이터 입력
				console.log(data);
				grid.resetData(data);

				//생성가능여부 가능할때 버튼생성 
				for (var i = 0; i < data.length; i++) {
					if (grid.getValue(i,
							'grow_diary_nft_create_ennc') == 'Y') {
						console.log(data[i]);
						var growDiary = data[i];
						var input = `<div class="container" style="text-aline:center;">
						<a id=createNft data-no=data[i].grow_diary_grow_no href="javascript:nftGeneration('\${data[i].grow_diary_grow_no}');" class="read-post" style="padding:0 0px 10px 30px; width: 80px; height:30px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">생성가능</a></div>`;

						grid.setValue(i,
								'grow_diary_nft_create_ennc',
								input, true);
					} else {
						console.log("123")
						var input = '생성됨';
						grid.setValue(i,
								'grow_diary_nft_create_ennc',
								input, true);
					}
				}
			} //success
		});
		
		
</script>


</body>
</html>
