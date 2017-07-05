package com.choa.schedule;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.choa.auction.AuctionService;
import com.choa.auction.SearchDTO;

public class RealTime {
	@Autowired
	AuctionService auctionService;
	 public void realTime()  {
		 Date today=new Date();
			SimpleDateFormat df= new SimpleDateFormat("yy/MM/dd");
			String time=df.format(today);
			try {
				List<SearchDTO> searchTop10=auctionService.getSearch();
				auctionService.setRank(searchTop10);
				//auctionService.auction();
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			System.out.println(today.toString()+"=========쿼츠 작동 시간");

		  }
}
