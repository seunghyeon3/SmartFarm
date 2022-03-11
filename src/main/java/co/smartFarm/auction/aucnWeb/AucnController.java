package co.smartFarm.auction.aucnWeb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import co.smartFarm.NFT.service.NftService;
import co.smartFarm.auction.aucnService.AucnService;
import co.smartFarm.auction.aucnService.AucnVO;
import co.smartFarm.prj.EthResultVO;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class AucnController {
	
	//web3 provider
	private static final String LOCAL = "http://127.0.0.1:8545";
	
	@Autowired
	private AucnService aucnDao;
	@Autowired
	private NftService nftDao;
	
	@RequestMapping("/aucnMain.do")
	public String aucnMain(Model model) {
		model.addAttribute("aucnEnable", aucnDao.aucnEnable());
		
		return "auction/aucnMain";
	}

	@RequestMapping("/aucnInsert.do")
	public String aucnInsert(AucnVO aucn, HttpSession session, MemberVO mem) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		aucn.setMem_name(member.getMem_name());
		aucn.setMem_email(member.getMem_email());
		aucn.setNow_bid(aucn.getFirst_bid());
		aucn.setNow_bid_mem_email(member.getMem_email());
		aucnDao.aucnInsert(aucn);
	    return "redirect:nftholdings.do";
}
	
	@RequestMapping("/aucnDetail.do")
	public String aucnDetail(@RequestParam(value="aucnNo") int aucnNo, AucnVO aucn, Model model) {
		aucn = aucnDao.aucnSelect(aucnNo);
		model.addAttribute("aucnSelect", aucn);
		
		return "auction/aucnDetail";
	}
	
	//nft보유현황 페이지에서 경매버튼 클릭시 경매 등록페이지로 이동
	//220302 PSH MypageController -> AucnController 구분 작업
	@RequestMapping("/aucnInsertForm.do")
	public String nftAucnInsertForm(@RequestParam (value="nftNo") int nftNo ,Model model) {
		model.addAttribute("nftVo",nftDao.selectMyNft(nftNo));
		model.addAttribute("aucnNo",aucnDao.aucnNoselect());
		return "auction/aucnInsertForm";
	}
	
	// 스케줄러로 1분마다 경매 체크후 끝난친구가 있으면 db 업데이트로 경매유무 변경하고 
	// NFTAuction 솔리디티 method 호출후 auctionend(aucnNo) 실행해서 경매 종료
	// web소켓 알림으로 최고입찰자를 제외한 입찰자들에게 알림 전송 (**최고입찰자에게 경매가 완료되었다 알림을 보낼지 물어보기**) 
	// -> 알림에서 버튼을 누를 시 NFTAuction 솔리디티 method 호출후 withdraw(aucnNo) 실행해서 입찰금액 출금
	// GrowDiary 솔리디티 method 호출후 ownerUpdate(nftNo, newOwner) 실행해서 NFT소유주 변경
	//@Scheduled(cron="10 0/1 * * * *")
	public void nftAuctionEnd() throws IOException {
		//System.out.println("test");
			GetClientVersion();
	}
	
	// 이더리움 호출하는 친구
	public <T> T callEthFunction(String JSONInput, Class<T> classes){
	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Content-Type", "application/json");

	    HttpEntity<String> param= new HttpEntity<String>(JSONInput, headers);

	    RestTemplate restTemplate = new RestTemplate();
	    return (T) restTemplate.postForObject(LOCAL, param, classes);
	}
	
	public void GetClientVersion() throws IOException{
		//db 조회해서 경매가 종료되었나 안되었나 카운트 체크
		int aucnEndCount = aucnDao.aucnEndCheck();
		//System.out.println("test : " + aucnDao.aucnEndCheckdo());
		//System.out.println("경매종료"+aucnEndCount);
		//System.out.println(aucnDao.aucnEnd());
		//종료된 경매가 카운트 될시 프로시저를 호출해 db 경매현황 업데이트, nft 소유주 변경이 되고 
		//경매 번호를 가져와 반복문을 돌려 솔리디티 경매 또한 종료시키며 최고입찰가가 경매를 입찰한 사람에게 입금이 됩니다.
		if(aucnEndCount != 0) {
			List<AucnVO> aucnEnds = aucnDao.aucnEndNo();
			
			for(AucnVO aucnEnd : aucnEnds) {
			
			//db 경매현황 업데이트, nft 소유주 변경
			aucnDao.aucnEnd();
			
			// 파라미터값 64byte로 변환 
			int testParam = aucnEnd.getAucn_no();
			
			String auncEndNo = Integer.toHexString(testParam);
			
			String zero = "";
			
			for (int i = 0; i < 64 - auncEndNo.length(); i++) {
				zero = zero + "0";
			}
			String paramBid = zero + auncEndNo;
			System.out.println(paramBid);
			
			JSONObject jsonInput = new JSONObject();
			JSONArray data = new JSONArray();
			
			// 이 두친구도 고정값
			jsonInput.put("jsonrpc", "2.0");
			jsonInput.put("method", "eth_sendTransaction");
			
			JSONObject param = new JSONObject();
			// from : 관리자 지갑주소 , to : smart contract Address
			param.put("from", "0x01740d5aCC6F52129b22f79AFF8d0e8b8F8212Ca");
			param.put("to", "0xe97D4Ef966998C4DdCfd1413b5dA7dfAE531A144");
			// input 값 hash 변환 method+parameter(optional)
			
			//withdraw data ( 10번 경매 10 -> a (16진수) )
			//param.put("data", "0x2e1a7d4d000000000000000000000000000000000000000000000000000000000000000a");
			
			//auctionEnd data ( 10번 경매 10 -> a (16진수) )0x32246e9f000000000000000000000000000000000000000000000000000000000000000a
			String auctionEnd = "0x32246e9f"; 
			String auctionEndData = auctionEnd+paramBid;
			param.put("data", auctionEndData);
			
			//test
			//param.put("data", "0x32246e9f000000000000000000000000000000000000000000000000000000000000000a");
			
			//bid data ( 10번 경매 10 -> a (16진수) )
			//param.put("data", "0x454a2ab3000000000000000000000000000000000000000000000000000000000000000a");
			//param.put("value", "340aad21b3b700000");
			//param.put("gas", "e453");
			data.put(param);
			jsonInput.put("params", data);
			//data.put("latest");
			// id는 아무거나 넣으슈
			jsonInput.put("id", 67);
			System.out.println(jsonInput.toString());
	        EthResultVO result = callEthFunction(jsonInput.toString(), EthResultVO.class);
	        System.out.println(result);
			}
		}
        
    }
	
	
}