package edu.fjnu.online.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fjnu.online.dao.ErrorBookDao;
import edu.fjnu.online.domain.ErrorBook;
import edu.fjnu.online.service.ErrorBookService;
@Service
public class ErrorBookServiceImpl implements ErrorBookService {

	@Autowired
	ErrorBookDao bookDao;
	public List<ErrorBook> find(ErrorBook errorBook) {
		return bookDao.find(errorBook);
	}

	public ErrorBook get(int id) {
		return bookDao.get(id);
	}

	public void insert(ErrorBook errorBook) {
		bookDao.insert(errorBook);
	}

	public void update(ErrorBook errorBook) {
		bookDao.update(errorBook);
	}

	public void delete(int id) {
		bookDao.delete(id);
	}

	public List<ErrorBook> getBookInfo(Map map) {
		return bookDao.getBookInfo(map);
	}

}
