package edu.fjnu.online.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.online.dao.CourseDao;
import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.Grade;
import edu.fjnu.online.service.CourseService;
@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	CourseDao courseDao;
	public List<Course> find(Course course) {
		return courseDao.find(course);
	}

	public Course get(int id) {
		return courseDao.get(id);
	}

	public void insert(Course course) {
		courseDao.insert(course);
	}

	public void update(Course course) {
		courseDao.update(course);
	}

	public void delete(int id) {
		courseDao.delete(id);		
	}

	public PageInfo<Course> findByPage(Course course, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Course> list = courseDao.find(course);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<Course> page = new PageInfo<Course>(list);
	    return page;
	}

}
