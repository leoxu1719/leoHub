package com.linksite.user.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.linksite.base.dao.BaseDaoImpl;
import com.linksite.user.entity.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User, Long> implements UserDao{

	@Override
	public User findUserByInfo(String loginName, String passWord) {
		
		String sql = "select * from t_sys_user where login_name = ? and password = ?";
		List<User> userList =  this.findBySQL(sql, loginName,passWord);
		if(userList.size() != 1){
			return null;
		}
		return userList.get(0);
	}

}
