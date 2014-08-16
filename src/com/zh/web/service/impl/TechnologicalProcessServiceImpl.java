package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.core.model.Pager;
import com.zh.web.dao.TechnologicalProcessDao;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.TechnologicalProcessService;

@Component("technologicalProcessService")
public class TechnologicalProcessServiceImpl implements
		TechnologicalProcessService {
	
	@Autowired
	private TechnologicalProcessDao technologicalProcessDao;

	@Override
	public TechnologicalProcess query(TechnologicalProcess technologicalProcess) {
		return technologicalProcessDao.query(technologicalProcess);
	}

	@Override
	public void update(TechnologicalProcess technologicalProcess) {
		technologicalProcessDao.update(technologicalProcess);
	}

	@Override
	public List<TechnologicalProcess> queryList(TechnologicalProcess technologicalProcess) {
		// TODO Auto-generated method stub
		return technologicalProcessDao.queryList(technologicalProcess);
	}

	@Override
	public List<TechnologicalProcess> queryList(TechnologicalProcess technologicalProcess,
			Pager page) {
		// TODO Auto-generated method stub
		return technologicalProcessDao.queryPageList(technologicalProcess, page);
	}

	@Override
	public Integer count(TechnologicalProcess technologicalProcess) {
		// TODO Auto-generated method stub
		return technologicalProcessDao.count(technologicalProcess);
	}

	@Override
	public void delete(TechnologicalProcess technologicalProcess) {
		// TODO Auto-generated method stub
		technologicalProcessDao.delete(technologicalProcess);
	}

	@Override
	public void insert(TechnologicalProcess technologicalProcess) {
		// TODO Auto-generated method stub
		technologicalProcessDao.insert(technologicalProcess);
	}

}
