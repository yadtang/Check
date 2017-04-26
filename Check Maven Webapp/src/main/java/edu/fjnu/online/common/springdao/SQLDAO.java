package edu.fjnu.online.common.springdao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;

import edu.fjnu.online.util.UtilFuns;

/*
 * 执行sql语句类
 * 调用方法：
 * 引入配置问题 
 * SQLDAO sqlDao = (SQLDAO)AppContext.getInstance().getAppContext().getBean("sqlDao");
 * 
 */
public class SQLDAO {
	private static Logger log = Logger.getLogger(SQLDAO.class);
	private UtilFuns utilFuns = new UtilFuns();
    private JdbcTemplate jdbcTemplate;
    
	public void setDataSource(DataSource ds){
		jdbcTemplate = new JdbcTemplate(ds);
	}

	public int findInt(String sql){
		log.debug(sql);
		int i = jdbcTemplate.queryForInt(sql);
		return i;
	}
	
	public int findInt(String sql, Object[] objs){
		log.debug(sql);
		int i = jdbcTemplate.queryForInt(sql, objs);
		return i;
	}
	
	//返回单值
	public String getSingleValue(String sql){
		log.debug(sql);
		StringBuffer sBuf = new StringBuffer();
		List jlist = jdbcTemplate.queryForList(sql);
		Iterator ite = jlist.iterator();
        while(ite.hasNext()){
            Map map = (Map)ite.next();
            for(Object o:map.keySet()){
            	sBuf.append(String.valueOf(map.get(o))).append(",");
            }
        }
        if(sBuf!=null && sBuf.length()>1){
        	sBuf.delete(sBuf.length()-1, sBuf.length());	//del last char
        }
		return sBuf.toString();
	}
	
	public String getSingleValue(String sql, Object[] objs){
		log.debug(sql);
		StringBuffer sBuf = new StringBuffer();
		List jlist = null;
		if(utilFuns.arrayValid(objs)){
			jlist = jdbcTemplate.queryForList(sql, objs);
		} else {
			jlist = jdbcTemplate.queryForList(sql);
		}
		Iterator ite = jlist.iterator();
		while(ite.hasNext()){
            Map map = (Map)ite.next();
            for(Object o:map.keySet()){
            	sBuf.append(String.valueOf(map.get(o))).append(",");
            }
        }
        if(sBuf!=null && sBuf.length()>1){
        	sBuf.delete(sBuf.length()-1, sBuf.length());	//del last char
        }
		return sBuf.toString();
	}
	
	public String[] toArray(String sql){
		log.debug(sql);
		String[] strs = null;
		List aList = this.executeSQL(sql);
		if(aList.size()>0){
			int count = aList.size();
			strs = new String[ count ];
			for(int i=0; i<count; i++) {
				strs[ i ] = String.valueOf(aList.get(i));
			}
			return strs;
		}else{
			return null;
		}
	}
	
	public List executeSQL(String sql){
		log.debug(sql);
		List<String> aList = new ArrayList();
		List jlist = jdbcTemplate.queryForList(sql);
		Iterator ite = jlist.iterator();
		while(ite.hasNext()){
			Map map = (Map)ite.next();
			for(Object o:map.keySet()){
				if(map.get(o.toString())==null){
					aList.add("");		//对象不存在时，写空串
				}else{
					aList.add(map.get(o.toString()).toString());
				}
			}
		}
		return aList;
	}
	
	public List executeSQL(String sql, Object[] objs){
		log.debug(sql);
		List aList = new ArrayList();
		List jlist = null;
		if(utilFuns.arrayValid(objs)){
			jlist = jdbcTemplate.queryForList(sql, objs);
		} else {
			jlist = jdbcTemplate.queryForList(sql);
		}
		Iterator ite = jlist.iterator();
		while(ite.hasNext()){
            Map map = (Map)ite.next();
            for(Object o:map.keySet()){
            	aList.add((String)map.get(o));
            }
        }
        return aList;
	}
	
	public List executeSQLForList(String sql, Object[] objs){
		log.debug(sql);
		List aList = new ArrayList();
		List jlist = null;
		if(utilFuns.arrayValid(objs)){
			jlist = jdbcTemplate.queryForList(sql, objs);
		} else {
			jlist = jdbcTemplate.queryForList(sql);
		}
		
		Iterator ite = jlist.iterator();
		
		List list;
		
		while(ite.hasNext()){
            Map map = (Map)ite.next();
            list = new ArrayList();
            
            for(Object o:map.keySet()){
            	list.add(map.get(o));
            }
            aList.add(list.toArray());
        }
		
		return aList;
	}
	
	public int updateSQL(String sql){
		log.debug(sql);
		int i = jdbcTemplate.update(sql);
		return i;
	}
	
	public int updateSQL(String sql, Object[] objs){
		log.debug(sql);
		int i = jdbcTemplate.update(sql, objs);
		return i;
	}
	
	public int[] batchSQL(String[] sql){
		log.debug(sql);
		return jdbcTemplate.batchUpdate(sql);
	}
}
