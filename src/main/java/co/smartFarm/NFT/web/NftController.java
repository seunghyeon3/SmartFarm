package co.smartFarm.NFT.web;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.smartFarm.NFT.service.NftService;
import co.smartFarm.NFT.service.NftVO;
import co.smartFarm.grow.growDiaryService.GrowDiaryService;
import co.smartFarm.grow.growDiaryService.GrowDiaryVO;
import co.smartFarm.user.memberService.MemberVO;

@Controller
//220302 MypageController -> NFTController로 구분 작업
public class NftController {
	
	@Autowired
	NftService nftDao;
	
	@Autowired
	GrowDiaryService growDiaryDao;
	
	
	//nft보유현황 페이지 mem 나중에 session으로 받아오기
		@RequestMapping("/nftholdings.do")
		public String nftholdings(Model model) {
			MemberVO memberVo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nftList", nftDao.selectNftMyList(memberVo.getMem_email()));
			return "user/nftholdings";
		}
		
		//nft 생성버튼누를시 resources밑에 nft폴더 사진을 이용하여 병합하고 ....
				@RequestMapping("/nftGeneration.do")
				@ResponseBody
				public int nftGeneration(@RequestParam(value = "growDiaryNo") int growDiaryNo, 
													HttpServletRequest request, NftVO nft, GrowDiaryVO growDiary) throws InterruptedException {
					try {
						  growDiary = growDiaryDao.growDiaryNoList(growDiaryNo);
						  
						  //(Math.random() * (최대값 - 최소값)) + 최소값
						  String background = request.getServletContext().getRealPath("resources/nft/Background/back"+(int)((Math.random()*11)+1)+".png");
						  String body = request.getServletContext().getRealPath("resources/nft/Body/tomcat"+(int)((Math.random()*31)+1)+".png");
						  
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
						  
						  String plant ="";
						  //plant는 작물 이름에 따라 분류
						  if (growDiary.getPlant_name().equals("토마토")) {
							  plant = request.getServletContext().getRealPath("resources/nft/Plant/tomato.png");
						  } else if (growDiary.getPlant_name().equals("딸기")) {
							  plant = request.getServletContext().getRealPath("resources/nft/Plant/strawberry.png");
						  } else if (growDiary.getPlant_name().equals("오이")){
							  plant = request.getServletContext().getRealPath("resources/nft/Plant/cucumber.png");
						  } else {
							  plant = request.getServletContext().getRealPath("resources/nft/Plant/whitegrape.png");
						  }
						  
						  
						   BufferedImage backgroundImage = ImageIO.read(new File(background));
						   BufferedImage bodyImage = ImageIO.read(new File(body));
						   BufferedImage medalImage = ImageIO.read(new File(medal));
						   BufferedImage plantImage = ImageIO.read(new File(plant));

						   int width = backgroundImage.getWidth();
						   int height = backgroundImage.getHeight();

						   BufferedImage mergedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
						   Graphics2D graphics = (Graphics2D) mergedImage.getGraphics();

						   graphics.setBackground(Color.WHITE);
						   graphics.drawImage(backgroundImage, 0, 0, null);
						   graphics.drawImage(bodyImage, 0, 0, null);
						   graphics.drawImage(medalImage, 0, 0, null);
						   graphics.drawImage(plantImage, 0, 0, null);
						   
						   //이름은 uid로 랜덤생성
						   String uid = UUID.randomUUID().toString();
						   //머지이미지 나중에 서버경로로 바꾸기 지금은 git 저장 경로
						   //String merge = "D:\\SmartFarm\\src\\main\\webapp\\resources\\nft\\merge\\merge"+uid+".png";
						   //집경로
						   String merge = "C:\\SmartFarm\\src\\main\\webapp\\resources\\nft\\merge\\merge"+uid+".png";
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
						   //220302 PSH mypageDao -> nftDao 수정
						    nftDao.createNft(nft);
						    
						  } catch (IOException ioe) {
						   ioe.printStackTrace();
						  }
					   //220302 PSH mypageDao -> nftDao 수정
					  return nftDao.noNft();
					  
				}

}
