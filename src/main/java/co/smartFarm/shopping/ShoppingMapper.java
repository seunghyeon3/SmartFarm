package co.smartFarm.shopping;

import java.util.List;

//plant_sale Mapper
public interface ShoppingMapper {

	int plantSaleInsert(ShoppingVO shoppingVo);
	List<ShoppingVO> plantSaleSelectList();
}
