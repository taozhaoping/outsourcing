package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.util.DateUtil;
import com.zh.core.model.Pager;
import com.zh.web.dao.TrainCourseDao;
import com.zh.web.model.bean.TrainCourse;
import com.zh.web.service.TrainCourseService;

@Component("trainCourseService")
public class TrainCourseServiceImpl implements TrainCourseService {

	@Autowired
	private TrainCourseDao trainCourseDao;
	
	@Override
	public TrainCourse query(TrainCourse trainCourse) {
		// TODO Auto-generated method stub
		return trainCourseDao.query(trainCourse);
	}

	@Override
	public void update(TrainCourse trainCourse) {
		String update = DateUtil.getCreated();
		trainCourse.setUpdateDate(update);
		trainCourseDao.update(trainCourse);
	}

	@Override
	public List<TrainCourse> queryList(TrainCourse trainCourse) {
		// TODO Auto-generated method stub
		return trainCourseDao.queryList(trainCourse);
	}

	@Override
	public List<TrainCourse> queryList(TrainCourse trainCourse, Pager page) {
		// TODO Auto-generated method stub
		return trainCourseDao.queryPageList(trainCourse, page);
	}

	@Override
	public Integer count(TrainCourse trainCourse) {
		// TODO Auto-generated method stub
		return trainCourseDao.count(trainCourse);
	}

	@Override
	public void delete(TrainCourse trainCourse) {
		// TODO Auto-generated method stub
		trainCourseDao.update(trainCourse);
	}

	@Override
	public Integer insert(TrainCourse trainCourse) {
		String update = DateUtil.getCreated();
		trainCourse.setCreateDate(update);
		return (Integer)trainCourseDao.insert(trainCourse);
	}

	public TrainCourseDao getTrainCourseDao() {
		return trainCourseDao;
	}

	public void setTrainCourseDao(TrainCourseDao trainCourseDao) {
		this.trainCourseDao = trainCourseDao;
	}

}
