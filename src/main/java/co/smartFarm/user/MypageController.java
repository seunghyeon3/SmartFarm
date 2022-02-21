package co.smartFarm.user;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	//마이페이지 경로
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "user/mypage";
	}

	
	
}
