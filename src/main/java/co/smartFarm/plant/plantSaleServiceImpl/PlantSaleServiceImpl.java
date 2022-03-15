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
	@Override
	public List<PlantSaleVO> plantSaleSelectListOrderNo() {
		return map.plantSaleSelectListOrderNo();
	}
	@Override
	public PlantSaleVO plantSaleSelectOneByNo(int plantSaleNo) {
		return map.plantSaleSelectOneByNo(plantSaleNo);
	}
	@Override
	public PlantSaleVO plantSaleSelectOne(int plantSaleNo) {
		return map.plantSaleSelectOne(plantSaleNo);
	}
	@Override
	public int plantSaleUpdate(PlantSaleVO plantSaleVo) {
		return map.plantSaleUpdate(plantSaleVo);
	}
	@Override
	public int plantDelete(int plantSaleNo) {
		return map.plantDelete(plantSaleNo);
	}
	@Override
	public List<PlantSaleVO> plantSaleSelectBiggerNo(int plantSaleNo) {
		return map.plantSaleSelectBiggerNo(plantSaleNo);
	}
	@Override
	public int plantSaleUpdateNo(List<PlantSaleVO> list) {
		return map.plantSaleUpdateNo(list);
	}
	@Override
	public List<PlantSaleVO> plantSaleSearch(String plantSaleTitle) {
		return map.plantSaleSearch(plantSaleTitle);
	}

}
