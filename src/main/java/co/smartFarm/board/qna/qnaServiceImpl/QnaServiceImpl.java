package co.smartFarm.board.qna.qnaServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.board.qna.qnaService.QnaMapper;
import co.smartFarm.board.qna.qnaService.QnaService;
import co.smartFarm.board.qna.qnaService.QnaVO;

@Repository("qnaDao")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaMapper map;

	@Override
	public List<QnaVO> qnaSelectList() {
		return map.qnaSelectList();
	}

	@Override
	public QnaVO qnaSelect(int qna_no) {
		
		return map.qnaSelect(qna_no);
	}

	@Override
	public QnaVO qnaSelect(QnaVO qna) {
		
		return map.qnaSelect(qna);
	}

	@Override
	public int qnaInsert(QnaVO qna) {
		
		return map.qnaInsert(qna);
	}

	@Override
	public int qnaDelete(QnaVO qna) {
		
		return map.qnaDelete(qna);
	}

	@Override
	public int qnaUpdate(QnaVO qna) {
		
		return map.qnaUpdate(qna);
	}

	@Override
	public int qnaHitUpdate(int qna_no) {
		
		return map.qnaHitUpdate(qna_no);
	}

	@Override
	public int qnaNoUpdate(int qna_no) {
		
		return map.qnaNoUpdate(qna_no);
	}
	
	@Override
	public List<QnaVO> qnaSearch(String key, String val) {
		return map.qnaSearch(key, val);
	}

	@Override
	public String writeValueAsString(List<QnaVO> qnaSelectList) {
		return map.writeValueAsString(qnaSelectList);
	}
}
