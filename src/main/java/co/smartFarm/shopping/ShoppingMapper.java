package co.smartFarm.shopping;

import java.util.List;

import co.smartFarm.user.MemberVO;


public interface ShoppingMapper {
	List<ShoppingVO> selectMemShoppingList(MemberVO memberVo);
	
}
