package edu.fjnu.online.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.online.dao.GradeDao;
import edu.fjnu.online.domain.Grade;
import edu.fjnu.online.domain.Paper;
import edu.fjnu.online.service.GradeService;
@Service
public class GradeServiceImpl implements GradeService{

	@Autowired
	GradeDao gradeDao;
	
	public List<Grade> find(Grade grade) {
		return gradeDao.find(grade);
	}

	public Grade get(int id) {
		return gradeDao.get(id);
	}

	public void insert(Grade grade) {
		gradeDao.insert(grade);
	}

	public void update(Grade grade) {
		gradeDao.update(grade);
	}

	public void delete(int id) {
		gradeDao.delete(id);		
	}

	public PageInfo<Grade> findByPage(Grade grade, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Grade> list = gradeDao.find(grade);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<Grade> page = new PageInfo<Grade>(list);
	    return page;
	}

}
