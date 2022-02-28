package co.smartFarm.shopping;

import java.util.List;

import co.smartFarm.user.MemberVO;

public interface PlantMapper {
	List<PlantVO> selectMemPlantList(MemberVO memberVo);
	PlantVO selectPlant(PlantVO plantVo);
}
