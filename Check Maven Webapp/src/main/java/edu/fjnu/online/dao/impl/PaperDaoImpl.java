package edu.fjnu.online.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.fjnu.online.dao.PaperDao;
import edu.fjnu.online.domain.Paper;
@Repository
public class PaperDaoImpl extends BaseDaoImpl<Paper> implements PaperDao{
	public PaperDaoImpl() {
		this.setNs("edu.fjnu.online.mapper.PaperMapper.");
	}

	public List<Paper> getUserPaperById(Serializable id) {
		return this.getSqlSession().selectList(this.getNs()+"getUserPaperById", id);
	}

	public Paper getPaperDetail(Map map) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(this.getNs()+"getPaperDetail", map);
	}

	public void updateUserPaper(Map map) {
		// TODO Auto-generated method stub
		this.getSqlSession().selectOne(this.getNs()+"updateUserPaper", map);
	}

	public List<Paper> getUndoPaper(Map map) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(this.getNs()+"getUndoPaper", map);
	}

	public List<Paper> qryUndoPaper(Map map) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(this.getNs()+"qryUndoPaper", map);
	}
}
