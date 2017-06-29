package com.choa.fin;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.choa.auction.AuctionDAO;
import com.choa.auction.AuctionDTO;
import com.choa.upload.UploadDTO;

public class FinalTest extends AbstractTest {

	@Inject
	private AuctionDAO auctionDAO;
	@Test
	public void test() {
		for(int i=0;i<60;i++){
			AuctionDTO auctionDTO=new AuctionDTO();
			
			auctionDTO.setCategory("도서,도서,도서");
			auctionDTO.setReply("y");
			auctionDTO.setPrimeum("y");
			auctionDTO.setMin_price(10000);
			auctionDTO.setMax_price(20000);
			auctionDTO.setPeriod("2017-6-30,00:00");
			auctionDTO.setM_id("t"+i);
			auctionDTO.setTitle("t"+i);
			auctionDTO.setContents("t"+i);
			List<UploadDTO> imgs=new ArrayList<UploadDTO>();
			try {
				auctionDAO.write(auctionDTO, imgs);
			} catch (Exception e) {
				// TODO: handle exception
			}
		
		}
	}

}
