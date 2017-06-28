package com.choa.schedule;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.choa.auction.AuctionService;
import com.choa.auction.SearchDTO;

public class RealTimeProcess implements Job{
	@Inject
	private AuctionService auctionService;
	
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		Date today=new Date();
		SimpleDateFormat df= new SimpleDateFormat("yy/MM/dd");
		String time=df.format(today);
		try {
			List<SearchDTO> searchTop10=auctionService.getSearch();
			auctionService.setRank(searchTop10);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(today.toString()+"=========검색어 업데이트");
	}
}
