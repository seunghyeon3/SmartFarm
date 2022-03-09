package co.smartFarm.plant.plantServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.plant.plantService.PlantMapper;
import co.smartFarm.plant.plantService.PlantService;
import co.smartFarm.plant.plantService.PlantVO;
import co.smartFarm.user.memberService.MemberVO;

@Repository("plantDao")
public class PlantServiceImpl implements PlantService{

	@Autowired
	PlantMapper map;

	@Override
	public List<PlantVO> selectMemPlantList(MemberVO memberVo) {
		return map.selectMemPlantList(memberVo);
	}

	@Override
	public PlantVO selectPlant(PlantVO plantVo) {
		return map.selectPlant(plantVo);
	}

	@Override
	public List<PlantVO> adminSelectPlant() {
		return map.adminSelectPlant();
	}
}
