package co.smartFarm.plant.plantSaleServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.plant.plantSaleService.PlantSaleMapper;
import co.smartFarm.plant.plantSaleService.PlantSaleService;
import co.smartFarm.plant.plantSaleService.PlantSaleVO;

@Repository("plantSaleDao")
public class PlantSaleServiceImpl implements PlantSaleService{

	@Autowired
	private PlantSaleMapper map;
	//220302 PSH Shopping -> PlantSale 구분 작업
	@Override
	public int plantSaleInsert(PlantSaleVO plantSaleVO) {
		return map.plantSaleInsert(plantSaleVO);
	}
	//220302 PSH Shopping -> PlantSale 구분 작업
	@Override
	public List<PlantSaleVO> plantSaleSelectList() {
		return map.plantSaleSelectList();
	}
}