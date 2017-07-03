package com.choa.schedule;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StartQuartz {
	public void test(){
		new ClassPathXmlApplicationContext("quartz-context.xml");
	}
}
