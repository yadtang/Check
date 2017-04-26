package edu.fjnu.online.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.fjnu.online.dao.QuestionDao;
import edu.fjnu.online.domain.Question;
@Repository
public class QuestionDaoImpl extends BaseDaoImpl< Question> implements QuestionDao {
	public QuestionDaoImpl() {
		this.setNs("edu.fjnu.online.mapper.QuestionMapper.");
	}

	public List<Question> createPaper(Map map) {
		return this.getSqlSession().selectList(this.getNs()+"createPaper", map);
	}
}
