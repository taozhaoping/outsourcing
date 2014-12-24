package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.TrainingOfPersonnel;

@Component("trainingOfPersonnelDao")
public class TrainingOfPersonnelDao extends BaseDao<TrainingOfPersonnel> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_TRAININGOFPERSONNEL");
	}

}
