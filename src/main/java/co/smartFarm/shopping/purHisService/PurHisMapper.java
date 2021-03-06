package co.smartFarm.shopping.purHisService;

import java.util.List;

public interface PurHisMapper {
	Integer purHisInsert(PurHisVO purHisVo);
	List<PurHisVO> adminPurHisSelectList(PurHisVO purHisVo);
	List<PurHisVO> purHisPriceSelect();
	List<PurHisVO> purHisRevwSelect(String memEmail);
	List<PurHisVO> purHisSelect(String mem_email);
	int selectPurHisCount();
	int purHisUpdateState();
}
