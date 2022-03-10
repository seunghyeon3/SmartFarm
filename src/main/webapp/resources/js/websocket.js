
function doWebsocket(data, url){


	var aucnBidWindow = document.getElementById("aucnBidWindow");
		var popupBidWindow = document.getElementById("popupBidWindow"); 
		var webSocket = new WebSocket('ws://localhost/prj/websocket/broadcast.do');
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
		if(url.indexOf("aucnDetail") > 0){
				var location = event.data.indexOf('.');
				var cutAucnNo = event.data.substring(location+2, event.data.length);
				var cutBid = event.data.substring(0,location+2);
				var modelAucnNo = data.aucn_no
				if(cutAucnNo == modelAucnNo.toString())
				{
				aucnBidWindow.innerHTML = "";
				aucnBidWindow.value = "현재 최고 금액 : " + cutBid + " eth";
				aucnBidWindow.setAttribute('data-bid', cutBid);
				popupBidWindow.innerHTML = "";
				popupBidWindow.value = "현재 최고 금액 : " + cutBid + " eth";
				popupBidWindow.setAttribute('data-bid', cutBid);
				}
			}
		}
		function onOpen(event) {
			//현재 최고금액 뿌려주기 
			aucnBidWindow.value = "현재 최고 금액 : "+data.now_bid+"eth";
			popupBidWindow.value = "현재 최고 금액 : "+data.now_bid+" eth"; 
			popupBidWindow.setAttribute('data-bid', data.now_bid);
		}
		function onError(event) {
			console.log(event); 
			alert(event.data);
		}
		function webSocketSendChat() {
			// 입찰하기 버튼이나 엔터 누를시 소켓 서버로 입력값을 던짐
			
 			var inputBid ={
					 bid: document.getElementById("inputMessage").value,
					 id: '${member.mem_email}',
					 aucn: '${aucnSelect.aucn_no }'
					 };
			webSocket.send(JSON.stringify(inputBid)); 
			inputBid.value = ""; 
			
			
		}
}