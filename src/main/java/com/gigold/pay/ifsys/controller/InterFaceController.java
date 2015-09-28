package com.gigold.pay.ifsys.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gigold.pay.ifsys.bo.InterFaceInfo;
import com.gigold.pay.ifsys.service.InterFaceService;
import com.github.pagehelper.PageInfo;

@Controller
public class InterFaceController {
	@Autowired
	InterFaceService interFaceService;

	/**
	 * 跳转到新增页面
	 * 
	 * @return
	 * 
	 */
	@RequestMapping("/goAddInterFace")
	public String goAddInterFace() {
		return "addInterFace";
	}

	/**
	 * 跳转到查询页
	 * 
	 * @return
	 */
	@RequestMapping("/goQueryPanel")
	public String goQueryPanel() {
		return "main";
	}

	/**
	 * 根据Id获取接口明细信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/queryDetailById/{id}")
	public ModelAndView queryDetailById(@PathVariable int id) {
		InterFaceInfo info = interFaceService.getInterFaceById(id);
		ModelAndView mv = new ModelAndView();
		// 添加模型数据 可以是任意的POJO对象
		mv.addObject("interFaceInfo", info);
		// 设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
		mv.setViewName("interFaceDetail");
		return mv;
	}

	/**
	 * 根据Id获取接口明细信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getUpdateInterFaceById/{id}")
	public ModelAndView getUpdateInterFaceById(@PathVariable int id) {
		InterFaceInfo info = interFaceService.getInterFaceById(id);
		ModelAndView mv = new ModelAndView();
		// 添加模型数据 可以是任意的POJO对象
		mv.addObject("interFaceInfo", info);
		// 设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
		mv.setViewName("interFaceUpdate");
		return mv;
	}

	/**
	 * 根据名称模糊查询
	 * 
	 * @param interFaceInfo
	 * @return
	 */
	@RequestMapping("/queryByName")
	public @ResponseBody InterFaceResponseDto queryByName(InterFaceRequestDto dto) {
		PageInfo<InterFaceInfo> pageInfo = interFaceService.getInterFaceByName(dto);
		InterFaceResponseDto idto = new InterFaceResponseDto();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", pageInfo);
		idto.setMessageInfo(map);
		return idto;

	}

	/**
	 * 分页查询
	 * 
	 * @param dto
	 * @return
	 */

	@RequestMapping("/getAllInterFace")
	public @ResponseBody InterFaceResponseDto getAllInterFace(InterFaceRequestDto dto) {
		PageInfo<InterFaceInfo> pageInfo = interFaceService.getAllInterFace(dto);
		InterFaceResponseDto idto = new InterFaceResponseDto();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", pageInfo);
		idto.setMessageInfo(map);
		return idto;

	}


	/**
	 * 新增接口纪录
	 * 
	 * @param interFaceInfo
	 * @return
	 */

	@RequestMapping("/addInterface")
	public @ResponseBody InterFaceResponseDto addInterface(InterFaceInfo interFaceInfo) {
		boolean flag = interFaceService.addInterFace(interFaceInfo);
		InterFaceResponseDto idto = new InterFaceResponseDto();
		Map<String, Object> map = new HashMap<String, Object>();
		if (flag) {
			map.put("success", true);
			map.put("id", interFaceInfo.getId());
			
		} else {
			map.put("success", false);
		}
		idto.setMessageInfo(map);

		return idto;

	}

	/**
	 * 删除接口
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteInterFaceById")
	public @ResponseBody InterFaceResponseDto deleteInterFace(int id) {
		boolean flag = interFaceService.deleteInterFaceById(id);
		InterFaceResponseDto idto = new InterFaceResponseDto();
		Map<String, Object> map = new HashMap<String, Object>();
		if (flag) {
			map.put("success", true);
			
		} else {
			map.put("success", false);
		}
		idto.setMessageInfo(map);
		return idto;

	}

	/**
	 * 修改接口
	 * 
	 * @param interFaceInfo
	 * @return
	 */
	@RequestMapping("/updateInterFace")
	public @ResponseBody InterFaceResponseDto updateInterFace(InterFaceInfo interFaceInfo) {
		boolean flag = interFaceService.updateInterFace(interFaceInfo);
		InterFaceResponseDto idto = new InterFaceResponseDto();
		Map<String, Object> map = new HashMap<String, Object>();
		if (flag) {
			map.put("success", true);
			
		} else {
			map.put("success", false);
		}
		idto.setMessageInfo(map);
		return idto;

	}

}
