package com.gigold.pay.ifsys.bo;

import java.io.Serializable;
import java.sql.Timestamp;

public class InterFaceInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private String ifName;
	private String ifDesc;
	private int uid;
	private Timestamp ifCreateTime;
	private int ifSysId;
	private int ifCreateBy;
	public int getIfCreateBy() {
		return ifCreateBy;
	}

	public void setIfCreateBy(int ifCreateBy) {
		this.ifCreateBy = ifCreateBy;
	}

	private int ifProId;
	private String ifRequest;
	private String ifResponseSuccuss;
	private String ifResponseFailure;
	private String ifStatus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIfName() {
		return ifName;
	}

	public void setIfName(String ifName) {
		this.ifName = ifName;
	}

	public String getIfDesc() {
		return ifDesc;
	}

	public void setIfDesc(String ifDesc) {
		this.ifDesc = ifDesc;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}


	public Timestamp getIfCreateTime() {
		return ifCreateTime;
	}

	public void setIfCreateTime(Timestamp ifCreateTime) {
		this.ifCreateTime = ifCreateTime;
	}

	public int getIfSysId() {
		return ifSysId;
	}

	public void setIfSysId(int ifSysId) {
		this.ifSysId = ifSysId;
	}

	public int getIfProId() {
		return ifProId;
	}

	public void setIfProId(int ifProId) {
		this.ifProId = ifProId;
	}

	public String getIfRequest() {
		return ifRequest;
	}

	public void setIfRequest(String ifRequest) {
		this.ifRequest = ifRequest;
	}

	public String getIfResponseSuccuss() {
		return ifResponseSuccuss;
	}

	public void setIfResponseSuccuss(String ifResponseSuccuss) {
		this.ifResponseSuccuss = ifResponseSuccuss;
	}

	public String getIfResponseFailure() {
		return ifResponseFailure;
	}

	public void setIfResponseFailure(String ifResponseFailure) {
		this.ifResponseFailure = ifResponseFailure;
	}

	public String getIfStatus() {
		return ifStatus;
	}

	public void setIfStatus(String ifStatus) {
		this.ifStatus = ifStatus;
	}

	public String getIfUrl() {
		return ifUrl;
	}

	public void setIfUrl(String ifUrl) {
		this.ifUrl = ifUrl;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String ifUrl;

}
