var webSocket = new WebSocket('ws://localhost/prj/websocket/broadcast.do');



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
				var modelAucnNo = data.aucn_no
				console.log(aucnEventData.aucnNo);
				console.log(modelAucnNo.toString());
				if(aucnEventData.aucnNo == modelAucnNo.toString())
				{
				aucnBidWindow.innerHTML = "";
				aucnBidWindow.value = "현재 최고 금액 : " + aucnEventData.bid + " eth";
				aucnBidWindow.setAttribute('data-bid', aucnEventData.bid);
				popupBidWindow.innerHTML = "";
				popupBidWindow.value = "현재 최고 금액 : " + aucnEventData.bid + " eth";
				popupBidWindow.setAttribute('data-bid', aucnEventData.bid);
				}
				console.log(aucnEventData.bid);
		}
		function onOpen(event) {
			//현재 최고금액 뿌려주기 
			aucnBidWindow.value = "현재 최고 금액 : "+data.now_bid+" eth";
			popupBidWindow.value = "현재 최고 금액 : "+data.now_bid+" eth"; 
			popupBidWindow.setAttribute('data-bid', data.now_bid);
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
