<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aucn detail</title>
<style>
.team-details-txt {
	float: center;
	text-align: center;
	padding-right: 30px;
}

.col-md-3 {
	float: center;
	text-align: center;
}

.aucnTitle {
	border: 5pt groove #3f51b5;
}

.aucnCon {
	border: 5pt groove #3f51b5;
}

#aucnCon {
	word-break: break-all;
	text-overflow: ellipsis;
}

.countdown {
	text-align: center;
	display: inline-block;
	text-shadow: 0 0 20px rgba(10, 175, 230, 1), 0 0 20px
		rgba(10, 175, 230, 0);
}

.day, .hour, .min, .sec {
	display: inline-block;
	padding: 0 10px;
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

.white_content {
	background-color: #222222;
	background: repeating-linear-gradient(45deg, #2b2b2b 0%, #2b2b2b 10%, #222222 0%,
		#222222 50%) 0/15px 15px;
}

.neonText {
	text-align: center;
	font-size: 7em;
	margin-bottom: 0;
	margin-top: 0;
	line-height: 1;
	text-decoration: none;
	color: #fff;
	font-family: "Press Start 2P";
	animation: neon 3.5s ease-in-out infinite alternate;
}

@keyframes neon {from { text-shadow:0010px#fff, 0020px#fff, 0030px#fff, 0040px#b6ff00,
	0070px#b6ff00, 0080px#b6ff00, 00100px#b6ff00, 00150px#b6ff00;
	
}

to {
	text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px
		#b6ff00, 0 0 35px #b6ff00, 0 0 40px #b6ff00, 0 0 50px #b6ff00, 0 0
		75px #b6ff00;
}

}

.button{
  position:relative;
  display:inline-block;
  margin:20px;
}

.button a{
  color:white;
  font-family:Helvetica, sans-serif;
  font-weight:bold;
  font-size:36px;
  text-align: center;
  text-decoration:none;
  background-color:#FFA12B;
  display:block;
  position:relative;
  padding:20px 40px;
  
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  text-shadow: 0px 1px 0px #000;
  filter: dropshadow(color=#000, offx=0px, offy=1px);
  
  -webkit-box-shadow:inset 0 1px 0 #FFE5C4, 0 10px 0 #915100;
  -moz-box-shadow:inset 0 1px 0 #FFE5C4, 0 10px 0 #915100;
  box-shadow:inset 0 1px 0 #FFE5C4, 0 10px 0 #915100;
  
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
}

.button a:active{
  top:10px;
  background-color:#F78900;
  
  -webkit-box-shadow:inset 0 1px 0 #FFE5C4, inset 0 -3px 0 #915100;
  -moz-box-shadow:inset 0 1px 0 #FFE5C4, inset 0 -3pxpx 0 #915100;
  box-shadow:inset 0 1px 0 #FFE5C4, inset 0 -3px 0 #915100;
}

.button:after{
  content:"";
  height:100%;
  width:100%;
  padding:4px;
  position: absolute;
  bottom:-15px;
  left:-}

input{
border-radius: 15px;
}  
  
</style>
</head>
<body>
	<section class="wf100 p80 team">
		<div class="team-details">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<img src="../upload/${aucnSelect.nft_img }" alt="">
						<br> <strong class="trank">${aucnSelect.kit_prpos }
							${aucnSelect.kit_plant_name } NFT</strong>
					</div>
					<div class="col-md-5">
						<div class="team-details-txt">
							<strong class="trank auctionTime">입찰 남은 시간</strong>
							<div class="countdown" id="countdown${aucnSelect.aucn_no }"
								data-date="${aucnSelect.aucn_start_time.substring(0,10) }"
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
							<br> <br>

							<div class="share-post wf100">
								<strong style="height: 66px; font-size: 18pt;">최저 입찰 가격 : ${aucnSelect.first_bid } wei</strong>
							</div>
							<div class="share-post wf100">
								<input id="aucnBidWindow" style="height: 66px; font-size: 18pt; text-align:center;" readonly="readonly" />
							</div>
							<div>
								<a href="javascript:void(0)"
									onclick="aucnTimeCheck(${aucnSelect.aucn_no})"
									class="contact-team">입찰하기</a>
							</div>
							<fieldset>

								<br />
							</fieldset>
						</div>
					</div>
						<div class="col-md-3">
						<strong class="trank" style="border-bottom:3px solid black; text-align:left; margin-bottom:20px; font-size:1.5em">${aucnSelect.aucn_title }</strong>
						<p style="text-align:left">${aucnSelect.aucn_con }</p>
						</div>
						<div class="col-md-12" style="margin-top:50px;">
							※ 입찰버튼을 누르고 wei를 입력 후 입찰버튼을 누르면 입찰이 완료됩니다. ※<br>
							※ 혹여나 현재 최고 금액이 보이지 않을 경우 새로고침을 해주세요. ※<br>
							<span style="color:#e11f3e">※ 경매에 참여하였지만 낙찰 받지 못한 경우 마이페이지에서 입찰현황을 확인하여 출금해주세요!! ※</span>
						</div>
					<div id="light" class="col-md-12 white_content">
						 <a href="javascript:void(0)" onclick="exitPopup()"
							onkeyup="escExit(event)" style="position: fixed; right:28.5%">Close </a> <br>
						<br>
						<div id="content">
							<div class="col-md-12" style="text-align: center;">
								<h1 class="neonText">NFT</h1>
								<h1 class="neonText">AUCTION</h1>
							</div>
							<br>
							<br>
							<br>
							<br>
							<div class="col-md-12" style="text-align: center;">
								<input id="popupBidWindow" readonly="readonly"
									style="height: 66px; font-size: 18pt; text-align:center;" /> <input type="number"
									min="0" id="inputMessage" size="30"
									onkeypress="if(event.keyCode==13){countCheck();}"
									placeholder="입찰금액입력" style="height: 66px; font-size: 18pt; text-align:center;" /> <br>
								<br>
								<div onclick="countCheck()" class="button">
									<a href="javascript:void(0)">입찰하기</a>
								</div>
							</div>
						</div>

					</div>

					<div id="123"></div>
					<div id="fade" class="black_overlay"></div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript" src="resources/js/countdown.js"></script>
    <script
		src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js">
	</script>
	<script src="resources/js/NFTAuction.js"></script>
	<!-- 웹소켓 기능 -->
	<!-- 220310 PSH websocket.js로 이동 -->
	 <script>
		//일반경로 localhost 
		//var webSocket = new WebSocket('ws://localhost/prj/websocket/broadcast.do');
		//ip경로 다중 경로 테스트할 시 ip 주소로 테스트
		//var webSocket = new WebSocket('ws://192.168.0.11/prj/websocket/broadcast.do');
		var aucnBidWindow = document.getElementById("aucnBidWindow");
		var popupBidWindow = document.getElementById("popupBidWindow"); 
		var btnSend = document.getElementById('btnSend'); 
		var inputBid = document.getElementById('inputMessage'); 
		
		webSocket.onerror = function(event) {
			onError(event) 
		};
		webSocket.onopen = function(event) {
			onOpen(event) 
		}; 
		webSocket.onmessage = function(event) {
			onMessage(event) 
		};
		
		function onMessage(event) {
			var aucnEventData = JSON.parse(event.data);
			var modelAucnNo = ${aucnSelect.aucn_no } ;
			console.log(aucnEventData.aucnNo);
			console.log(modelAucnNo.toString());
			if(aucnEventData.aucnNo == modelAucnNo.toString())
			{
			aucnBidWindow.innerHTML = "";
			aucnBidWindow.value = "현재 최고 금액 : " + aucnEventData.bid + " wei";
			aucnBidWindow.setAttribute('data-bid', aucnEventData.bid);
			popupBidWindow.innerHTML = "";
			popupBidWindow.value = "현재 최고 금액 : " + aucnEventData.bid + " wei";
			popupBidWindow.setAttribute('data-bid', aucnEventData.bid);
			}
			console.log(aucnEventData.bid);
			
		}
		
		function onOpen(event) {
			//현재 최고금액 뿌려주기 
			aucnBidWindow.value = "현재 최고 금액 : ${aucnSelect.now_bid } wei";
			popupBidWindow.value = "현재 최고 금액 : ${aucnSelect.now_bid } wei"; 
			popupBidWindow.setAttribute('data-bid', ${aucnSelect.now_bid });
		}
		function onError(event) {
			console.log(event); 
			alert(event.data); 
		}
		
		function webSocketSendChat(inputBid) {
			// 입찰하기 버튼이나 엔터 누를시 소켓 서버로 입력값을 던짐

			webSocket.send(JSON.stringify(inputBid)); 
			inputBid.value = ""; 

			}

		/* function chatAreaScroll() {
		//using jquery
		var textArea = $('#messageWindow');
		textArea.scrollTop( textArea[0].scrollHeight - textArea.height() );
		textArea.scrollTop( textArea[0].scrollHeight);
		
		//using javascript
		var textarea = document.getElementById('messageWindow');
		textarea.scrollTop = textarea.scrollHeight;
		} */
	</script> 

	<script>
	/* 웹소켓 테스트 */
/* 	var websocketData =  
	{ aucn_no : '${aucnSelect.aucn_no}',
	  now_bid : '${aucnSelect.now_bid}'
	};
	
	console.log("test"+websocketData);
	
	doWebsocket( websocketData , "${pageContext.request.contextPath}"); */
	
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
		document.getElementById('fade').style.zIndex= 1005;
	}

	/* ----------팝업 생성---------- */
	function createPopup(){
		document.getElementById('light').style.display = 'block';
		document.getElementById('content').classList
				.add("blog-single-content");
	}
	
	/* ----------팝업 창닫기---------- */
	function exitPopup(){
		document.getElementById('light').style.display='none';
		document.getElementById('fade').style.display='none';
	}
	
	/* ----------팝업 로딩종료---------- */
	function exitLoading(){
		document.getElementById('fade').innerHTML = "";
		document.getElementById('fade').style.zIndex= 0;
	}
	
		// 경매 남은 시간 카운트다운
		var countAucn = document.querySelectorAll('.countdown');

		var efcc_countdown = {}

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
		
		// 경매 남은 시간이 경과되었을때 입찰하기를 눌렀을때 경매 메인페이지로 돌려보내기 
		 function aucnTimeCheck(aucnNo){
			
	    	  var countdownId = "countdown"+aucnNo ;
	    	  var countdownDisable = document.getElementById(countdownId);
	    	  console.log(countdownDisable);
	    	  console.log(countdownDisable.innerText)
	    	   if(countdownDisable.innerText == "경매가 종료되었습니다."){
	    		   alert("이미 종료된 경매입니다.");
	    		  location.href="aucnMain.do";
	    	  }
	    	  else {
	    		  metaMaskCheck();
	    	  } 
	      }
		
		/* ---------- 메타마스크 로그인 체크 --------- */
		function metaMaskCheck(){
			//메타마스크 로그인체크
			web3.eth.getAccounts(function(err,accs){
	             if(err != null){
	                 alert('There was an error fetching your accounts.')
	             }else if(accs.length ===0){
	                 alert("재배내역 서비스를 이용하기 위해선 메타마스크 연결이 필요합니다.")
	             }else{
	             account = accs[0];
	             aucnBid();
	             }
	         }) 
		}
		
		/* ---------- 입찰 팝업 --------- */
		 function aucnBid() {
				//클릭시 페이지 최상단으로 이동.
				window.scrollTo(0,0);
				
				//로딩창
				createLoading();
				
				//팝업
				createPopup();
				
				//로딩끄기
				exitLoading();
				
				//메타마스크 로그인체크
				web3.eth.getAccounts(function(err,accs){
		             if(err != null){
		                 alert('There was an error fetching your accounts.')
		                 exitPopup();
		                 return
		             }
		             if(accs.length ===0){
		                 alert("입찰을 위해 메타마스크 로그인을 해주세요")
		                 exitPopup();
		                 return
		             }
		             account = accs[0];
		         }) 
/* 				function send(){
					 // 서버로 전송할 데이터를 담을 msg 객체 생성.
					 var msg ={
					 cmd: "message",
					 tmsg: document.getElementById("inputMessage").value,
					 id: '${member.mem_email}',
					 aucn: '${aucnSelect.aucn_no }'
					 };
					 // Send the msg object as a JSON-formatted string.
					 webSocket.send(JSON.stringify(msg));
					 
					 // Blank the text input element, ready to receive the next line of text from the user.
					 document.getElementById("inputMessae").value ="";
					} */
			}
		 
			//입력값과 최고가 비교하는 함수
			function countCheck() {
				var inputAucnBid = parseInt(document.getElementById('inputMessage').value);
				var aucnBid = parseInt(document.getElementById('popupBidWindow').dataset.bid);

				if(aucnBid >= inputAucnBid){
					alert("현재 최고 금액보다 높게 지정하세요.");
					toastr.error("현재 최고 금액보다 높게 지정하세요.");
				return false;
				}else if(isNaN(inputAucnBid)==true){
					alert("금액을 입력하세요.");
					toastr.error("금액을 입력하세요.");
				}else{
					createLoading();
					
					NFTAuction.methods.bid(${aucnSelect.aucn_no })
					.send({from: account, value: inputAucnBid})
					.then(async function(result){
						
						console.log(result);
						//nft 입찰 웹소켓 전송
						var inputBid ={
							 bid: document.getElementById("inputMessage").value,
							 id: '${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}',
							 aucn: '${aucnSelect.aucn_no }'
						};
						await webSocketSendChat(inputBid);
						await exitLoading(); 
						alert('입찰에 성공하였습니다.');
					});
					
					
					

				}
			}
	</script>
</body>
</html>