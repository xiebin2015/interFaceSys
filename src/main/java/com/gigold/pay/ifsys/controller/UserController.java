package com.gigold.pay.ifsys.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gigold.pay.framework.web.ResponseDto;
import com.gigold.pay.ifsys.bo.UserInfo;
import com.gigold.pay.ifsys.service.UserInfoService;
import com.github.pagehelper.PageInfo;
import com.sun.tools.internal.ws.processor.model.Request;

@Controller
public class UserController {
	@Autowired
	UserInfoService userInfoService;

	@RequestMapping("/")
	public String index() {
		return "login";
	}

	@RequestMapping(value = "/login")
	public ModelAndView login(UserInfo user, HttpSession session) {
		user = userInfoService.login(user);
		ModelAndView mv = new ModelAndView();
		if (user == null) {
			mv.setViewName("failure");
		} else {
			session.setAttribute("userInfo", user);
			mv.setViewName("redirect:goQueryPanel");
		}

		return mv;
	}

	
	@RequestMapping(value = "/login2",method=RequestMethod.POST)
	public @ResponseBody UserResDto login2( UserInfo user, HttpSession session) {
		System.out.println(user.getLoginName());
		user = userInfoService.login(user);
		UserResDto dto=new UserResDto();
		if (user == null) {
			dto.setRspCd(CodeItem.ITERACE_FAILURE);
		} else {
			session.setAttribute("userInfo", user);
			dto.setUserInfo(user);
			dto.setRspCd(CodeItem.ITERACE_SUCCESS);
		}

		return dto;
	}
	
	
	
	@RequestMapping("/addUser")
	public String addUser(UserInfo userInfo) {
		boolean flag = userInfoService.addUser(userInfo);
		if (flag) {
			return "main";
		}
		return "index";
	}

	@RequestMapping("/list")
	public @ResponseBody ResponseDto getList() {
		PageInfo<UserInfo> pinfo = userInfoService.getList();
		UserInfoDto pd = new UserInfoDto();
		pd.setPinfo(pinfo);
		return pd;
	}

}
