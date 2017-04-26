package edu.fjnu.online.common.springdao;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AppContext {
	private static AppContext instance;
	public static String[] paths = {"/nu-template-dao.xml"};		//指定自己的配置文件
	private AbstractApplicationContext appContext;

	public synchronized static AppContext getInstance() {
		if (instance == null) {
			instance = new AppContext();
		}
		return instance;
	}

	private AppContext() {
		this.appContext = new ClassPathXmlApplicationContext(paths);
	}

	public AbstractApplicationContext getAppContext() {
		return appContext;
	} 

}