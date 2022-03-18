package co.smartFarm.board.free.freeService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FreeService {
	 List<FreeVO> freeList();

	    FreeVO freeOne(int free_no);

	    FreeVO freeSelect(FreeVO free);
	    
	    int freeInsert(FreeVO free);

	    int noticeInsert(FreeVO free);
	    int noticeDelete(FreeVO free);
	    int freeUpdate(FreeVO free);
	    int freeNoUpdate(int free_no); 
	    List<FreeVO> freeSearch(@Param("key")String key, @Param("val") String val);
	    //220309 PSH 최근 5개 자유게시판 출력을 위해 추가
	    List<FreeVO> recentlyFree();

}
