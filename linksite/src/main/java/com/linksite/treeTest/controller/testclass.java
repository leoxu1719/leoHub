package com.linksite.treeTest.controller;

import org.junit.Test;

import com.linksite.treeTest.TstObj.TreeNode;
import com.linksite.user.UserBean;
import com.linksite.user.entity.User;

public class testclass {

	UserBean xBean = new UserBean();
	UserBean xBean2 = new UserBean();
	User user = new User();
	
	
	
	@Test
	public void xx(){
		
		
		
		xBean.setId(999l);
		
		aa(null);
	}
	
	
	
	private void aa(Object x){
	
		System.out.println(x.getClass() == UserBean.class);
		
		if(x.getClass() == UserBean.class){
			UserBean aBean = (UserBean) x;
			System.out.println("the value is:"+aBean.getId());
		}
	}	
}
