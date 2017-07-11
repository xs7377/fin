package com.choa.friend;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choa.util.RowMaker;

@Repository
public class FriendDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String NAMESPACE="FriendMapper.";
	
	//추가
	public int friendAdd(FriendDTO friendDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+"friendAdd",friendDTO);
	}
	
	
	//삭제
	public int friendDelete(FriendDTO friendDTO) throws Exception{
		
		
		return sqlSession.delete(NAMESPACE+"friendDelete", friendDTO);
	}
	
	
	//친구추가한 사람이 친구인지 아닌지.
	public FriendDTO friendCheck(FriendDTO friendDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"friendCheck",friendDTO);
		
	}
	//m_id가 친추한 친구의 목록
	public List<FriendDTO> friendList(RowMaker rowMaker, String m_id) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("row", rowMaker);
		map.put("id", m_id);
		return sqlSession.selectList(NAMESPACE+"friendList",map);
	}
	
	//total Count
	public int totalCount (String m_id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"totalCount", m_id);
	}
}
