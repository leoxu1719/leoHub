package com.linksite.user.services;

import java.lang.reflect.InvocationTargetException;


import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linksite.user.UserBean;
import com.linksite.user.dao.UserDao;
import com.linksite.user.entity.User;
import com.linksite.utils.StringUtil;

@Service("userService")
public class UserServiceImpl implements UserService{

	private static Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public UserBean login(String loginName, String passWord) {
		
		if(StringUtils.isBlank(loginName) || StringUtils.isBlank(passWord)){
			return null;
		}
		
		User user = userDao.findUserByInfo(loginName, passWord);
		
		if(user != null){
			UserBean userBean = new UserBean();
			BeanUtils.copyProperties(user, userBean);
			return userBean;
		}else{
			logger.info(loginName + " 登录失败");
			return null;
		}
	}
	
	


}
