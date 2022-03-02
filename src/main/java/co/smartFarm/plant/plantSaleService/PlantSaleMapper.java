package co.smartFarm.plant.plantSaleService;

import java.util.List;

//plant_sale Mapper
public interface PlantSaleMapper {

	//220302 PSH ShoppingMapper -> PlantSaleMapper 구분 작업
	int plantSaleInsert(PlantSaleVO plantSaleVO);
	List<PlantSaleVO> plantSaleSelectList();
}
