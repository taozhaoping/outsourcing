package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.core.model.Pager;
import com.zh.web.dao.HotelDao;
import com.zh.web.model.bean.Hotel;
import com.zh.web.service.HotelService;

@Component("hotelService")
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelDao hotelDao;
	
	@Override
	public Hotel query(Hotel hotel) {
		// TODO Auto-generated method stub
		return hotelDao.query(hotel);
	}

	@Override
	public void update(Hotel hotel) {
		// TODO Auto-generated method stub
		hotelDao.update(hotel);
	}

	@Override
	public List<Hotel> queryList(Hotel hotel) {
		// TODO Auto-generated method stub
		return hotelDao.queryList(hotel);
	}

	@Override
	public List<Hotel> queryList(Hotel hotel, Pager page) {
		// TODO Auto-generated method stub
		return hotelDao.queryPageList(hotel, page);
	}

	@Override
	public Integer count(Hotel hotel) {
		// TODO Auto-generated method stub
		return hotelDao.count(hotel);
	}

	@Override
	public void delete(Hotel hotel) {
		// TODO Auto-generated method stub
		hotelDao.delete(hotel);
	}

	@Override
	public Integer insert(Hotel hotel) {
		// TODO Auto-generated method stub
		return hotelDao.insert(hotel);
	}

	public HotelDao getHotelDao() {
		return hotelDao;
	}

	public void setHotelDao(HotelDao hotelDao) {
		this.hotelDao = hotelDao;
	}

}
