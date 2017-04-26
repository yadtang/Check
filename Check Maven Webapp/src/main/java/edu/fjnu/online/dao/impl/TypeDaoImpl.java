package edu.fjnu.online.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import edu.fjnu.online.dao.TypeDao;
import edu.fjnu.online.domain.Type;
@Repository
public class TypeDaoImpl extends BaseDaoImpl<Type> implements TypeDao{

	public TypeDaoImpl() {
		this.setNs("edu.fjnu.online.mapper.TypeMapper.");
	}

}
