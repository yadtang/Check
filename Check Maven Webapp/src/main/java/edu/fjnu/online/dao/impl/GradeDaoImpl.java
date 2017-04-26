package edu.fjnu.online.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import edu.fjnu.online.dao.GradeDao;
import edu.fjnu.online.domain.Grade;
@Repository
public class GradeDaoImpl extends BaseDaoImpl<Grade> implements GradeDao{

	public GradeDaoImpl() {
		this.setNs("edu.fjnu.online.mapper.GradeMapper.");
	}
}
