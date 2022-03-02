package co.smartFarm.board.free.freeService;


import java.util.Date;

import lombok.Data;

@Data
public class FreeVO {
	
    private int free_no;
    private String free_title;
    private String free_con;
    private String mem_name;
    private int free_hit;
    private Date free_day;
    private String free_ori_rou;
    private String free_phy_rou;
    private String mem_email;

}