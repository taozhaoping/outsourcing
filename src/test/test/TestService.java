package test;


import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zh.base.model.bean.Enterprise;
import com.zh.base.model.bean.Role;
import com.zh.base.service.RoleService;

public class TestService {

	public ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
			"spring-config.xml");


	@Test
	public void init() throws  Exception {
		
		
		RoleService roleService = (RoleService) applicationContext
				.getBean("roleService");
		
		Role role = new Role();
		role.setId(1);
		Role roleReult = roleService.queryAuthoritiesToMenu(role);
		System.out.println(roleReult.getMenuList().size());
	}


}
