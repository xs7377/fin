package com.choa.review;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choa.reply.ReplyDAO;
import com.choa.reply.ReplyDTO;
import com.sun.org.apache.regexp.internal.recompile;

@Repository
public class ReviewDAO {

	@Inject
	private ReplyDAO replyDAO;
	
	@Inject
	private SqlSession sqlSession;
	private static String NAMESPACE="ReviewMapper.";
	
	
	//카운트
	public int reviewTotal(Map<String , Object> map) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reviewTotal", map);
	}
	
	//	글쓰기
	public int reviewInsert(ReviewDTO reviewDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+"reviewInsert", reviewDTO);
	}
	
	//리스트
	public List<ReviewDTO> reviewList(Map<String, Object> map) throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"reviewList", map);
		
	}
	
	//view
	public ReviewDTO reviewView(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reviewView", num);
	}
	//hitupdate
	public int hitUpdate(int num) throws Exception{
		return sqlSession.update(NAMESPACE+"hitUpdate", num);
	}
	
	
	
	//update
	public int reviewUpdate(ReviewDTO reviewDTO) throws Exception{
		
		return sqlSession.update(NAMESPACE+"reviewUpdate", reviewDTO);
	}
	
	//삭제
	public int reviewDelete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"reviewDelete", num);
	}
	
	
	//답글
	public int reviewReply(Map<String, Object> map) throws Exception{
		System.out.println("DAO review reply");
		return sqlSession.insert(NAMESPACE+"reviewReply", map);
	}

	
	//댓글
	public ReplyDTO reply(ReplyDTO replyDTO){
			replyDTO.setKind("review");
			return this.replyDAO.reply(replyDTO);
	}
		public List<ReplyDTO> reply_view(int pNum, int lastRow){
			ReplyDTO replyDTO = new ReplyDTO();
			replyDTO.setKind("review");
			replyDTO.setpNum(pNum);
			return this.replyDAO.reply_view(lastRow,replyDTO);
		}
	
	
	
	
	
}
