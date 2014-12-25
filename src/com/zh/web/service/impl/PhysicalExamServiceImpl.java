package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.core.model.Pager;
import com.zh.web.dao.PhysicalExamDao;
import com.zh.web.model.bean.PhysicalExam;
import com.zh.web.service.PhysicalExamService;

@Component("physicalExamService")
public class PhysicalExamServiceImpl implements PhysicalExamService {

	@Autowired
	private PhysicalExamDao physicalExamDao;
	
	@Override
	public PhysicalExam query(PhysicalExam physicalExam) {
		// TODO Auto-generated method stub
		return physicalExamDao.query(physicalExam);
	}

	@Override
	public void update(PhysicalExam physicalExam) {
		// TODO Auto-generated method stub
		physicalExamDao.update(physicalExam);
	}

	@Override
	public List<PhysicalExam> queryList(PhysicalExam physicalExam) {
		// TODO Auto-generated method stub
		return physicalExamDao.queryList(physicalExam);
	}

	@Override
	public List<PhysicalExam> queryList(PhysicalExam physicalExam, Pager page) {
		// TODO Auto-generated method stub
		return physicalExamDao.queryPageList(physicalExam, page);
	}

	@Override
	public Integer count(PhysicalExam physicalExam) {
		// TODO Auto-generated method stub
		return physicalExamDao.count(physicalExam);
	}

	@Override
	public void delete(PhysicalExam physicalExam) {
		// TODO Auto-generated method stub
		physicalExamDao.delete(physicalExam);
	}

	@Override
	public Integer insert(PhysicalExam physicalExam) {
		// TODO Auto-generated method stub
		return physicalExamDao.insert(physicalExam);
	}

	public PhysicalExamDao getPhysicalExamDao() {
		return physicalExamDao;
	}

	public void setPhysicalExamDao(PhysicalExamDao physicalExamDao) {
		this.physicalExamDao = physicalExamDao;
	}

}
