package edu.fjnu.online.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import edu.fjnu.online.domain.Grade;
import edu.fjnu.online.domain.Question;

public interface GradeService {
	public List<Grade> find(Grade grade);
	public Grade get(int id);
	public void insert(Grade grade);
	public void update(Grade grade);
	public void delete(int id);
	public PageInfo<Grade> findByPage(Grade grade, Integer pageNo,Integer pageSize);
}
