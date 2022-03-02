package co.smartFarm.user;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.smartFarm.auction.NftMapper;
import co.smartFarm.auction.NftVO;
import co.smartFarm.grow.GrowDiaryMapper;
import co.smartFarm.grow.GrowDiaryVO;


@Controller
public class MypageController {
	
	@Autowired
	private MypageMapper mypageDao;
	
	@Autowired
	private GrowDiaryMapper growDiaryDao;
	
	@Autowired
	private NftMapper nftDao;
	//마이페이지 경로
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "user/mypage";
	}
	
	//nft보유현황 페이지 mem 나중에 session으로 받아오기
	@RequestMapping("/nftholdings.do")
	public String nftholdings(Model model) {
		String mem = "bbb@abc.com";
		model.addAttribute("nftList", nftDao.selectNftMyList(mem));
		return "user/nftholdings";
	}
	
	//nft보유현황 페이지에서 경매버튼 클릭시 경매 등록페이지로 이동
	@RequestMapping("/aucnInsertForm.do")
	public String nftAucnInsertForm(@RequestParam (value="nftNo") int nftNo ,Model model) {
		model.addAttribute("nftVo",nftDao.selectMyNft(nftNo));
		return "auction/aucnInsertForm";
	}
	
	//nft 생성버튼누를시 resources밑에 nft폴더 사진을 이용하여 병합하고 ....
		@RequestMapping("/nftGeneration.do")
		@ResponseBody
		public int nftGeneration(@RequestParam(value = "growDiaryNo") int growDiaryNo, 
											HttpServletRequest request, NftVO nft, GrowDiaryVO growDiary, HttpSession session) throws InterruptedException {
			try {
				  growDiary = growDiaryDao.growDiaryNoList(growDiaryNo);
				  
				  //(Math.random() * (최대값 - 최소값)) + 최소값
				  String background = request.getServletContext().getRealPath("resources/nft/Background/back"+(int)((Math.random()*11)+1)+".png");
				  String body = request.getServletContext().getRealPath("resources/nft/Body/tomcat"+(int)((Math.random()*15)+1)+".png");
				  
				  String medal = "";
				  //medal은 작물 등급에 따라 분류
				  System.out.println(growDiary.getGrow_diary_grd());
				  if (growDiary.getGrow_diary_grd().equals("최상")) {
					  medal = request.getServletContext().getRealPath("resources/nft/Medal/gold.png");
				  } else if (growDiary.getGrow_diary_grd().equals("상")) {
					  medal = request.getServletContext().getRealPath("resources/nft/Medal/silver.png");
				  } else if (growDiary.getGrow_diary_grd().equals("중")){
					  medal = request.getServletContext().getRealPath("resources/nft/Medal/bronze.png");
				  } else {
					  medal = request.getServletContext().getRealPath("resources/nft/Medal/fail.png");
				  }
				  
				   BufferedImage backgroundImage = ImageIO.read(new File(background));
				   BufferedImage bodyImage = ImageIO.read(new File(body));
				   BufferedImage medalImage = ImageIO.read(new File(medal));

				   int width = backgroundImage.getWidth();
				   int height = backgroundImage.getHeight();

				   BufferedImage mergedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
				   Graphics2D graphics = (Graphics2D) mergedImage.getGraphics();

				   graphics.setBackground(Color.WHITE);
				   graphics.drawImage(backgroundImage, 0, 0, null);
				   graphics.drawImage(bodyImage, 0, 0, null);
				   graphics.drawImage(medalImage, 0, 0, null);
				   
				   //이름은 uid로 랜덤생성
				   String uid = UUID.randomUUID().toString();
				   //머지이미지 나중에 서버경로로 바꾸기 지금은 git 저장 경로
				   String merge = "D:\\SmartFarm\\src\\main\\webapp\\resources\\nft\\merge\\merge"+uid+".png";
				   //집경로
				   //String merge = "C:\\SmartFarm\\src\\main\\webapp\\resources\\nft\\merge\\merge"+uid+".png";
				   //String merge = request.getServletContext().getRealPath("resources/nft/merge/mergeImage.png");
				    ImageIO.write(mergedImage, "png", new File(merge));
				    System.out.println("NFT 생성이 완료되었습니다.");
				    
				    nft.setMem_email(growDiary.getMem_email());
				    nft.setGrow_diary_log_rou(growDiary.getGrow_diary_log_rou());
				    nft.setNft_img("merge"+uid+".png");
				    nft.setKit_no(growDiary.getKit_no());
				    nft.setGrow_diary_grd(growDiary.getGrow_diary_grd());
				    nft.setGrow_diary_grow_no(growDiaryNo);
				    
				    //생성완료시 nft테이블 insert와 재배일지 생성가능여부 update
				    mypageDao.createNft(nft);
				    
				  } catch (IOException ioe) {
				   ioe.printStackTrace();
				  }
			  return mypageDao.noNft();
			  
		}

	//재배내역 팝업창 클릭시 회원 재배내역 표출
	@RequestMapping("cultivationHistory.do")
	@ResponseBody
	public List<GrowDiaryVO> cultivationHistory(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memEmail = member.getMem_email();
	    return growDiaryDao.growDiaryMyList(memEmail);
	}
	
}