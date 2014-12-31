package test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zh.core.model.Pager;
import com.zh.web.model.bean.Personnel;
import com.zh.web.service.PersonnelService;

public class TestService {

	public ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
			"spring-config.xml");

	@Test
	public void init() throws  Exception {
		PersonnelService personnelService = (PersonnelService) applicationContext.getBean("personnelService");
		
		Personnel personnel = new Personnel();
		
		Pager pager = new Pager();
		Integer count = personnelService.count(personnel);
		pager.setTotalRow(count);
		
		List<Personnel> reult = personnelService.queryList(personnel, pager);
		System.out.println(reult.size());
	}


}
