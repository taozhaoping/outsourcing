package com.zh.web.model.bean;

import java.util.Date;

import com.zh.core.model.IDataObject;

/**
 * 通讯记录
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class ContactRecord extends IDataObject {

	/**
	 * 主键
	 */
    private Integer id;
    
    /**
     * 描述
     */
    private String descr;

    /**
     * 创建时间
     */
    private String createdate;
    
    /**
     * 预约时间
     */
    private Date reserveDate;
    
    /**
     * 联系人主键
     */
    private Integer technologicalprocessid;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public Integer getTechnologicalprocessid() {
		return technologicalprocessid;
	}

	public void setTechnologicalprocessid(Integer technologicalprocessid) {
		this.technologicalprocessid = technologicalprocessid;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}
    
    
}
