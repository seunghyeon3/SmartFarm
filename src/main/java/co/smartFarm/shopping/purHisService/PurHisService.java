package co.smartFarm.shopping.purHisService;

import java.util.List;

public interface PurHisService {
	Integer purHisInsert(PurHisVO purHisVo);
	List<PurHisVO> adminPurHisSelectList(PurHisVO purHisVo);
	//220309 PSH 메인 페이지 농부 순위를 매출 순으로 위해 추가
	List<PurHisVO> purHisPriceSelect();
}
