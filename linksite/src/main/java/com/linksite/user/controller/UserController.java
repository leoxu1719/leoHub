package com.linksite.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.linksite.base.controller.BaseController;
import com.linksite.user.UserBean;
import com.linksite.user.services.UserService;

@Controller
@RequestMapping("user")
public class UserController extends BaseController{

	@Autowired
	private UserService userService;
	
	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response){
		
		
		
		Cookie[] xx = request.getCookies();
		for(int i =0; i<xx.length;i++){
			if("leo".equals(xx[i].getName())){
				System.out.println("the cookie name is ["+xx[i].getName()+"],the value is +["+xx[i].getValue()+"]");
			}
		}
		
		
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("passWord");
		
		UserBean userBean = userService.login(loginName, password);
		
		
		
		return ("/index");
	}
	
	@RequestMapping("test")
	public String test(HttpServletRequest request, HttpServletResponse response){
		
		Cookie[] xx = request.getCookies();
		for(int i =0; i<xx.length;i++){
			if("leo".equals(xx[i].getName())){
				System.out.println("the cookie name is ["+xx[i].getName()+"],the value is +["+xx[i].getValue()+"]");
			}
		}	
		return "/index"; 
	}

}


