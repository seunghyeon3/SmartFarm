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
	float: right;
	text-align: right;
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
</style>
</head>
<body>
	<section class="wf100 p80 team">
		<div class="team-details">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<img src="resources/nft/merge/${aucnSelect.nft_img }" alt="">
						<br> <strong class="trank">${aucnSelect.kit_prpos }
							${aucnSelect.kit_plant_name } NFT</strong>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-3">
						<strong class="trank aucnTitle">&lt; 제목 &gt;</strong>
						<div id="aucnTitle">${aucnSelect.aucn_title }</div>
						<br> <strong class="trank aucnCon">&lt; 내용 &gt;</strong>
						<div id="aucnCon">${aucnSelect.aucn_con }</div>
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
								<strong>최저 입찰 가격 : ${aucnSelect.first_bid } eth</strong>
							</div>
							<div class="share-post wf100">
								<input id="aucnBidWindow" rows="3" cols="20"
									readonly="readonly"/>
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
					<div id="light" class="col-md-12 white_content">
						팝업창 <a href="javascript:void(0)" onclick="exitPopup()"
							onkeyup="escExit(event)" style="float: right">Close </a> <br>
						<br>
						<div id="content"></div>
						<textarea id="popupBidWindow" rows="3" cols="20"
							readonly="readonly"></textarea>
						<!-- 	<input id="inputMessage" type="text" /> <input
									type="submit" value="send" onclick="send()" /> -->
						<input type="number" step="0.1" min="0"
							oninput="countCheck(this.val)" id="inputMessage" size="30"
							onkeypress="if(event.keyCode==13){webSocketSendChat();}"
							placeholder="입찰금액입력" /> <input type="button" id="btnSend"
							value="입찰하기" onclick="webSocketSendChat()" />
					</div>

					<div id="123"></div>
					<div id="fade" class="black_overlay"></div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript" src="resources/js/countdown.js"></script>

	<!-- 웹소켓 기능 -->
	<script>
		var aucnBidWindow = document.getElementById("aucnBidWindow");
		var popupBidWindow = document.getElementById("popupBidWindow"); 
		//일반경로 localhost 
		//var webSocket = new WebSocket('ws://localhost/prj/websocket/broadcast.do');
		//ip경로 다중 경로 테스트할 시 ip 주소로 테스트
		var webSocket = new WebSocket('ws://192.168.0.35/prj/websocket/broadcast.do');
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
				aucnBidWindow.innerHTML = "";
				aucnBidWindow.value = "현재 최고 금액 : " + event.data + " eth";
				aucnBidWindow.setAttribute('data-bid', event.data);
				popupBidWindow.innerHTML = "";
				popupBidWindow.value = "현재 최고 금액 : " + event.data + " eth";
				popupBidWindow.setAttribute('data-bid', event.data);
		}
		function onOpen(event) {
			//현재 최고금액 뿌려주기 
			aucnBidWindow.value = "연결 성공\n";
			popupBidWindow.value = "연결 성공\n"; 
		}
		function onError(event) {
			console.log(event); 
			alert(event.data); 
		}
		function webSocketSendChat() {
			//aucnBidWindow.value = "현재 최고 금액 : " + inputBid.value + " eth";
			//popupBidWindow.value = "현재 최고 금액 : " + inputBid.value + " eth";
			// 입찰하기 버튼이나 엔터 누를시 소켓 서버로 입력값을 던짐
			webSocket.send(inputBid.value); 
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
	/* ----------팝업 로딩생성---------- */
	function createLoading(){
		document.getElementById('fade').style.display = 'block';
		document.getElementById('fade').innerHTML = "";
		document.getElementById('fade').classList.add("loading");
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
	
		// 경매 남은 시간 카운트다운
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
		
		// 경매 남은 시간이 경과되었을때 입찰하기를 눌렀을때 경매 메인페이지로 돌려보내기 
		 function aucnTimeCheck(aucnNo){
	    	  var countdownId = "countdown"+aucnNo ;
	    	  var countdownDisable = document.getElementById(countdownId);
	    	  console.log(countdownDisable);
	    	  console.log(countdownDisable.innerText)
	    	   if(countdownDisable.innerText == "경매가 종료되었습니다."){
	    		   alert("좀만 더 빨리 누르지.. 수고~ ^^");
	    		  location.href="aucnMain.do";
	    		   //toastr.warning('좀만 더 빨리 누르지.. 수고~ ^^');
	    	  }
	    	  else {
	    		  // 입찰할 수 있는 함수호출 (정상 실행)
	    		  aucnBid();
	    		  
	    	  } 
	      }
			function aucnBid() {
				//클릭시 페이지 최상단으로 이동.
				window.scrollTo(0,0);
				
				//로딩창
				createLoading();
				
				//팝업
				createPopup();
				
				//로딩끄기
				document.getElementById('fade').style.display = 'none';
				
				function send(){
					 // 서버로 전송할 데이터를 담을 msg 객체 생성.
					 var msg ={
					 cmd: "message",
					 tmsg: document.getElementById("inputMessage").value,
					 id: "로그인계정"
					 };
					 // Send the msg object as a JSON-formatted string.
					 webSocket.send(JSON.stringify(msg));
					 
					 // Blank the text input element, ready to receive the next line of text from the user.
					 document.getElementById("inputMessae").value ="";
					}
			}
			
			//입력값과 최고가 비교하는 함수
			function countCheck(e) {
				var inputAucnBid = parseInt(document.getElementById('inputMessage').value);
				var aucnBid = parseInt(document.getElementById('aucnBidWindow').dataset.bid);
				//console.log(typeof(aucnBid));
				//지갑잔고
				if(aucnBid > inputAucnBid){
				console.log('좀더 질러봐');
				return false;
				}else{
				console.log('좋은 금액입니다.')
				return true;
				}
			}
	</script>
</body>
</html>