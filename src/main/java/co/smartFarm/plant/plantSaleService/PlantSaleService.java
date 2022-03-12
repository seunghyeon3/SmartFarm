package co.smartFarm.plant.plantSaleService;

import java.util.List;

public interface PlantSaleService {

	//220302 PSH ShoppingService -> PlantSaleService 구분 작업
	int plantSaleInsert(PlantSaleVO plantSaleVO);
	List<PlantSaleVO> plantSaleSelectList();
	// 220312 PSH 날짜별(no가 후순일수록 최근꺼) 작물 조회 하기 위해 추가
		List<PlantSaleVO> plantSaleSelectListOrderNo();
}
