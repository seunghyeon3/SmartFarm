<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<head>
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
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
				<div class="row">
					<div class="col-lg-9 col-md-8">
						<h1>그래프 넣을 자리입니다.</h1>
						<div class="blog-thumb">
							<a href="#"><i class="fas fa-link"></i></a> <img
								src="resources/images/causes/cl1.jpg" alt="">
						</div>
						<div class="campaign-txt"></div>

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
						팝업창 <a href="javascript:void(0)"
							onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">Close
						</a> <br> <br>
						<div id="content">123</div>
					</div>
					<div id="123"></div>
					<div id="fade" class="black_overlay"></div>
				</div>
			</div>
		</div>
	</section>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script>
		/* ----------팝업창---------- */
		/* ----------회원정보수정---------- */
		function editMember() {
			document.getElementById('light').style.display = 'block';
			document.getElementById('fade').style.display = 'block';

		}
		/* ----------재배내역---------- */
		function cultivationHistory() {
			document.getElementById('light').style.display = 'block';
			document.getElementById('fade').style.display = 'block';
			document.getElementById('content').classList
					.add("blog-single-content");
			document.getElementById('content').innerHTML = "";

			//표 출력
			var grid = new tui.Grid({
				el : document.getElementById('content'),
				rowHeaders : [ 'rowNum' ],//번호 매기기
				scrollX : false,
				scrollY : false,
				columnOptions : {
					rowHeight : 50
				},
				columns : [ {
					header : '작물이름',
					name : 'plant_name',
					sortingType : 'desc',
					sortable : true
				}, {
					header : '품질',
					name : 'grow_diary_grd',
					filter : 'select'
				}, {
					header : '점수',
					name : 'grow_diary_point',
					filter : 'select',
				}, {
					header : 'NFT생성여부',
					name : 'grow_diary_nft_create_ennc'
				} ],
				columnOptions : {
					resizable : true
				}
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
					if(grid.getValue(i, 'grow_diary_nft_create_ennc') == 'Y'){
							console.log(data[i]);
							var growDiary = data[i];
			                var input = `<div class="container" style="text-aline:center;"><a href="javascript:nftGeneration('\${data[i].grow_diary_grow_no}');" class="read-post" style="padding:0 0px 10px 30px; width: 80px; height:30px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">생성가능</a></div>`;
			                
			                grid.setValue(i, 'grow_diary_nft_create_ennc', input, true);
			          }
			       else{
			    	   console.log("123")
			    	   var input = '생성됨';
		                grid.setValue(i, 'grow_diary_nft_create_ennc', input, true);
			       }
					}
				} //success
			});

		

		}
		/* ----------구매내역---------- */
		function purchaseHistory() {
			document.getElementById('light').style.display = 'block';
			document.getElementById('fade').style.display = 'block';
		}
		/* ----------농부신청현황---------- */
		function farmerApplicationStatus() {
			document.getElementById('light').style.display = 'block';
			document.getElementById('fade').style.display = 'block';
		}
		/* ----------회원탈퇴---------- */
		function withdrawal() {
			document.getElementById('light').style.display = 'block';
			document.getElementById('fade').style.display = 'block';
		}

		function nftGeneration(growDiary) {
			console.log(growDiary);
			$.ajax({
				url : "nftGeneration.do",
				data : {
					"growDiaryNo" : growDiary
				}
			}).done( function(data){
				cultivationHistory();
			});

		}
	</script>
</body>
</html>