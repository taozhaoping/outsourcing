package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.Flight;

@Component("flightDao")
public class FlightDao extends BaseDao<Flight> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_Flight");
	}

}
