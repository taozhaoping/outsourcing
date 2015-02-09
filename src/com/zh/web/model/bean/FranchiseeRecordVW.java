package com.zh.web.model.bean;

import java.util.Date;

import com.zh.core.model.IDataObject;

/**
 * 加盟商通讯记录
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class FranchiseeRecordVW extends IDataObject {

	/**
	 * 主键
	 */
    private Integer id;
    
    private String name;
    
    /**
     * 创建人
     */
    private Integer createUserId;
    
    /**
     * 描述
     */
    private String descr;

    /**
     * 谈话类型
     */
    private String type;
    
    /**
     * 创建时间
     */
    private String createdate;
    
    /**
     * 预约时间
     */
    private Date reserveDate;
    
    private String createtimeStart;
    
    private String createtimeEnd;
    
    private String reserveDateStart;

    private String reserveDateEnd;
    
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getCreatetimeStart() {
		return createtimeStart;
	}

	public void setCreatetimeStart(String createtimeStart) {
		this.createtimeStart = createtimeStart;
	}

	public String getCreatetimeEnd() {
		return createtimeEnd;
	}

	public void setCreatetimeEnd(String createtimeEnd) {
		this.createtimeEnd = createtimeEnd;
	}

	public String getReserveDateStart() {
		return reserveDateStart;
	}

	public void setReserveDateStart(String reserveDateStart) {
		this.reserveDateStart = reserveDateStart;
	}

	public String getReserveDateEnd() {
		return reserveDateEnd;
	}

	public void setReserveDateEnd(String reserveDateEnd) {
		this.reserveDateEnd = reserveDateEnd;
	}

	public Integer getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}
    
}
