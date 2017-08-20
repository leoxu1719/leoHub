package com.linksite.base.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDaoImpl<T,ID extends Serializable> implements BaseDao<T, ID>{

	private SessionFactory SessionFactory;
	@Override
	public SessionFactory getSessionFactory() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.SessionFactory = sessionFactory;
	}
	
	private Session getCurrentSession(){
		try {
			return this.SessionFactory.getCurrentSession();			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	protected Class<T> getEntityClass(){
		return (Class<T>)((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
	protected String getEntityName() {
		return ((Class<T>)((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getName();
	}

	@Override
	public T get(ID id) {
		if(id==null){
			return null;
		}
		return (T)this.getCurrentSession().get(this.getEntityName(), id);
	}
	

	@Override
	public ID save(T entity) {
		return (ID)this.getCurrentSession().save(entity);
	}

	@Override
	public void update(T entity) {
		this.getCurrentSession().update(entity);
	}

	@Override	
	public void delete(T entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void save(List<T> lst) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
		
	protected List<T> findBySQL(final String sql,final Object... params){
	
		Query query  = this.getCurrentSession().createSQLQuery(sql).addEntity(getEntityName());
		if(params !=null && params.length >0){
			for(int i = 0;i<params.length;i++){
				query.setParameter(i, params[i]);
			}
		}
		return query.list();
	}
	
}
	
	
	
	
	
	

