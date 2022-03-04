package co.smartFarm.shopping.cartService;

import java.util.List;

public interface CartService {
	List<CartVO> cartSelectList(CartVO cartVo);//멤버별로 장바구니 리스트 조회
	Integer cartInsert(CartVO cartVo);
}
