package edu.fjnu.online.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;

import edu.fjnu.online.domain.Question;

public interface QuestionService {
	public List<Question> find(Question question);
	public Question get(int id);
	public void insert(Question question);
	public void update(Question question);
	public void delete(int id);
	public List<Question> createPaper(Map map);
	public PageInfo<Question> findByPage(Question question, Integer pageNo,Integer pageSize);
}
