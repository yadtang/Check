package edu.fjnu.online.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import edu.fjnu.online.dao.CourseDao;
import edu.fjnu.online.domain.Course;
@Repository
public class CourseDaoImpl extends BaseDaoImpl<Course> implements CourseDao {
	public CourseDaoImpl() {
		this.setNs("edu.fjnu.online.mapper.CourseMapper.");
	}
}
