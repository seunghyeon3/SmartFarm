<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aucn detail</title>
<style>
.team-details-txt{
	float : right;
	text-align : right;
	padding-right : 30px;
}
.col-md-3{
	float : center;
	text-align : center;
}
.aucnTitle{
	border: 5pt groove #3f51b5;
}
.aucnCon{
	border: 5pt groove #3f51b5;
}
#aucnCon{
	word-break:break-all;
	text-overflow:ellipsis;
}
.countdown{
    text-align: center;
    display: inline-block;
    text-shadow: 0 0 20px rgba(10, 175, 230, 1),  0 0 20px rgba(10, 175, 230, 0);
}
.day, .hour, .min, .sec {
	display: inline-block;
	padding : 0 10px;
	border-radius: 10%;
}
.num {
     letter-spacing: 0.05em;
        font-size: 30px;
        padding: 5px 0;
}
.word {
        letter-spacing: 0.1em;
        font-size: 24px;
}
</style>
</head>
<body>
	<section class="wf100 p80 team">
		<div class="team-details">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<img src="resources/nft/merge/${aucnSelect.nft_img }" alt="">
						<br>
						<strong class="trank">${aucnSelect.kit_prpos } ${aucnSelect.kit_plant_name } NFT</strong>
					</div>
					<div class="col-md-1">
					</div>
					<div class="col-md-3">
						<strong class="trank aucnTitle">&lt; 제목 &gt;</strong>
						<div id ="aucnTitle">${aucnSelect.aucn_title }</div>
						<br>
						<strong class="trank aucnCon">&lt; 내용 &gt;</strong>
						<div id ="aucnCon">${aucnSelect.aucn_con }</div>
					</div>
					<div class="col-md-5">
						<div class="team-details-txt">
							<strong class="trank auctionTime">입찰 남은 시간</strong>
							<fmt:parseDate value="${aucnSelect.aucn_start_time}" var="DetailStart"
								pattern="yyyy-MM-dd HH:mm" />
							<%-- <fmt:formatDate value="${aucnStart }" var="aucnStartTime" pattern="yyyy-MM-dd" />  --%>
							<jsp:useBean id="DetailStartTime" class="java.util.Date" />
							<jsp:setProperty name="DetailStartTime" property="time"
								value="${DetailStart.time + 86400000}" />
							<fmt:formatDate value="${DetailStartTime }" var="DetailEnd"
								pattern="yyyy-MM-dd" />
							<div class="countdown" id="countdown${aucnSelect.aucn_no }"
								data-date="${DetailEnd }"
								data-time="${aucnSelect.aucn_start_time.substring(aucnSelect.aucn_start_time.length()-5,aucnSelect.aucn_start_time.length())}">
								<div class="day" style="display: none">
									<span class="num"></span><span class="word"></span>
								</div>
								<div class="hour">
									<span class="num"></span><span class="word"></span>
								</div>
								<div class="min">
									<span class="num"></span><span class="word"></span>
								</div>
								<div class="sec">
									<span class="num"></span><span class="word"></span>
								</div>
								
							</div>
							<br><br>
							
							<div class="share-post wf100">
								<strong>최저 입찰 가격 : ${aucnSelect.first_bid } eth</strong> 
							</div>
							<div class="share-post wf100">
								<strong>현재 최고 입찰가 : ${aucnSelect.now_bid } eth</strong> 
							</div>
							<div>
							<a href="#" class="contact-team">입찰하기</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript" src="resources/js/countdown.js"></script>
	<script>
		var countAucn = document.querySelectorAll('.countdown');

		var efcc_countdown = {}
		console.log(countAucn[0].attributes[1].textContent);

		console.log(test);
		for (var i = 0; i < countAucn.length; i++) {
			var test = "#" + countAucn[i].attributes[1].textContent
			efcc_countdown = new countdown({
				target : test,
				dayWord : ' 일',
				hourWord : ' 시간',
				minWord : ' 분',
				secWord : ' 초'
			});
		}
	</script>
</body>
</html>