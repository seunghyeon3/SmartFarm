package co.smartFarm.grow.growServiceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.grow.growService.GrowMapper;
import co.smartFarm.grow.growService.GrowService;
import co.smartFarm.grow.growService.GrowVO;

//220302 PSH 서비스 나누면서 DAO 명 수정 ( mapg -> GrowDao)
@Repository("growDao")
public class GrowServiceImpl implements GrowService{
	
	@Autowired
	GrowMapper map;

	@Override
	public List<GrowVO> growList(String memEmail) {
		return map.growList(memEmail);
	}

	@Override
	public List<GrowVO> growComList(String memEmail) {
		return map.growComList(memEmail);
	}

	@Override
	public List<GrowVO> orderNumber(String memEmail) {
		return map.orderNumber(memEmail);
	}
	
	@Override
	public List<GrowVO> growListing(String memEmail) {
		
		List<GrowVO> voList = map.growListing(memEmail);
		int gd = 0;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
		Date currentTime = new Date();
		String now;
		now = format.format(currentTime);

//		for(int i = 0; i<voList.size(); i++) {
//			
//			if(voList.get(i).getGrow_status()!=null) {
//				gd = voList.get(i).getKit_grow_day();
//				String sd = voList.get(i).getGrow_status();
//				System.out.println(sd);
//				Date s_date = null;
//				Date c_date = null;
//				Date e_date = null;
//				try {
//					s_date = format.parse(sd);
//					c_date = format.parse(now);
//					e_date = format.parse(format.format(cal.getTime()));
//				} catch (ParseException e) {
//					e.printStackTrace();
//				}
//				cal.setTime(s_date);
//				cal.add(Calendar.DATE, gd);
//				System.out.println(s_date);
//				System.out.println(c_date);
//				System.out.println(e_date);
//		        float diffSec = (c_date.getTime() - s_date.getTime()) / 1000; //초 차이
//		        System.out.println(diffSec);
//				int diffDays = Math.round(diffSec*100/(24*60*60*gd)); //일자수 차이
//				System.out.println(diffDays);
//				voList.get(i).setPercent(diffDays);
//				voList.get(i).setEnd_estimate(format.format(e_date));
//			}
//		}
		
		return voList;
	}

	@Override
	public void addressUpdate(Map<String, String> val) {
		map.addressUpdate(val);
	}

	@Override
	public void statusUpdate(Map<String, String> val) {
		map.statusUpdate(val);
	}

	@Override
	public void diaryWrite(Map<String, String> val) {
		map.diaryWrite(val);
	}
	
	
}
