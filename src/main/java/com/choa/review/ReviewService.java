package com.choa.review;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.reply.ReplyDTO;

@Service
public class ReviewService {

	@Inject
	private ReviewDAO reviewDAO;
	
	
	public int reviewTotal(Map<String, Object> map) throws Exception{
		return reviewDAO.reviewTotal(map);
	}
	
	
//	글쓰기
	public int reviewInsert(ReviewDTO reviewDTO) throws Exception{
		
		return reviewDAO.reviewInsert(reviewDTO);
	}
	
	//리스트
	public List<ReviewDTO> reviewList(Map<String, Object> map) throws Exception{
		
		return reviewDAO.reviewList(map);
		
	}
	
	//view
	public ReviewDTO reviewView(int num) throws Exception{
		
		ReviewDTO reviewDTO=null;
		reviewDTO=reviewDAO.reviewView(num);
		if(reviewDTO!=null){
		System.out.println("hit update");
		reviewDAO.hitUpdate(num);
		}
		
		
		return reviewDTO;
	}
	
	//update
	public int reviewUpdate(ReviewDTO reviewDTO) throws Exception{
		
		return reviewDAO.reviewUpdate(reviewDTO);
	}
	
	
	
	
	//삭제
	public int reviewDelete(int num) throws Exception{
		return reviewDAO.reviewDelete(num);
	}
	
	
	//답글
	public int reivewReply(Map<String, Object> map) throws Exception{
		System.out.println("service review reply");
		return reviewDAO.reviewReply(map);
	}
	
	
	//대앳글
	//댓글
	public ReplyDTO reply(ReplyDTO replyDTO) throws Exception{
		return reviewDAO.reply(replyDTO);
	}
			
	public List<ReplyDTO> reply_view(int pNum,int lastRow){
		return reviewDAO.reply_view(pNum,lastRow);
	}
			
	
	
}
