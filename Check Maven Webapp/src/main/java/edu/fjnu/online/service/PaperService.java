package edu.fjnu.online.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;

import edu.fjnu.online.domain.Paper;
import edu.fjnu.online.domain.Question;

public interface PaperService {
	public List<Paper> find(Paper paper);
	public Paper get(Serializable id);
	public void insert(Paper paper);
	public void update(Paper paper);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	/**通过学生编号获取所有的试卷*/
	public List<Paper> getUserPaperById(Serializable id);
	/**查看试卷详情*/
	public Paper getPaperDetail(Map map);
	/**更新用户试卷信息*/
	public void updateUserPaper(Map map);
	/**查询未考试的试卷*/
	public List<Paper> getUndoPaper(Map map);
	/**查询学生未考试的试卷*/
	public List<Paper> qryUndoPaper(Map map);
	public PageInfo<Paper> findAllPage(Paper paper, Integer pageNo,Integer pageSize);
}
