package com.choa.member;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.choa.auction.AuctionService;

@Component
public class AcutionDelete {

	@Scheduled(cron = "0 0 11 * * ?")
	public void auctionDelete() throws Exception{
		AuctionService auctionService = new AuctionService();
		
		Calendar today = Calendar.getInstance(); //오늘 날짜 출력
		today.add(Calendar.MONTH, -3);
		Date date = today.getTime();
		
		SimpleDateFormat format = new SimpleDateFormat("YY/MM/DD");
		String beforeDate = format.format(date); //오늘로부터 3개월 전 날짜
		
		int result = auctionService.threeMonthDelete(beforeDate);
	}
}