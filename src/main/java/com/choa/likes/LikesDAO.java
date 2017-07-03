package com.choa.likes;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LikesDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String NAMESPACE="LikesMapper.";
	
	
	//Procedure 사용 좋아요 누른 상태면 삭제, 없으면 추가 
	public int likes(LikesDTO likesDTO) throws Exception{
		int result=0;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("likes", likesDTO);
		sqlSession.insert(NAMESPACE+"likes",map);
		result=(Integer)map.get("result");
		System.out.println(result);
		
		return result;
	}
	
	//kind 게시판의 pnum게시물의 좋아요 수
	public int likesCount(LikesDTO likesDTO) throws Exception{
		
		
		return sqlSession.selectOne(NAMESPACE+"likesCount", likesDTO);
	}
	
	
	//view에 접근 했을때 m_id 유저가 pnum의 게시글을 좋아요를 눌렀는지 확인.
	public LikesDTO likesCheck(LikesDTO likesDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"likesCheck",likesDTO);
		
	}
	
	
}
