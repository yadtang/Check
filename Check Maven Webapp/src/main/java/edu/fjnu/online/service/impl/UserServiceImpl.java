package edu.fjnu.online.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.online.dao.UserDao;
import edu.fjnu.online.domain.Question;
import edu.fjnu.online.domain.User;
import edu.fjnu.online.service.UserService;
import edu.fjnu.online.util.MD5Util;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	public List<User> find(User user) {
		// TODO Auto-generated method stub
		return userDao.find(user);
	}

	public User get(Serializable id) {
		// TODO Auto-generated method stub
		return userDao.get(id);
	}

	public void insert(User user) {
		String userPwd = user.getUserPwd();
		//密码加密
		userPwd = MD5Util.getData(userPwd);
		user.setUserPwd(userPwd);
		userDao.insert(user);
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		userDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		
	}

	public User login(User user) {
		// TODO Auto-generated method stub
		User u = get(user.getUserId());
		if(u!=null){
			String userPwd = MD5Util.getData(user.getUserPwd());
			if(userPwd.equals(u.getUserPwd())){
				return u;
			}
		}
		return null;
	}

	public List<User> findPending(User user) {
		// TODO Auto-generated method stub
		return userDao.findPending(user);
	}

	public User getStu(User user) {
		// TODO Auto-generated method stub
		return userDao.getStu(user);
	}

	public PageInfo<User> findByPage(User user, Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<User> list = userDao.find(user);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<User> page = new PageInfo<User>(list);
	    return page;
	}

	public PageInfo<User> findPendingByPage(User user, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<User> list = userDao.findPending(user);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<User> page = new PageInfo<User>(list);
	    return page;
	}

}
