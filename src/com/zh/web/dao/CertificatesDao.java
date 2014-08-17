package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.Certificates;

@Component("certificatesDao")
public class CertificatesDao extends BaseDao<Certificates> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_Certificates");
	}

}
