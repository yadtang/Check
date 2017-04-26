package edu.fjnu.online.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.online.dao.QuestionDao;
import edu.fjnu.online.domain.Question;
import edu.fjnu.online.service.QuestionService;
@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionDao questionDao;
	
	public List<Question> find(Question question) {
		return questionDao.find(question);
	}

	public Question get(int id) {
		return questionDao.get(id);
	}

	public void insert(Question question) {
		questionDao.insert(question);
	}

	public void update(Question question) {
		questionDao.update(question);
	}

	public void delete(int id) {
		questionDao.delete(id);
	}

	public List<Question> createPaper(Map map) {
		// TODO Auto-generated method stub
		return questionDao.createPaper(map);
	}

	public PageInfo<Question> findByPage(Question question, Integer pageNo,
			Integer pageSize) {
		
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Question> list = questionDao.find(question);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<Question> page = new PageInfo<Question>(list);
	    return page;
	}

}
