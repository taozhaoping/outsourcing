package com.zh.web.dao;

import javax.annotation.PostConstruct;
import org.springframework.stereotype.Component;
import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.Express;

@Component("expressDao")
public class ExpressDao extends BaseDao<Express> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_Express");
	}

}
