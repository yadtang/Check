package edu.fjnu.online.service;

import java.util.List;
import java.util.Map;

import edu.fjnu.online.domain.ErrorBook;

public interface ErrorBookService {
	public List<ErrorBook> find(ErrorBook errorBook);
	public ErrorBook get(int id);
	public void insert(ErrorBook errorBook);
	public void update(ErrorBook errorBook);
	public void delete(int id);
	public List<ErrorBook> getBookInfo(Map map);
}
