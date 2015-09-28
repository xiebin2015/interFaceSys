package com.gigold.pay.ifsys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gigold.pay.ifsys.bo.InterFaceInfo;
import com.gigold.pay.ifsys.controller.InterFaceRequestDto;
import com.gigold.pay.ifsys.dao.InterFaceDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class InterFaceService {

	@Autowired
	InterFaceDao interFaceDao;

	public InterFaceInfo getInterFaceById(int id) {
		return interFaceDao.getInterFaceById(id);
	}

	public List<InterFaceInfo> getInterFaceByProId(int id) {
		return null;
	}

	public PageInfo<InterFaceInfo> getInterFaceByName(InterFaceRequestDto dto) {

		PageHelper.startPage(dto.getPageNum(), dto.getPageSize());
		List<InterFaceInfo> list = interFaceDao.getInterFace(dto.getInterFaceInfo());
		PageInfo<InterFaceInfo> pi = new PageInfo<InterFaceInfo>(list);
		return pi;
	}

	public PageInfo<InterFaceInfo> getAllInterFace(InterFaceRequestDto dto) {
		PageHelper.startPage(dto.getPageNum(), dto.getPageSize(), true);
		List<InterFaceInfo> list = interFaceDao.getAllInterFace();
		PageInfo<InterFaceInfo> pi = new PageInfo<InterFaceInfo>(list);
		return pi;
	}

	public boolean addInterFace(InterFaceInfo interFaceInfo) {
		return interFaceDao.addInterFace(interFaceInfo);
	}

	public boolean deleteInterFaceById(int id) {
		return interFaceDao.deleteInterFaceById(id);
	}

	public boolean updateInterFace(InterFaceInfo interFaceInfo) {
		boolean flag=interFaceDao.updateInterFace(interFaceInfo);
		return flag;
	}

	public PageInfo<InterFaceInfo> getAllInterFaces(InterFaceRequestDto dto) {
		PageHelper.startPage(dto.getPageNum(), dto.getPageSize(), true);
		List<InterFaceInfo> list = interFaceDao.getAllInterFaces();
		PageInfo<InterFaceInfo> pi = new PageInfo<InterFaceInfo>(list);
		return pi;
	}

}
