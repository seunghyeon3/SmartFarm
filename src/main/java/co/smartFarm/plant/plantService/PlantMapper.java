package co.smartFarm.plant.plantService;

import java.util.List;

import co.smartFarm.user.memberService.MemberVO;

//220302 PSH shopping -> plant 구분 작업
public interface PlantMapper {
	List<PlantVO> selectMemPlantList(String memEmail);
	PlantVO selectPlant(PlantVO plantVo);
	List<PlantVO> adminSelectPlant();
	

}
