package co.smartFarm.shopping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopController {	
	
	@Autowired
	private ShoppingMapper shoppingDao;
	
	@RequestMapping("/plantShopList.do")
	public String plantShopList() {
		return "shopping/plantShopList";
	}
	
	@RequestMapping("/plantProductAdd.do")
	public String plantProductAdd() {
		return "shopping/plantProductAdd";
	}
	
	@RequestMapping("/plantProductDetail.do")
	public String plantProductDetail() {
		return "shopping/plantProductDetail";
	}
	@RequestMapping("/plantProductUpdate.do")
	public String plantProductUpdate() {
		return "shopping/plantProductUpdate";
	}

}
