package com.choa.util;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choa.auction.AuctionDTO;
import com.choa.freeBoard.FreeBoardDTO;
import com.choa.notice.NoticeDTO;
import com.choa.wish.WishDTO;

@Repository
public class SearchDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String NAMESPACE="SearchMapper.";
	
	
	public List<FreeBoardDTO> searchFreeBoard(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"searchFreeBoard",map);
	}
	
	public List<WishDTO> searchWish(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"searchWish",map);
	}
	
	public List<NoticeDTO> searchNotice(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"searchNotice",map);
	}
	
	public void searchReview(Map<String, Object> map) throws Exception{
	
	
	}

	
	
}
