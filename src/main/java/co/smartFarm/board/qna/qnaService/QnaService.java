package co.smartFarm.board.qna.qnaService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface QnaService {
	List<QnaVO> qnaSelectList();
	QnaVO qnaSelect(int qna_no);
	QnaVO qnaSelect(QnaVO qna);
	int qnaInsert(QnaVO qna);
	int qnaDelete(QnaVO qna);
	int qnaUpdate(QnaVO qna);
	
	int qnaHitUpdate(int qna_no);
	int qnaNoUpdate(int qna_no);
	List<QnaVO> qnaSearch(@Param("key")String key, @Param("val")String val);
	String writeValueAsString(List<QnaVO> qnaSelectList);
}
