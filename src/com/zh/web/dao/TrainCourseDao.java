package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.ContactRecord;
import com.zh.web.model.bean.TrainCourse;

@Component("trainCourseDao")
public class TrainCourseDao extends BaseDao<TrainCourse> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_TRAINCOURSE");
	}

}
