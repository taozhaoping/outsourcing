package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.Hotel;

@Component("hotelDao")
public class HotelDao extends BaseDao<Hotel> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_HOTEL");
	}
}
