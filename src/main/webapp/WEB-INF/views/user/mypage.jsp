<%@page import="co.smartFarm.user.memberService.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<head>
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
</style>
</head>
<body>
	<section class="wf100 p80 blog">
		<div class="causes-listing">
			<div class="container">
				<h1>마이페이지</h1>
				<br>
				<h2>&lt; 판매현황 &gt;</h2>
				<br> <br>

				<div class="row">
					<!-- 차트 출력 -->

					<div class="col-lg-9 col-md-8">
						<canvas id="myChart" style="z-index: 1;"></canvas>
					</div>

					<div class="col-lg-3 col-md-4">
						<div class="sidebar">
							<div class="side-widget project-list-widget">

								<ul>
									<li><a href="javascript:void(0)" onclick="editMember()">회원정보수정</a></li>
									<li><a href="javascript:void(0)"
										onclick="cultivationHistory()">재배내역</a></li>
									<li><a href="javascript:void(0)"
										onclick="purchaseHistory()">구매내역</a></li>
									<li><a href="javascript:void(0)"
										onclick="farmerApplicationStatus()">농부신청현황</a></li>
									<li><a href="nftholdings.do">NFT보유현황</a></li>
									<li><a href="javascript:void(0)" onclick="withdrawal()">회원탈퇴</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div id="light" class="col-md-12 white_content">
						팝업창 <a href="javascript:void(0)" onclick="exitPopup()" onkeyup="escExit(event)" style="float:right">Close </a> <br> <br>
						<div id="content">123</div>
					</div>
					<div id="123"></div>
					<!-- 220308 PSH loading page 수정 -->
					<div id="fade" class="black_overlay loading"></div>
				</div>
			</div>
		</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
	<script src="resources/js/GrowDiary.js"></script>
	<script type="text/javascript"
		src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

	<script>

		/* ----------팝업 esc로 닫기 ( 미 완 성 )---------- */
		function escExit(e){
			console.log("123")
            if (e.keyCode == "27") {
                alert("esc");
    			document.getElementById('light').style.display='none';
    			document.getElementById('fade').style.display='none';
			}
		}
		
		/* ----------팝업 로딩생성---------- */
		function createLoading(){
			<!-- 220308 PSH loading page 수정 -->
			/* document.getElementById('fade').style.display = 'block'; */
			document.getElementById('fade').innerHTML = "";
			document.getElementById('fade').style.display="flex";
			var img = document.createElement("img");
			img.setAttribute("src","resources/images/loadingicon.gif");
			img.setAttribute("alt","로딩중입니다");
			img.setAttribute("class","mx-auto d-block");
			document.getElementById('fade').appendChild(img);
		}
	
		/* ----------팝업 생성---------- */
		function createPopup(){
			document.getElementById('light').style.display = 'block';
			document.getElementById('content').classList
					.add("blog-single-content");
			document.getElementById('content').innerHTML = "";
		}
		
		/* ----------팝업 창닫기---------- */
		function exitPopup(){
			document.getElementById('light').style.display='none';
			document.getElementById('fade').style.display='none';
		}
		
		/* ----------회원정보수정---------- */
		function editMember() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			
			//로딩창
			createLoading();
			
			//팝업
			createPopup();
			
			//로딩끄기
			document.getElementById('fade').style.display = 'none';
		}
		
		/* ----------재배내역---------- */
		function cultivationHistory() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			//로딩창
			createLoading();
			//팝업
			createPopup();
			
			//표 출력
			var grid = new tui.Grid({
				el : document.getElementById('content'),
				rowHeight : 73,
				rowWidth : 'auto',
				rowHeaders : [ {
					type : 'rowNum',
					width : 80,
					height : 73,
					align : 'center',
					valign : 'bottom'
				} ],//번호 매기기
				scrollX : false,
				scrollY : false,
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
				    sortingType: 'asc'
				} ],
				pageOptions : {
					useClient : true,
					perPage : 5
				}
			});

			$.ajax({
						type : "POST",
						url : "cultivationHistory.do",
						success : function(data) {
							//데이터 입력
							//console.log(data);
							grid.resetData(data);
								
							
							//생성가능여부 가능할때 버튼생성 
							for (var i = 0; i < data.length; i++) {
								if (grid.getValue(i,
										'grow_diary_nft_create_ennc') == 'Y') {
									//console.log(data[i]);
									var growDiary = data[i];
									var input = `<div class="container" style="text-aline:center;">
									<a id=createNft data-no=\${data[i].grow_diary_grow_no} href="javascript:nftGeneration('\${data[i].grow_diary_grow_no}');" class="read-post" style="padding:0 0px 10px 30px; width: 80px; height:30px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">생성가능</a></div>`;
			
									grid.setValue(i,
											'grow_diary_nft_create_ennc',
											input, true);
								} else {
									//console.log("123")
									var input = '생성됨';
									grid.setValue(i,
											'grow_diary_nft_create_ennc',
											input, true);
								}
								}
								document.getElementById('fade').style.display = 'none';


							
						} //success
					});

		}
		/* ----------구매내역---------- */
		function purchaseHistory() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			
			//로딩창
			createLoading();
			
			//팝업
			createPopup();
			
			//로딩끄기
			document.getElementById('fade').style.display = 'none';
		}
		/* ----------농부신청현황---------- */
		function farmerApplicationStatus() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			
			//로딩창
			createLoading();
			
			//팝업
			createPopup();
			
			//로딩끄기
			document.getElementById('fade').style.display = 'none';
		}
		/* ----------회원탈퇴---------- */
		function withdrawal() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			
			//로딩창
			createLoading();
			
			//팝업
			createPopup();
			
			//로딩끄기
			document.getElementById('fade').style.display = 'none';
		}

		function nftGeneration(growDiary) {
			//로딩창
			createLoading();
			//console.log(growDiary);
			$.ajax({
				url : "nftGeneration.do",
				data : {
					"growDiaryNo" : growDiary
				}
			}).done(function(nftNo) {
				console.log(nftNo);
				setTimeout( function(){
					cultivationHistory();
					document.getElementById('fade').style.display = 'none';
					// 일종의 이벤트 리스너가 텍스트 입력값을 취한다:	
					// 우리 컨트랙트의 `createGrowDiaryNft`함수를 호출한다:
					GrowDiary.methods.createGrowDiaryNft(nftNo, '${member.mem_email}')
					.send({from: account, })
					.then(function(result){console.log(result);})	
				},5000);
			});
			

		}

		//=====차트=====
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context, {

			type : 'line', // 차트의 형태 line, pie, bar
			data : { // 차트에 들어갈 데이터

				labels : [ '1', '2', '3', '4', '5', '6', '7' ], //x 축
				datasets : [ { //데이터
					label : '총매출', //차트 제목
					fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data : [ 21, 19, 25, 20, 23, 26, 25 //x축 label에 대응되는 데이터 값
					],
					backgroundColor : [
					//색상
					'rgba(255, 206, 86, 1)' ],
					borderColor : [
					//경계선 색상
					'rgba(255, 206, 86, 1)' ],
					borderWidth : 1
				//경계선 굵기

				}, { //데이터
					label : '키트매출', //차트 제목
					fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data : [ 2, 3, 14, 25, 13, 41, 12 //x축 label에 대응되는 데이터 값
					],
					backgroundColor : [
					//색상
					'rgba(75, 192, 192, 1)', ],
					borderColor : [
					//경계선 색상
					'rgba(75, 192, 192, 1)', ],
					borderWidth : 1
				//경계선 굵기
				} ]

			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>
	
</body>
</html>