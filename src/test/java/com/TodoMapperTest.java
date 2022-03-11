package com;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import co.smartFarm.auction.aucnService.AucnMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/appServlet/dataSource-context.xml")

public class TodoMapperTest {
	
	@Autowired AucnMapper mapper;
	
	@Test
	public void todoSelectList() {
		System.out.println(mapper.aucnEndCheckdo() );
	}
	
	
	
}
