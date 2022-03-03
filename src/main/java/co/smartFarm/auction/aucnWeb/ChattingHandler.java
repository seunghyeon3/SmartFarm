package co.smartFarm.auction.aucnWeb;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//import lombok.extern.log4j.Log4j;

//@Log4j
@Component
public class ChattingHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		//log.info("#ChattingHandler, afterConnectionEstablished");
		sessionList.add(session);
		// 모든 세션에 채팅 전달
		for (WebSocketSession s : sessionList) {
			// DB셀렉해서 현재최고금액을 뿌림 
			int aucnBid = 1;
			s.sendMessage(new TextMessage(""+aucnBid+""));
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//log.info("#ChattingHandler, handleMessage");
		// 입찰하기 팝업에서 input 형식으로 숫자를 넘김
		//log.info("현재 최고 금액 : " + message);
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//log.info("#ChattinHandler, afterConnectionClosed");
		sessionList.remove(session);
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage("경매를 할 수 없습니다."));
		}
		//log.info("경매를 할 수 없습니다.");
	}
}

