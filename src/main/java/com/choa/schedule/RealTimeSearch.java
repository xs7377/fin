package com.choa.schedule;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;

import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;
import static org.quartz.CronScheduleBuilder.*;

public class RealTimeSearch {
	public void realTimeSearch(){
		try {
			Scheduler scheduler= StdSchedulerFactory.getDefaultScheduler();
			scheduler.start();
			
			JobDetail job=newJob(RealTimeProcess.class)
					.withIdentity("job1", "group1")
					.build();
			Trigger trigger= newTrigger()
					.withIdentity("trigger1", "group1")
					.withSchedule(cronSchedule("0 0/1 * * * ?"))
					.build();
			scheduler.scheduleJob(job,trigger);
			Thread.sleep(1000);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
