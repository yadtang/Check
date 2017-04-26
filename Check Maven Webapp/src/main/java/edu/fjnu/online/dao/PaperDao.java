package edu.fjnu.online.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import edu.fjnu.online.domain.Paper;

public interface PaperDao extends BaseDao<Paper> {
	/**
	 * 通过学生编号获取所有的试卷
	 * @param id
	 * @return
	 */
	public List<Paper> getUserPaperById(Serializable id);
	/**查看试卷详情*/
	public Paper getPaperDetail(Map map);
	
	/**更新用户试卷信息*/
	public void updateUserPaper(Map map);
	/**查询未考试的试卷*/
	public List<Paper> getUndoPaper(Map map);
	/**查询学生未考试的试卷*/
	public List<Paper> qryUndoPaper(Map map);
}
