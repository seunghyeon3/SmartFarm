package co.smartFarm.user;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.smartFarm.grow.GrowDiaryMapper;


@Controller
public class MypageController {
	
	@Autowired
	private MypageMapper mypageDao;
	
	@Autowired
	private GrowDiaryMapper growDiaryDao;
	
	//마이페이지 경로
	@RequestMapping("/mypage.do")
	public String mypage() {
		
		return "user/mypage";
	}
	
	//nft 생성버튼누를시 resources밑에 nft폴더 사진을 이용하여 병합하고 ....
		@RequestMapping("/nftGeneration.do")
		public String nftGeneration(HttpServletRequest request) {
			  try {
				  
				  //(Math.random() * (최대값 - 최소값)) + 최소값
				  String background = request.getServletContext().getRealPath("resources/nft/Background/back"+(int)((Math.random()*11)+1)+".png");
				  String body = request.getServletContext().getRealPath("resources/nft/Body/tomcat"+(int)((Math.random()*15)+1)+".png");
				  
				  //medal은 작물 등급에 따라 분류
				  String medal = request.getServletContext().getRealPath("resources/nft/Medal/gold.png");
				  
				   BufferedImage image1 = ImageIO.read(new File(background));
				   BufferedImage image2 = ImageIO.read(new File(body));
				   BufferedImage image3 = ImageIO.read(new File(medal));

				   int width = image1.getWidth();
				   int height = image1.getHeight();

				   BufferedImage mergedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
				   Graphics2D graphics = (Graphics2D) mergedImage.getGraphics();

				   graphics.setBackground(Color.WHITE);
				   graphics.drawImage(image1, 0, 0, null);
				   graphics.drawImage(image2, 0, 0, null);
				   graphics.drawImage(image3, 0, 0, null);
				   
				   //나중에 경로수정, 이름은 uid로 랜덤생성
				   String uid = UUID.randomUUID().toString();
				   String merge = "D:\\SmartFarm\\src\\main\\webapp\\resources\\nft\\merge\\merge"+uid+".png";
				   //String merge = request.getServletContext().getRealPath("resources/nft/merge/mergeImage.png");
				    ImageIO.write(mergedImage, "png", new File(merge));
				    System.out.println("NFT 생성이 완료되었습니다.");
				    
				    //나중에 session member로 수정
				    String mem = "aaa@abc.com";
				    System.out.println(growDiaryDao.growDiaryMyList(mem));
				  } catch (IOException ioe) {
				   ioe.printStackTrace();
				  }

			return null;
		}

	
	
}
