package edu.fjnu.online.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.Grade;

public interface CourseService {
	public List<Course> find(Course course);
	public Course get(int id);
	public void insert(Course course);
	public void update(Course course);
	public void delete(int id);
	public PageInfo<Course> findByPage(Course course, Integer pageNo,Integer pageSize);
}
