package co.smartFarm.prj;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import co.smartFarm.auction.aucnService.AucnService;
import co.smartFarm.auction.aucnService.AucnVO;
import co.smartFarm.auction.aucnWeb.AucnController;
import co.smartFarm.user.memberService.MemberVO;

//@ServerEndPoint

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {

	private final Logger logger = LogManager.getLogger(getClass());

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// 220308 websocket 실시간 알림을 위해 user 정보 넣어두는 곳
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();

	@Autowired
	AucnController aucnDa;

	@Autowired
	private AucnService aucnDao;

	public SocketHandler() {
		super();
		this.logger.info("create SocketHandler instance!");
	}

	@Override
	// onClose
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		System.out.println("나가는중");
		sessionList.remove(session);
		this.logger.info("remove session!");
	}

	@Override
	// onOpen
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		System.out.println(session.getAttributes());
		System.out.println(session.toString());
		sessionList.add(session);
		//String user = getEmail(session);
		/*
		 * if (user != null) { userSessionsMap.put(user, session); }
		 */

		//this.logger.info("add session!");

//			for (WebSocketSession s : sessionList) {
//				// DB셀렉해서 현재최고금액을 뿌림 
//				int aucnBid = 1;
//				s.sendMessage(new TextMessage(""+aucnBid+""));
//			}

	}

	@Override
	// onMessage
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		System.out.println(message.getPayload().toString());
		//String user = getEmail(session);
		JSONObject json2Obj = new JSONObject(message.getPayload().toString());
		int aucnNo = json2Obj.getInt("aucn");
		int bid = json2Obj.getInt("bid");
		String id = json2Obj.getString("id");

		// json 받아오면 get 으로 키꺼내고 프로시저 aucn_bid를 실행해서 최고입찰가 업데이트
		AucnVO aucn = new AucnVO();
		aucn.setAucn_no(aucnNo);
		aucn.setNow_bid(bid);
		aucn.setNow_bid_mem_email(id);
		aucnDao.aucnBid(aucn);

		JSONObject sendBidJson = new JSONObject();
		sendBidJson.put("bid", bid);
		sendBidJson.put("aucnNo", aucnNo);
		// 다시 실시간 채팅화면으로 메세지를 던져줌 던질때는 String 형식으로 보냄
		sendMessage(sendBidJson.toString());

		// 솔리디티 넣어주기
		JSONObject jsonInput = new JSONObject();
		JSONArray data = new JSONArray();
		
		// 경매번호 10진수에서 16진수로 변환
		String hexAucnNo = Integer.toHexString(aucnNo);
		
		String zero = "";
		
		for (int i = 0; i < 64 - hexAucnNo.length(); i++) {
			zero = zero + "0";
		}
		
 		String paramAucnNo = zero + hexAucnNo;
		
 		//System.out.println(paramAucnNo);
 		
 		// 입찰가 10진수에서 16진수로 변환
 		String hexBid = Integer.toHexString(bid);
		// 이 두친구도 고정값
		jsonInput.put("jsonrpc", "2.0");
		jsonInput.put("method", "eth_sendTransaction");

		JSONObject param = new JSONObject();
		// smart contract Address (MultiAuction)
		// from : 지갑주소 , to : smart contract Address
		
		param.put("from", "0x13B770f414f4c5e547da9cE9382071Ebdd8f3F9a");
		param.put("to", "0x243Ac993BD48280D420d3BfD27d1250d8A51530C");
		// val 16진수로 변환한 wei 값을 넘긴다 이더로 보내고 싶으면 웨이값으로 환산한 후 보내기
		String NaN = "0x";
		param.put("value", NaN+hexBid);
		// input 값 hash 변환 method+parameter(optional)
		String auctionBid = "0x454a2ab3";
		String auctionBidData = auctionBid+ paramAucnNo;
		param.put("data", auctionBidData);
		data.put(param);
		jsonInput.put("params", data);
		// id는 아무거나 넣으슈
		jsonInput.put("id", 1);
		System.out.println("입찰 전송 : "+jsonInput.toString());
		EthResultVO result = aucnDa.callEthFunction(jsonInput.toString(), EthResultVO.class);
		System.out.println(result);
		// 입찰 DB 업데이트가 끝날시 NFTAuction 솔리디티 method 호출후 bid(aucnNo) 실행하여 입찰
		// 220308 PSH websocket 실시간 알림 초안 작성
		// websocket 호출 위치 변경 예정, view 단에서 message 받고 나서 알림창 태그 추가해서 알림 만들어 주면 됨.
		// 참고 사이트 이용해서 마무리 하면 될듯
		/*
		 * if(id != null) { //메세지 받을 세션 조회 WebSocketSession targetSession =
		 * userSessionsMap.get(id);
		 * 
		 * //로그인이 되어 있다면 if(targetSession != null) { TextMessage tmpMsg = new
		 * TextMessage(Integer.toString(aucnNo)); targetSession.sendMessage(tmpMsg); }
		 * }else {
		 * 
		 * //json 받아오면 get 으로 키꺼내고 프로시저 aucn_bid를 실행해서 최고입찰가 업데이트 AucnVO aucn = new
		 * AucnVO(); aucn.setAucn_no(aucnNo); aucn.setNow_bid(bid);
		 * aucn.setNow_bid_mem_email(id); aucnDao.aucnBid(aucn);
		 * 
		 * String sendBid = bid.toString()+Integer.toString(aucnNo); // 다시 실시간 채팅화면으로
		 * 메세지를 던져줌 던질때는 String 형식으로 보냄 sendMessage(sendBid);
		 * 
		 * // 입찰 DB 업데이트가 끝날시 NFTAuction 솔리디티 method 호출후 bid(aucnNo) 실행하여 입찰
		 * 
		 * }
		 */

	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		this.logger.error("web socket error!", exception);
	}

	@Override
	public boolean supportsPartialMessages() {
		this.logger.info("call method!");
		return super.supportsPartialMessages();
	}

	public void sendMessage(String message) {
		for (WebSocketSession session : this.sessionList) {
			if (session.isOpen()) {
				try {
					session.sendMessage(new TextMessage(message));
				} catch (Exception ignored) {
					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		Thread thread = new Thread() {
			int i = 0;

			@Override

			public void run() {
				while (true) {
					try {
						sendMessage("send message index " + i++);
						Thread.sleep(1000);
					} catch (InterruptedException e) {
						e.printStackTrace();
						break;
					}
				}
			}
		};
		// thread.start();
	}

	// 220308 PSH http session 에서 member 정보의 email 가져오기
	/* 220315 kjs security 로 주석
	 * private String getEmail(WebSocketSession session) { Map<String, Object>
	 * httpSession = session.getAttributes(); MemberVO member = (MemberVO)
	 * httpSession.get("member"); return member.getMem_email() == null ? null :
	 * member.getMem_email(); }
	 */
}