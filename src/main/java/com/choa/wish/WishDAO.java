package com.choa.wish;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choa.reply.ReplyDAO;
import com.choa.reply.ReplyDTO;

@Repository
public class WishDAO {
	
	
	@Inject
	private ReplyDAO replyDAO;
	
	@Inject
	private SqlSession sqlSession;
	private static String NAMESPACE="WishMapper.";
	
	//totalCount
	public int wishCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"wishCount");
	}
	
	
	//LIST
	public List<WishDTO> wishList(Map<String, Object> map) throws Exception{
		
		
		return sqlSession.selectList(NAMESPACE+"wishList", map);
	}
	
	//WRITE
	public int wishWrite(WishDTO wishDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"wishWrite", wishDTO);
	}
	
	//View
	public WishDTO wishView(int num) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"wishView", num);
	}
	
	//mod
	public int wishMod(WishDTO wishDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"wishMod", wishDTO);
		
	}
	//del
	public int wishDel(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"wishDel", num);
	}
	
	//답글
	public int wishReply(Map<String, Object> map) throws Exception{
		System.out.println("DAO wish reply");
		return sqlSession.insert(NAMESPACE+"wishReply", map);
	}
	
	
	public ReplyDTO reply(ReplyDTO replyDTO){
		replyDTO.setKind("wish");
		return this.replyDAO.reply(replyDTO);
	}
	
	public List<ReplyDTO> reply_view(int pNum, int lastRow){
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setKind("wish");
		replyDTO.setpNum(pNum);
		return this.replyDAO.reply_view(lastRow,replyDTO);
	}
	
	
}
