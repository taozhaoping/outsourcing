package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.TechnologicalProcess;

@Component("technologicalProcess")
public class TechnologicalProcessDao extends BaseDao<TechnologicalProcess> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_TechnologicalProcess");
	}

}
