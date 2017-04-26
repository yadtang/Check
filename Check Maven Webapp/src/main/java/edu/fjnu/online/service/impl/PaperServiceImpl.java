package edu.fjnu.online.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.online.dao.PaperDao;
import edu.fjnu.online.domain.Paper;
import edu.fjnu.online.domain.Question;
import edu.fjnu.online.service.PaperService;
@Service
public class PaperServiceImpl implements PaperService {

	@Autowired
	PaperDao paperDao;
	public List<Paper> find(Paper paper) {
		return paperDao.find(paper);
	}

	public Paper get(Serializable id) {
		return paperDao.get(id);
	}

	public void insert(Paper paper) {
		paperDao.insert(paper);
	}

	public void update(Paper paper) {
		paperDao.update(paper);
	}

	public void delete(Serializable id) {
		paperDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		paperDao.delete(ids);
	}

	public List<Paper> getUserPaperById(Serializable id) {
		// TODO Auto-generated method stub
		return paperDao.getUserPaperById(id);
	}

	public Paper getPaperDetail(Map map) {
		// TODO Auto-generated method stub
		return paperDao.getPaperDetail(map);
	}

	public void updateUserPaper(Map map) {
		// TODO Auto-generated method stub
		paperDao.updateUserPaper(map);
	}

	public List<Paper> getUndoPaper(Map map) {
		// TODO Auto-generated method stub
		return paperDao.getUndoPaper(map);
	}

	public List<Paper> qryUndoPaper(Map map) {
		// TODO Auto-generated method stub
		return paperDao.qryUndoPaper(map);
	}

	public PageInfo<Paper> findAllPage(Paper paper, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Paper> list = paperDao.find(paper);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<Paper> page = new PageInfo<Paper>(list);
	    return page;
	}

}
