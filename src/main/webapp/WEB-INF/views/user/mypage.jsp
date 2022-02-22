<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<head>
<title>마이페이지</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
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
									<li><a href="javascript:void(0)" onclick="cultivationHistory()">재배내역</a></li>
									<li><a href="javascript:void(0)" onclick="purchaseHistory()">구매내역</a></li>
									<li><a href="javascript:void(0)" onclick="farmerApplicationStatus()">농부신청현황</a></li>
									<li><a href="#">NFT보유현황</a></li>
									<li><a href="javascript:void(0)" onclick="withdrawal()">회원탈퇴</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div id="light" class="col-md-12 white_content">
						팝업창 <a href="javascript:void(0)"
							onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">Close
						</a> <br> <br>
						<div id="content" >
						123
						</div>
					</div>
					<div id="123"></div>
					<div id="fade" class="black_overlay"></div>
				</div>
			</div>
		</div>
	</section>
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
			document.getElementById('content').classList.add("blog-single-content");
			document.getElementById('content').innerHTML = "";
			
/* 			$.ajax({
				type : "POST",
				url : "",
				success : function(data){

					document.getElementById('content').innerHTML = "";

				}
				}); */
				
            var table = $('<table>').attr('id', 'mytab').addClass('GeneratedTable');
            var thead = $('<thead>').append( //
            $('<tr>').append( //
					$('<th>').text('작물명'), //
					$('<th>').text('품질'), //
					$('<th>').text('점수'),
					$('<th>').text('NFT생성가능여부'),
            ) //
            );
            var tbody = $('<tbody>');
            	var tr = $('<tr>');
            	tr.append(//
            	$('<td>').text('1').attr('style', "display:none;"),//
            	$('<td>').text('샤인머스켓'),//
            	$('<td>').text('상'),//
            	$('<td>').text('92'),
            //if() 아작스로 떙겨온 NFT생성여부가 Y일시 버튼 활성화 아닐시 이미 생성되었다고 문구 남기기	
            	$('<td class="comment-form">').append('<button class="post-btn" onclick="nftGeneration()">생성 가능</button>')            	
            	);
            	tbody.append(tr);
            	
            
            table.append(thead);
            table.append(tbody);
			$('#content').append(table);

			
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
		
		function nftGeneration(){
			console.log("nft생성")
			$.ajax({
				url : "nftGeneration.do",
				success : function(){
					console.log("nft생성");
				}
				});
			
		}
	</script>

</body>
</html>