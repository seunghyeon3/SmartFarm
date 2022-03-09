package co.smartFarm.board.free.freeService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FreeMapper {

    List<FreeVO> freeList();

    FreeVO freeOne(int free_no);

    FreeVO freeSelect(FreeVO free);
    int noticeInsert(FreeVO free);
    int noticeDelete(FreeVO free);
    int freeUpdate(FreeVO free);
    int freeNoUpdate(int free_no); 
    List<FreeVO> freeSearch(@Param("key")String key, @Param("val") String val);
    List<FreeVO> recentlyFree();
}