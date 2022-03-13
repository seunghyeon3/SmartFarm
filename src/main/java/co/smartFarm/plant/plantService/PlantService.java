package co.smartFarm.plant.plantService;

import java.util.List;

import co.smartFarm.user.memberService.MemberVO;

//220302 PSH shopping -> plant 구분 작업
public interface PlantService {
	List<PlantVO> selectMemPlantList(MemberVO memberVo);
	PlantVO selectPlant(PlantVO plantVo);
	List<PlantVO> adminSelectPlant();
	
}
