package com.linksite.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.loader.custom.Return;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class UserContext {

	
	private static Logger logger = Logger.getLogger(UserContext.class);
	
	private static HttpServletRequest getReq(){
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	}
	
	public static HttpServletRequest getRequest(){	
		return getReq();
	}
	
	public static HttpSession getSession(){
		return getReq().getSession();
	}
	
	
	/**
	 * 获取当前用户*/
	public static UserBean getUser(){
		try {
			if(getReq()!=null){
				return (UserBean)getSession().getAttribute("SESSION_KEY_USER");
			}
		}catch (Exception e) {
			logger.error(e);
		}
		return null;
	}

}
