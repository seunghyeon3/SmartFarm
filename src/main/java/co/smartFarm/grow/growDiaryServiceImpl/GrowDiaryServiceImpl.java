package co.smartFarm.grow.growDiaryServiceImpl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

	
//	@Override
//	public List<GrowDiaryVO> growDiaryList(String memEmail) throws IOException {
//		
//		List<GrowDiaryVO> voList = map.growDiaryMyList(memEmail);
//		
//		for(int i = 0; i<voList.size(); i++) {
//			String test = "D:\\" + voList.get(i).getGrow_diary_log_rou();
//			Path path = Paths.get(test);
//			List<String> lines = Files.readAllLines(path);
//			System.out.println(lines);
//			voList.get(i).setLogLines(lines);
//		}
//		
//		return voList;
//	}
}
