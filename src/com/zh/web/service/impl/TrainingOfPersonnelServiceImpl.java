package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.core.model.Pager;
import com.zh.web.dao.TrainingOfPersonnelDao;
import com.zh.web.model.bean.TrainingOfPersonnel;
import com.zh.web.service.TrainingOfPersonnelService;

@Component("trainingOfPersonnelService")
public class TrainingOfPersonnelServiceImpl implements
		TrainingOfPersonnelService {

	@Autowired
	private TrainingOfPersonnelDao trainingOfPersonnelDao;
	
	@Override
	public TrainingOfPersonnel query(TrainingOfPersonnel trainingOfPersonnel) {
		// TODO Auto-generated method stub
		return trainingOfPersonnelDao.query(trainingOfPersonnel);
	}

	@Override
	public void update(TrainingOfPersonnel trainingOfPersonnel) {
		// TODO Auto-generated method stub
		trainingOfPersonnelDao.update(trainingOfPersonnel);
	}

	@Override
	public List<TrainingOfPersonnel> queryList(
			TrainingOfPersonnel trainingOfPersonnel) {
		// TODO Auto-generated method stub
		return trainingOfPersonnelDao.queryList(trainingOfPersonnel);
	}

	@Override
	public List<TrainingOfPersonnel> queryList(
			TrainingOfPersonnel trainingOfPersonnel, Pager page) {
		// TODO Auto-generated method stub
		return trainingOfPersonnelDao.queryPageList(trainingOfPersonnel, page);
	}

	@Override
	public Integer count(TrainingOfPersonnel trainingOfPersonnel) {
		// TODO Auto-generated method stub
		return trainingOfPersonnelDao.count(trainingOfPersonnel);
	}

	@Override
	public void delete(TrainingOfPersonnel trainingOfPersonnel) {
		// TODO Auto-generated method stub
		trainingOfPersonnelDao.delete(trainingOfPersonnel);
	}

	@Override
	public Integer insert(TrainingOfPersonnel trainingOfPersonnel) {
		// TODO Auto-generated method stub
		return trainingOfPersonnelDao.insert(trainingOfPersonnel);
	}

	public TrainingOfPersonnelDao getTrainingOfPersonnelDao() {
		return trainingOfPersonnelDao;
	}

	public void setTrainingOfPersonnelDao(
			TrainingOfPersonnelDao trainingOfPersonnelDao) {
		this.trainingOfPersonnelDao = trainingOfPersonnelDao;
	}
	
	

}
