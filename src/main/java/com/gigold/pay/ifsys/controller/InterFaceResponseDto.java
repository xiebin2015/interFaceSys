package com.gigold.pay.ifsys.controller;

import java.util.Map;

import com.gigold.pay.framework.web.ResponseDto;

public class InterFaceResponseDto extends ResponseDto {

	private Map<String, Object> success;

	private Map<String,Object> failure;
	
	public Map<String, Object> getFailure() {
		return failure;
	}

	public void setFailure(Map<String, Object> failure) {
		this.failure = failure;
	}

	public Map<String, Object> getSuccess() {
		return success;
	}

	public void setSuccess(Map<String, Object>success) {
		this.success = success;
	}

	
	 
}
