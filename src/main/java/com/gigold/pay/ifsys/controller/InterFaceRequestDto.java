/**
 * Title: QueryDemoRequestDto.java<br/>
 * Description: <br/>
 * Copyright: Copyright (c) 2015<br/>
 * Company: gigold<br/>
 *
 */
package com.gigold.pay.ifsys.controller;

import com.gigold.pay.framework.web.RequestDto;
import com.gigold.pay.ifsys.bo.InterFaceInfo;
import com.github.pagehelper.PageInfo;

public class InterFaceRequestDto extends RequestDto {

	private InterFaceInfo interFaceInfo;
	private PageInfo pageInfo;
	
		public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	private int pageNum;
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	private int pageSize;

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public InterFaceInfo getInterFaceInfo() {
		return interFaceInfo;
	}

	public void setInterFaceInfo(InterFaceInfo interFaceInfo) {
		this.interFaceInfo = interFaceInfo;
	}

	public boolean validate() {
		return true;
	}
}
