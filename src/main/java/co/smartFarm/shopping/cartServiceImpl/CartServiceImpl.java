package co.smartFarm.shopping.cartServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.shopping.cartService.CartMapper;
import co.smartFarm.shopping.cartService.CartService;
import co.smartFarm.shopping.cartService.CartVO;

@Repository("cartDao")
public class CartServiceImpl implements CartService{

	@Autowired
	CartMapper map;
	
	@Override
	public List<CartVO> cartSelectList(CartVO cartVo) {
		return map.cartSelectList(cartVo);
	}

	@Override
	public Integer insertCart(CartVO cartVo) {
		System.out.println(cartVo.toString());
		return map.cartInsert(cartVo);
	}

}
