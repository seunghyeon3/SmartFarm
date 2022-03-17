package co.smartFarm.prj;

import org.springframework.stereotype.Repository;

@Repository("MainDao")
public interface MainMapper {
	MainVO getCount();
}
