package edu.fjnu.online.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.fjnu.online.dao.ErrorBookDao;
import edu.fjnu.online.domain.ErrorBook;
@Repository
public class ErrorBookDaoImpl extends BaseDaoImpl<ErrorBook> implements ErrorBookDao {

	public ErrorBookDaoImpl() {
		this.setNs("edu.fjnu.online.mapper.ErrorBookMapper.");
	}

	public List<ErrorBook> getBookInfo(Map map) {
		return this.getSqlSession().selectList(this.getNs()+"getBookInfo", map);
	}
}
