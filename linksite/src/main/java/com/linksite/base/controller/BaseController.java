package com.linksite.base.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.linksite.user.UserBean;
import com.linksite.user.UserContext;
import com.linksite.utils.Page;

@Controller
@RequestMapping("base")
public class BaseController {

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected Page queryPage;
	protected UserBean userBean;
	
	
	public final static String LOGOUT = "logout";
	public final static String LOGIN = "login";
	public final static String INPUT = "input";
	public final static String ERROR = "error";
	
	
	/**
	 * */
	@ModelAttribute
	public void commonModel(HttpServletRequest request, HttpServletResponse response){
		
		this.request = request;
		this.response = response;
		userBean = UserContext.getUser();
		if(request.getParameter("rows")!=null){
			queryPage = new Page(request);
			queryPage.setPage(Integer.parseInt(request.getParameter("page")));
			queryPage.setPage(Integer.parseInt(request.getParameter("rows")));
		}
		
		if(userBean == null){
			userBean = new UserBean();
		}
		
	}
	
	@ExceptionHandler({Exception.class})
	public void exception(Exception e, HttpServletResponse response){
		e.printStackTrace();
	}
	
}
