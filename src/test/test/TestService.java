package test;


import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zh.base.model.User;
import com.zh.base.service.UserInfoService;

public class TestService {

	public ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
			"spring-config.xml");


	@Test
	public void init() throws  Exception {
		
		
		UserInfoService userInfoService = (UserInfoService) applicationContext
				.getBean("userInfoService");
		
		User userInfo = new User();
		userInfo.setLoginName("admin");
		User user = userInfoService.loadUserInfo(userInfo);
		
		System.out.println(user.getUserPassword());
	}


}
