package co.smartFarm.plant.plantSaleService;

import java.util.List;

public interface PlantSaleService {

	//220302 PSH ShoppingService -> PlantSaleService 구분 작업
	int plantSaleInsert(PlantSaleVO plantSaleVO);
	List<PlantSaleVO> plantSaleSelectList();
}
