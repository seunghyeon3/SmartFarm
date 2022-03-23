<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NFT 보유현황</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
@import
	url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap")
	;

.team-box:after {
	background: none;
}

.team-box .team-info ul {
	opacity: 0.7;
}

}
.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
	opacity: 0.5;
}

.w-btn:hover {
	letter-spacing: 2px;
	transform: scale(1.2);
	cursor: pointer;
	opacity: 0.5;
}

.w-btn:active {
	transform: scale(1.5);
}

@keyframes gradient1 {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}
@keyframes gradient2 {
    0% {
        background-position: 100% 50%;
    }
    50% {
        background-position: 0% 50%;
    }
    100% {
        background-position: 100% 50%;
    }
}
@keyframes ring {
    0% {
        width: 30px;
        height: 30px;
        opacity: 1;
    }
    100% {
        width: 300px;
        height: 300px;
        opacity: 0;
    }
}
.w-btn-neon2 {
    position: relative;
    border: none;
    min-width: 100px;
    min-height: 38px;
    background: linear-gradient(
        90deg,
        rgba(129, 230, 217, 1) 0%,
        rgba(102, 187, 106, 1) 100%
    );
    border-radius: 1000px;
    color: darkslategray;
    cursor: pointer;
    box-shadow: 12px 12px 24px rgba(102, 187, 106, 0.64);
    font-weight: 700;
    transition: 0.3s;
    opacity: 0.5;
}
.w-btn-neon2:hover {
    transform: scale(1.2);
}
.w-btn-neon2:hover::after {
    content: "";
    width: 30px;
    height: 30px;
    border-radius: 100%;
    /* 물 퍼짐 색깔 */
    border: 6px solid #00ffcb;
    position: absolute;
    z-index: -1;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation: ring 1.5s infinite;
}

/* div 드래그 x */
.white_content{
-ms-user-select:none;
-moz-user-select:-moz-none;
-khtml-user-select:none;
-webkit-user-select:none;
user-select:none;
}
</style>
</head>
<body>
	<div class="team-grid team-small-grid p80">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>My NFT</h1>
				</div>
				<!--Team Box Start-->
				<c:if test="${empty nftList}">
						<img src="https://media1.giphy.com/media/l1J9yYblNRmcHXNok/giphy.gif?cid=ecf05e47vzqiqpqp4axb33ff0druao7l8xe339rc7etnf518&rid=giphy.gif&ct=g" alt="사진이 엄서용" style="width: 400px">
						<div class="col-md-1"></div>
						<h3>아직 생성된 NFT가 없습니다~♬</h3>
				</c:if>
				<c:forEach items="${nftList }" var="nft">
					<!--Team Box Start-->
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="team-box">
							<img src="../upload/${nft.nft_img }" alt="">
							<div class="team-info" style="padding-top: 60px;">
								<ul class="w-btn-neon2">
									<li><a href="javascript:void(0)"
										onclick="pointCheck('${nft.grow_diary_grd }')">점수</a></li>
									<li><a href="javascript:void(0)" onclick="growDiary('${nft.grow_diary_log_rou }')">일지</a></li>
									<li><a href="aucnInsertForm.do?nftNo=${nft.nft_no}">경매</a></li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
				<!--Team Box End-->
				<div id="light" class="col-md-12 white_content">
					 <a href="javascript:void(0)" onclick="exitPopup()"
						onkeyup="escExit(event)" style="float: right">Close </a> <br>
					<br>
					<div id="content">123</div>
				</div>
				<div id="123"></div>
				<div id="fade" class="black_overlay"></div>
			</div>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
		integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
		crossorigin="anonymous" referrerpolicy="no-referrer">
		
	</script>

	<script>
		/* ----------팝업 로딩종료---------- */
		function exitLoading(){
			document.getElementById('fade').innerHTML = "";
			document.getElementById('fade').style.zIndex= 0;
		}
		/* ----------팝업 로딩생성---------- */
		function createLoading() {
			document.getElementById('fade').style.display = 'block';
			document.getElementById('fade').innerHTML = "";
			document.getElementById('fade').classList.add("loading");
			var img = document.createElement("img");
			img.setAttribute("src", "resources/images/loadingicon.gif");
			img.setAttribute("alt", "로딩중입니다");
			img.setAttribute("class", "mx-auto d-block");
			document.getElementById('fade').appendChild(img);
		}

		/* ----------팝업 생성---------- */
		function createPopup() {
			document.getElementById('light').style.display = 'block';
			document.getElementById('content').classList
					.add("blog-single-content");
			//document.getElementById('content').innerHTML = "";
		}

		/* ----------팝업 창닫기---------- */
		function exitPopup() {
			document.getElementById('light').style.display = 'none';
			document.getElementById('fade').style.display = 'none';
		}

		toastr.options.positionClass = "toast-top-center";
		function pointCheck(nftGrd) {
			// 작물 점수
			console.log(nftGrd.parentNode);

			toastr.info("해당 NFT의 등급은 " + nftGrd + " 등급입니다");
		}

		function growDiary(rou) {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0, 0);

			//로딩창
			createLoading();

			//팝업
			createPopup();
	
			//로딩끄기
			exitLoading();
			
			$.ajax({
			url: 'diaryBody.do',
			type: 'post',
			data: {"route" : rou },
			success: function(result) {
	        	console.log(result);
				$("#content").empty();
				for(i=0; i<result.length; i++) {
					$("#content").append("<li>" + result[i] + "</li>")
				}
				
			}
		})	
			
		}
	</script>
</body>
</html>