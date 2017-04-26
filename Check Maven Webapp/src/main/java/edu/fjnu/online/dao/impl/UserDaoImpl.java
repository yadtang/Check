package edu.fjnu.online.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import edu.fjnu.online.dao.UserDao;
import edu.fjnu.online.domain.User;
@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{
	public UserDaoImpl() {
		this.setNs("edu.fjnu.online.mapper.UserMapper.");			//设置命名空间
	}

	public List<User> findPending(User user) {
		return this.getSqlSession().selectList(this.getNs()+"findPending",user);
	}

	public User getStu(User user) {
		return this.getSqlSession().selectOne(this.getNs()+"getStu",user);
	}

}
