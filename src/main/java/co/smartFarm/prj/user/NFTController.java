package co.smartFarm.prj.user;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NFTController {

	//nft 생성버튼누를시 사진생성,
	@RequestMapping("/nftGeneration.do")
	public String nftGeneration() {
		  try {
			   BufferedImage image1 = ImageIO.read(new File("/resources/nft/Background/봄.png"));
			   BufferedImage image2 = ImageIO.read(new File("/resources/nft/Body/곰 똑냥이.png"));
			   BufferedImage image3 = ImageIO.read(new File("/resources/nft/Medal/금메달.png"));

			   int width = image1.getWidth();
			   int height = image1.getHeight();

			   BufferedImage mergedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			   Graphics2D graphics = (Graphics2D) mergedImage.getGraphics();

			   graphics.setBackground(Color.WHITE);
			   graphics.drawImage(image1, 0, 0, null);
			   graphics.drawImage(image2, 0, 0, null);
			   graphics.drawImage(image3, 0, 0, null);
			   
			  // ImageIO.write(mergedImage, "gif", new File("c:\\mergedImage.gif"));
			   // ImageIO.write(mergedImage, "jpg", new File("c:\\mergedImage.jpg"));
			    ImageIO.write(mergedImage, "png", new File("../resources/nft//mergedImage.png"));
			  } catch (IOException ioe) {
			   ioe.printStackTrace();
			  }

		return null;
	}
	
}
