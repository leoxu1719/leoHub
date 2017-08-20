package com.linksite.user.services;

import com.linksite.user.UserBean;

public interface UserService {

	public UserBean login(String loginName, String passWord);
}
