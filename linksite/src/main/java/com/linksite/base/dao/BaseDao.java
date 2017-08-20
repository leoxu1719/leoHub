package com.linksite.base.dao;

import java.util.List;

import org.hibernate.SessionFactory;

public interface BaseDao<T,ID> {

	public SessionFactory getSessionFactory();
	
	/**根据主键获取实体*/
	public T get(ID id);
	
	/**保存实体*/
	public ID save(T entity);
	
	/**更新实体*/
	public void update(T entity);

	/***删除实体*/
	public void delete(T entity);
	
	/***/
	public void save(List<T> lst);
}
