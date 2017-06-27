package com.choa.schedule;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class RealTimeProcess implements Job{
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		Date today=new Date();
		SimpleDateFormat df= new SimpleDateFormat("yy/MM/dd");
		String time=df.format(today);
		
		//System.out.println(today.toString());
	}
}
