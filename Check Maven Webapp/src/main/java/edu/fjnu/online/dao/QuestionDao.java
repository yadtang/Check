package edu.fjnu.online.dao;

import java.util.List;
import java.util.Map;

import edu.fjnu.online.domain.Question;

public interface QuestionDao extends BaseDao<Question>{

	public List<Question> createPaper(Map map);
}
