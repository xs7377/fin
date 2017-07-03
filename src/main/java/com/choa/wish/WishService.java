package com.choa.wish;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.reply.ReplyDTO;

@Service
public class WishService {
	@Inject
	private WishDAO wishDAO;
	
	//count
	public int wishCount() throws Exception{
		
		return wishDAO.wishCount();
	}
	
	
	//LIST
		public List<WishDTO> wishList(Map<String, Object> map) throws Exception{
			return wishDAO.wishList(map);
		}
		
		//WRITE
		public int wishWrite(WishDTO wishDTO) throws Exception{
			return wishDAO.wishWrite(wishDTO);
		}
		
		//View
		public WishDTO wishView(int num) throws Exception{
			return wishDAO.wishView(num);
		}
		
		//mod
		public int wishMod(WishDTO wishDTO) throws Exception{
			return wishDAO.wishMod(wishDTO);
		}
		//del
		public int wishDel(int num) throws Exception{
			return wishDAO.wishDel(num);
		}
		//답글
		public int wishReply(Map<String, Object> map) throws Exception{
			System.out.println("service wish reply");
			return wishDAO.wishReply(map);
		}
		
		//댓글
		public ReplyDTO reply(ReplyDTO replyDTO) throws Exception{
			return wishDAO.reply(replyDTO);
		}
		
		public List<ReplyDTO> reply_view(int pNum,int lastRow){
			return wishDAO.reply_view(pNum,lastRow);
		}
		
}
