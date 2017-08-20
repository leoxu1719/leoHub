package com.linksite.user.dao;

import com.linksite.user.UserBean;
import com.linksite.user.entity.User;

public interface UserDao {

	public User findUserByInfo(String loginName,String passWord);
}
