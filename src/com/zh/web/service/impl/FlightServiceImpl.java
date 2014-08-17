package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.core.model.Pager;
import com.zh.web.dao.FlightDao;
import com.zh.web.model.bean.Flight;
import com.zh.web.service.FlightService;

@Component("flightService")
public class FlightServiceImpl implements FlightService {

	@Autowired
	private FlightDao flightDao;
	
	@Override
	public Flight query(Flight flight) {
		// TODO Auto-generated method stub
		return flightDao.query(flight);
	}

	@Override
	public void update(Flight flight) {
		// TODO Auto-generated method stub
		flightDao.update(flight);
	}

	@Override
	public List<Flight> queryList(Flight flight) {
		// TODO Auto-generated method stub
		return flightDao.queryList(flight);
	}

	@Override
	public List<Flight> queryList(Flight flight, Pager page) {
		// TODO Auto-generated method stub
		return flightDao.queryPageList(flight, page);
	}

	@Override
	public Integer count(Flight flight) {
		// TODO Auto-generated method stub
		return flightDao.count(flight);
	}

	@Override
	public void delete(Flight flight) {
		// TODO Auto-generated method stub
		flightDao.delete(flight);
	}

	@Override
	public void insert(Flight flight) {
		// TODO Auto-generated method stub
		flightDao.insert(flight);
	}

	public FlightDao getFlightDao() {
		return flightDao;
	}

	public void setFlightDao(FlightDao flightDao) {
		this.flightDao = flightDao;
	}

}
