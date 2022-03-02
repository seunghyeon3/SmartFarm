package co.smartFarm.grow.growDiaryServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.grow.growDiaryService.GrowDiaryMapper;
import co.smartFarm.grow.growDiaryService.GrowDiaryService;
import co.smartFarm.grow.growDiaryService.GrowDiaryVO;

@Repository("growDiaryDao")
public class GrowDiaryServiceImpl implements GrowDiaryService{

	@Autowired
	GrowDiaryMapper map;

	@Override
	public List<GrowDiaryVO> growDiaryMyList(String memEmail) {
		return map.growDiaryMyList(memEmail);
	}

	@Override
	public GrowDiaryVO growDiaryNoList(int growDiaryGrowNo) {
		return map.growDiaryNoList(growDiaryGrowNo);
	}
}
