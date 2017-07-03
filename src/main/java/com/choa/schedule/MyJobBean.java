package com.choa.schedule;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class MyJobBean extends  QuartzJobBean{
	    private RealTime realTime;
	    @Override
	    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
	       realTime.realTime();
	    }
		public void setRealTime(RealTime realTime) {
			this.realTime = realTime;
		}
	    
}
