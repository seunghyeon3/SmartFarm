package co.smartFarm.plant.plantSaleService;

import java.util.List;

//plant_sale Mapper
public interface PlantSaleMapper {

	//220302 PSH ShoppingMapper -> PlantSaleMapper 구분 작업
	int plantSaleInsert(PlantSaleVO plantSaleVO);
	List<PlantSaleVO> plantSaleSelectList();
	// 220312 PSH 날짜별(no가 후순일수록 최근꺼) 작물 조회 하기 위해 추가
	List<PlantSaleVO> plantSaleSelectListOrderNo();
	PlantSaleVO plantSaleSelectOneByNo(int plantSaleNo);//detail로 가기위해 필요
	PlantSaleVO plantSaleSelectOne(int plantSaleNo);//plant_sale, plant 조인함
}
