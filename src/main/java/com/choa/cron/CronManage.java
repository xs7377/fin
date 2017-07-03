package com.choa.cron;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.choa.attend.AttendService;

@Component
public class CronManage {

	@Inject
	private AttendService attendService;
	
	//초 분 시(0~23)  
	@Scheduled(cron="0 0 0 * * ?" )//자정에 한번 서버가 꺼지는건 신경쓰지 ㄴㄴ  
	public void attendClear() throws Exception{
		int result=attendService.attendClear();
		if(result>0){
			System.out.println("today 초기화 완료");
		}else{
			System.out.println("today 초기화 실패");
		}
	}
	

}
