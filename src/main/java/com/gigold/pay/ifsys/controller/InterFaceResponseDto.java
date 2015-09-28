package com.gigold.pay.ifsys.controller;

import java.util.Map;

import com.gigold.pay.framework.web.ResponseDto;

public class InterFaceResponseDto extends ResponseDto {

	private Map<String, Object> messageInfo;

	public Map<String, Object> getMessageInfo() {
		return messageInfo;
	}

	public void setMessageInfo(Map<String, Object> messageInfo) {
		this.messageInfo = messageInfo;
	}

}
