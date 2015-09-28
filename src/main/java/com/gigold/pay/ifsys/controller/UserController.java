package com.gigold.pay.ifsys.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gigold.pay.framework.web.ResponseDto;
import com.gigold.pay.ifsys.bo.UserInfo;
import com.gigold.pay.ifsys.service.UserInfoService;
import com.github.pagehelper.PageInfo;

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
