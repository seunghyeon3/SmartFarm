package co.smartFarm.board.Archieve.archieveService;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.ToString;
@Data
@ToString 

public class ArchieveVO {
	
	private int archieve_no;
	private String archieve_title;
	private String archieve_con;
	private int archieve_hit;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date archieve_day;
	private String archieve_img;
	private String mem_name;
	
	
}
