package co.smartFarm.auction.aucnWeb;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import co.smartFarm.user.memberService.MemberVO;

public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor{

	@Override
	 public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler 
	wsHandler, 
				Map<String, Object> attributes) throws Exception { 
		 // 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
			 ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request; 
			 HttpServletRequest req = ssreq.getServletRequest(); 
			 MemberVO member = (MemberVO) req.getSession().getAttribute("member");
			 if(member!=null) {
				 attributes.put("member", member);
			 }
			 return super.beforeHandshake(request, response, wsHandler, attributes); 
	 } 
	 @Override
	 public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler 
	wsHandler, 
				Exception ex) { 
			 System.out.println("After Handshake"); 
			 
			 super.afterHandshake(request, response, wsHandler, ex); 
	 
	 }
}

