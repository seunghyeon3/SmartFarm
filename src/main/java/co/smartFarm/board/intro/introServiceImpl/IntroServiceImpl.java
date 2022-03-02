package co.smartFarm.board.intro.introServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.board.intro.introService.IntroMapper;
import co.smartFarm.board.intro.introService.IntroService;
import co.smartFarm.board.intro.introService.IntroVO;

@Repository("introDao")
public class IntroServiceImpl implements IntroService{

	@Autowired
	private IntroMapper map;

	@Override
	public List<IntroVO> introSelectList() {
		return map.introSelectList();
	}

	@Override
	public IntroVO introinsertSelect(int Intro_no) {
		return map.introinsertSelect(Intro_no);
	}

	@Override
	public IntroVO introSelect(IntroVO intro) {
		return map.introSelect(intro);
	}

	@Override
	public int introInsert(IntroVO intro) {
		return map.introInsert(intro);
	}

	@Override
	public int introDelete(IntroVO intro) {
		return map.introDelete(intro);
	}

	@Override
	public int introUpdate(IntroVO intro) {
		return map.introDelete(intro);
	}

	@Override
	public List<IntroVO> introSearch(String key, String val) {
		return map.introSearch(key, val);
	}
}
