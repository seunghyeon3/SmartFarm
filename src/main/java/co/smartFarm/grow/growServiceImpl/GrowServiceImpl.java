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

	@Override
	public String kitOwner(int deviceId) {
		return map.kitOwner(deviceId);
	}
	
	
}

