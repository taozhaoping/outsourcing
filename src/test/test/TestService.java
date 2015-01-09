package test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zh.web.model.bean.Franchisee;
import com.zh.web.service.FranchiseeService;

public class TestService {

	public ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
			"spring-config.xml");

	@Test
	public void init() throws  Exception {
		FranchiseeService franchiseeService = (FranchiseeService) applicationContext.getBean("franchiseeService");
		
		Franchisee personnel = new Franchisee();
		
		personnel.setName("温州3");
		personnel.setAddress("温州3");
		personnel.setDescr("温州3");
		personnel.setCreateUserId(1);
		personnel.setStatus("0");
		/*Pager pager = new Pager();
		Integer count = mailListService.count(personnel);
		pager.setTotalRow(count);
		
		List<MailList> reult = mailListService.queryList(personnel, pager);
		System.out.println(reult.size());*/
		
		Integer reult = franchiseeService.insert(personnel);
		System.out.println(reult);
	}


}
