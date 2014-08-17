package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.core.model.Pager;
import com.zh.web.dao.CertificatesDao;
import com.zh.web.model.bean.Certificates;
import com.zh.web.service.CertificatesService;

@Component("certificatesService")
public class CertificatesServiceImpl implements CertificatesService {

	@Autowired
	private CertificatesDao certificatesDao;
	
	@Override
	public Certificates query(Certificates certificates) {
		// TODO Auto-generated method stub
		return certificatesDao.query(certificates);
	}

	@Override
	public void update(Certificates certificates) {
		// TODO Auto-generated method stub
		certificatesDao.update(certificates);
	}

	@Override
	public List<Certificates> queryList(Certificates certificates) {
		// TODO Auto-generated method stub
		return certificatesDao.queryList(certificates);
	}

	@Override
	public List<Certificates> queryList(Certificates certificates, Pager page) {
		// TODO Auto-generated method stub
		return certificatesDao.queryPageList(certificates, page);
	}

	@Override
	public Integer count(Certificates certificates) {
		// TODO Auto-generated method stub
		return certificatesDao.insert(certificates);
	}

	@Override
	public void delete(Certificates certificates) {
		// TODO Auto-generated method stub
		certificatesDao.delete(certificates);
	}

	@Override
	public void insert(Certificates certificates) {
		// TODO Auto-generated method stub
		certificatesDao.insert(certificates);
	}

	public CertificatesDao getCertificatesDao() {
		return certificatesDao;
	}

	public void setCertificatesDao(CertificatesDao certificatesDao) {
		this.certificatesDao = certificatesDao;
	}

}
