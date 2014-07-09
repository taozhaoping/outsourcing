package com.zh.base.service.impl;

import org.springframework.stereotype.Component;

import com.zh.base.model.MainModel;
import com.zh.base.service.MainService;

@Component("mainService")
public class MainServiceImpl implements MainService {


	
	
	public void initEmployeeInfo(MainModel mainModel) {
//		UserInfo user = mainModel.getUser();
//		EmployeeInfo employee = new EmployeeInfo();
//		employee.setId(user.getEmployeeID());
//		mainModel.setEmployee(employeeService.queryEmployee(employee));
//		mainModel.getUser().setEmployeeName(mainModel.getEmployee().getName());
		
	}
	
	public void initRoleMenuInfo(MainModel mainModel)
	{
//		RoleAndMenu role = new RoleAndMenu();
//		role.setId(mainModel.getUser().getRoleID());
//		
//		mainModel.setRole(roleService.loadRoleAndMenu(role));
	}
	
	public void initEnterprise(MainModel mainModel)
	{
//		EmployeeInfo employee = mainModel.getEmployee();
//		if( null == employee)
//		{
//			throw new ProjectException("employee is null");
//		}
//		
//		Enterprise enterprise = new Enterprise();
//		enterprise.setId(Integer.valueOf(employee.getEnterpriseID()));
//		mainModel.setEnterprise(enterpriseService.loadEnterprise(enterprise));
//		mainModel.getUser().setEnterpriseID(mainModel.getEnterprise().getId());
	}

}
