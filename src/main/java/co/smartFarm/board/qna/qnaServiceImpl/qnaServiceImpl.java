package co.smartFarm.board.qna.qnaServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.board.qna.qnaService.QnaMapper;
import co.smartFarm.board.qna.qnaService.QnaService;
import co.smartFarm.board.qna.qnaService.QnaVO;

@Repository("qnaDao")
public class qnaServiceImpl implements QnaService{

	@Autowired
	private QnaMapper map;

	@Override
	public List<QnaVO> qnaSelectList() {
		return map.qnaSelectList();
	}

	@Override
	public QnaVO qnaSelect(int qna_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QnaVO qnaSelect(QnaVO qna) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int qnaInsert(QnaVO qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qnaDelete(QnaVO qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qnaUpdate(QnaVO qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qnaHitUpdate(int qna_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qnaNoUpdate(int qna_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<QnaVO> qnaSearch(String key, String val) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String writeValueAsString(List<QnaVO> qnaSelectList) {
		// TODO Auto-generated method stub
		return null;
	}
}
