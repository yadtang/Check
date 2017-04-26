package edu.fjnu.online.dao;

import java.util.List;

import edu.fjnu.online.domain.User;


public interface UserDao extends BaseDao<User>{

	public List<User> findPending(User user);
	public User getStu(User user);
}
