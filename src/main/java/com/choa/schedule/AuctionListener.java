package com.choa.schedule;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AuctionListener implements ServletContextListener {
	@Override
	public void contextDestroyed(ServletContextEvent contextEvent) {
		System.out.println("=====================리스너 종료");
	
	}
	@Override
	public void contextInitialized(ServletContextEvent contextEvent) {
		System.out.println("=====================리스너 시작");
		RealTimeSearch realTimeSearch=new RealTimeSearch();
		realTimeSearch.realTimeSearch();
		
	}
}
