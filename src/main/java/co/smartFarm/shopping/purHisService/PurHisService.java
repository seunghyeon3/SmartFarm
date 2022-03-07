package co.smartFarm.shopping.purHisService;

import java.util.List;

public interface PurHisService {
	Integer purHisInsert(PurHisVO purHisVo);
	List<PurHisVO> adminPurHisSelectList(PurHisVO purHisVo);
}
