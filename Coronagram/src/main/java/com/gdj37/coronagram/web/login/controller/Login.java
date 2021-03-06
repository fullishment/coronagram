package com.gdj37.coronagram.web.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.util.Utils;
import com.gdj37.coronagram.web.login.service.IServiceLogin;

@Controller
public class Login {
	@Autowired
	public IServiceLogin iServiceLogin;
	
	@RequestMapping(value="/login")
	public ModelAndView mLogin (HttpSession session, 
			ModelAndView mav)throws Throwable{
		if(session.getAttribute("sMNo")!=null) {
			mav.setViewName("redirect:main");
		}else {
			mav.setViewName("login/login");
		}
		
		return mav;
	}
	@RequestMapping(value="/logins")
	public ModelAndView mLogins (@RequestParam HashMap<String,String> params, 
			HttpSession session,
			ModelAndView mav)throws Throwable{
		System.out.println(params);
		String mPw =Utils.encryptAES128(params.get("m_pw"));
		params.put("m_pw",mPw);
		System.out.println(params);
		HashMap<String,String> data =iServiceLogin.getMLogin(params);
		System.out.println(data);
		if(data!=null) {
			
			session.setAttribute("sMNo", data.get("M_NO"));
			session.setAttribute("sMNm", data.get("M_NM"));
			session.setAttribute("sMNick", data.get("NICK_NM"));
			session.setAttribute("acctNo", data.get("ACCT_TYPE_NO"));

			System.out.println(session.getAttribute("sMNo"));
			System.out.println(session.getAttribute("sMNick"));
			System.out.println(session.getAttribute("acctNo"));
			mav.setViewName("redirect:main");
		}
		else {
			mav.addObject("msg","아이디나 비밀번호가 틀립니다.");
			mav.setViewName("failed/failed");
		}
		return mav;
	}
	@RequestMapping(value="/logout")
	public ModelAndView mlogout(HttpSession session,ModelAndView mav) {
		
		session.invalidate();
		mav.setViewName("redirect:login");
		
		return mav;
	}
		
}
