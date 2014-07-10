package test;


import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zh.base.model.Menu;
import com.zh.base.service.MenuService;
import com.zh.core.model.Pager;

public class TestService {

	public ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
			"spring-config.xml");


	@Test
	public void init() throws  Exception {
		
		
		MenuService menuService = (MenuService) applicationContext
				.getBean("menuService");
		
		Menu menu = new Menu();
		
		Pager p = new Pager();
		p.setCurPage(1);
		List<Menu> list = menuService.queryList(menu, p);
		System.out.println(list.size());
	}


}
