package com.zh.web.model.bean;

import java.util.Date;

import com.zh.core.model.IDataObject;

/**
 * 加盟商通讯记录
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class FranchiseeRecord extends IDataObject {

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
     * 谈话类型
     */
    private String type;
    
    /**
     * 联系人主键
     */
    private Integer franchiseeID;

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

	
	public Integer getFranchiseeID() {
		return franchiseeID;
	}

	public void setFranchiseeID(Integer franchiseeID) {
		this.franchiseeID = franchiseeID;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
    
}
