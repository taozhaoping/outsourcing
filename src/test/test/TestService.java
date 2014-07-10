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
		userInfo.setId(6L);
		userInfo.setAddress("e");
		userInfo.setLoginName("1");
		userInfo.setUserPassword("1");
		userInfo.setName("1");
		userInfoService.updateUserinfo(userInfo);
		System.out.println(userInfo.getAddress());
	}


}
