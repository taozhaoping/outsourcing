package test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zh.base.service.UserInfoService;

public class TestService {

	public ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
			"spring-config.xml");

	@Test
	public void init() throws  Exception {
		UserInfoService userInfoService = (UserInfoService) applicationContext
				.getBean("userInfoService");
		String str = userInfoService.queryListJson();
		System.out.println(str);
//		TechnologicalProcess technologicalProcess = new TechnologicalProcess();
//		technologicalProcess.setId(1);
//		technologicalProcess.setName("测试");
//		technologicalProcessService.insert(technologicalProcess);
		//TechnologicalProcess reult = technologicalProcessService.query(technologicalProcess);
		//System.out.println(reult.);
		
	}


}
