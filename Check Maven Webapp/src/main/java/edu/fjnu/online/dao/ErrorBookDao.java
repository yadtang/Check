package edu.fjnu.online.dao;

import java.util.List;
import java.util.Map;

import edu.fjnu.online.domain.ErrorBook;
import edu.fjnu.online.domain.Question;

public interface ErrorBookDao extends BaseDao<ErrorBook>{
	public List<ErrorBook> getBookInfo(Map map);
}
