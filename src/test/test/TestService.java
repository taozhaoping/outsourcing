package test;


import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zh.base.model.Enterprise;
import com.zh.base.service.EnterpriseService;

public class TestService {

	public ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
			"spring-config.xml");


	@Test
	public void init() throws  Exception {
		
		
		EnterpriseService enterpriseService = (EnterpriseService) applicationContext
				.getBean("enterpriseService");
		Enterprise enterprise = new Enterprise();
//		enterprise.setName("测试公司");
//		enterprise.setAddress("测试地址");
//		enterprise.setPhonecall("电话");
		
//		Enterprise enterpriseInfo = enterpriseService.query(enterprise);
//		
//		System.out.println(enterpriseInfo.getId());
		List<Enterprise> list = enterpriseService.queryList(enterprise);
		System.out.println(list.size());
	}


}
