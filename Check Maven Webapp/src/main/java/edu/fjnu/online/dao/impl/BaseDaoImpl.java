package edu.fjnu.online.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import edu.fjnu.online.dao.BaseDao;

public abstract class BaseDaoImpl<T> extends SqlSessionDaoSupport implements BaseDao<T>{
	@Autowired
	//mybatis-spring 1.0无需此方法；mybatis-spring1.2必须注入。
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	private String ns;		//命名空间
	public String getNs() {
		return ns;
	}
	public void setNs(String ns) {
		this.ns = ns;
	}

	public List<T> find(T entiy) {
		List<T> oList = this.getSqlSession().selectList(ns + "find", entiy);
		return oList;
	}
	public T get(Serializable id) {
		return this.getSqlSession().selectOne(ns + "get", id);
	}

	public void insert(T entity) {
		this.getSqlSession().insert(ns + "insert", entity);
	}

	public void update(T entity) {
		this.getSqlSession().update(ns + "update", entity);
	}

	public void delete(Serializable id) {
		this.getSqlSession().delete(ns + "delete", id);
	}

	public void delete(Serializable[] ids) {
		this.getSqlSession().delete(ns + "deleteBatch", ids);
	}
}
