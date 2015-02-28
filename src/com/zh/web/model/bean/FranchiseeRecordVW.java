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
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
    private Integer id;
    
    /**
     * 流程编号
     */
    private String changeNumber;
    
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
    
    private Date reserveDateStart;

    private Date reserveDateEnd;
    
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

	public Date getReserveDateStart() {
		return reserveDateStart;
	}

	public void setReserveDateStart(Date reserveDateStart) {
		this.reserveDateStart = reserveDateStart;
	}

	public Date getReserveDateEnd() {
		return reserveDateEnd;
	}

	public void setReserveDateEnd(Date reserveDateEnd) {
		this.reserveDateEnd = reserveDateEnd;
	}

	public Integer getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public String getChangeNumber() {
		return changeNumber;
	}

	public void setChangeNumber(String changeNumber) {
		this.changeNumber = changeNumber;
	}
    
}
