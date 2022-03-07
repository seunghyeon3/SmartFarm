package co.smartFarm.auction.aucnWeb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import co.smartFarm.auction.aucnService.AucnService;
import co.smartFarm.auction.aucnService.AucnVO;

//@ServerEndPoint

public class SocketHandler extends TextWebSocketHandler implements InitializingBean { 
	
	private final Logger logger = LogManager.getLogger(getClass());
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>(); 
	
	
	
	@Autowired
	private AucnService aucnDao; 
	
	public SocketHandler (){ 
		super();
		this.logger.info("create SocketHandler instance!"); 
	} 
	
	@Override 
	//onClose
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { 
		super.afterConnectionClosed(session, status); 
		System.out.println("나가는중");
		sessionList.remove(session);
		this.logger.info("remove session!"); 
	} 
	
	@Override
	//onOpen 
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
			super.afterConnectionEstablished(session); 
			System.out.println(session.getAttributes());
			System.out.println(session.toString());
			sessionList.add(session);
			this.logger.info("add session!");
			
//			for (WebSocketSession s : sessionList) {
//				// DB셀렉해서 현재최고금액을 뿌림 
//				int aucnBid = 1;
//				s.sendMessage(new TextMessage(""+aucnBid+""));
//			}
			
		} 
	@Override
	//onMessage 
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception { 
		super.handleMessage(session, message); 

		JSONObject json2Obj = new JSONObject(message.getPayload().toString());
			int aucnNo = json2Obj.getInt("aucn");
			Double bid = json2Obj.getDouble("bid");
			String id = json2Obj.getString("id");
			//json 받아오면 get 으로 키꺼내고 넣기
			AucnVO aucn = new AucnVO();
			aucn.setAucn_no(aucnNo);
			aucn.setNow_bid(bid);
			aucn.setNow_bid_mem_email(id);
			aucnDao.aucnBid(aucn);
			
			//this.logger.info("receive message:"+message.toString()); //json string을 vo로 변환
			String sendBid = bid.toString()+Integer.toString(aucnNo);
			// 다시 실시간 채팅화면으로 메세지를 던져줌 던질때는 String 형식으로 보냄
			sendMessage(sendBid);
		
		
	} 
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception { this.logger.error("web socket error!", exception); } @Override
	public boolean supportsPartialMessages() { 
		this.logger.info("call method!"); 
		return super.supportsPartialMessages(); 
	} 
	public void sendMessage (String message){ 
		for (WebSocketSession session: this.sessionList){ 
			if (session.isOpen()){ 
				try{ 
					session.sendMessage(new TextMessage(message));
				}catch (Exception ignored){ 
					this.logger.error("fail to send message!", ignored); 
				} 
			} 
		} 
	} 
	@Override
	public void afterPropertiesSet() throws Exception { 
			Thread thread = new Thread(){ 
					int i=0;
	 
					@Override
					
					public void run() {
						while (true){
							try {
								sendMessage ("send message index "+i++);
								Thread.sleep(1000);
								}catch (InterruptedException e) {
									e.printStackTrace();
										break; 
								} 
						} 
					} 
			}; 
			//thread.start(); 
	} 
}