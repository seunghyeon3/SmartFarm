package co.smartFarm.plant.plantSaleService;

import java.util.List;

public interface PlantSaleService {

	//220302 PSH ShoppingService -> PlantSaleService 구분 작업
	int plantSaleInsert(PlantSaleVO plantSaleVO);
	List<PlantSaleVO> plantSaleSelectList();
	// 220312 PSH 날짜별(no가 후순일수록 최근꺼) 작물 조회 하기 위해 추가
	List<PlantSaleVO> plantSaleSelectListOrderNo();
	PlantSaleVO plantSaleSelectOneByNo(int plantSaleNo);
	PlantSaleVO plantSaleSelectOne(int plantSaleNo);//plant_sale, plant 조인함
	int plantSaleUpdate(PlantSaleVO plantSaleVo);
	int plantDelete(int plantSaleNo);
	List<PlantSaleVO> plantSaleSelectBiggerNo(int plantSaleNo);
	int plantSaleUpdateNo(List<PlantSaleVO> list); // delete 후 번호 하나씩 당기기
	
	List<PlantSaleVO> plantSaleSearch(String plantSaleTitle);
}
