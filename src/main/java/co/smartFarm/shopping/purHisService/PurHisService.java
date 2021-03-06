package co.smartFarm.shopping.purHisService;

import java.util.List;

public interface PurHisService {
	Integer purHisInsert(PurHisVO purHisVo);
	List<PurHisVO> adminPurHisSelectList(PurHisVO purHisVo);
	//220309 PSH 메인 페이지 농부 순위를 매출 순으로 위해 추가
	List<PurHisVO> purHisPriceSelect();
	//구매내역 중 이용후기 작성하지 않은 애들만 조회
	List<PurHisVO> purHisRevwSelect(String memEmail);
	//마이페이지 구매내역
	List<PurHisVO> purHisSelect(String mem_email);
	//구매내역 업데이트하기 전에 업데이트 할 거 있는지 확인하기
	int selectPurHisCount();
	//구매내역 상황 업데이트 하기
	int purHisUpdateState();

}
