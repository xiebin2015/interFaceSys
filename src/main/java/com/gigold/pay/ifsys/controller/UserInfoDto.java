package com.gigold.pay.ifsys.controller;

import com.gigold.pay.framework.web.ResponseDto;
import com.gigold.pay.ifsys.bo.UserInfo;
import com.github.pagehelper.PageInfo;

public class UserInfoDto extends ResponseDto {

	private PageInfo<UserInfo> pinfo;

	public PageInfo<UserInfo> getPinfo() {
		return pinfo;
	}

	public void setPinfo(PageInfo<UserInfo> pinfo) {
		this.pinfo = pinfo;
	}

	private UserInfo userInfo;

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
}
