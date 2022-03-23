package co.smartFarm.board.free.freeService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FreeMapper {

    List<FreeVO> freeList();

    FreeVO freeOne(int free_no);

    FreeVO freeSelect(FreeVO free);
    
    int freeInsert(FreeVO free);
    
    List<FreeVO> freeCommList(int free_no);
    
    int freeCommInsert(FreeVO free);

    FreeVO freeCommCount(int free_no);
    
    int freeUpdate(FreeVO free);
    
    int freeDelete(int free_no);
    
    void freeHitUp(int free_no);


    List<FreeVO> recentlyFree();
}