package com.choa.attend;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AttendDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String NAMESPACE="AttendMapper.";
	
	
	//출석
	public int attendCheck(String m_id) throws Exception{
		int result=0;
		Map<String, Object> map =new HashMap<String, Object>();
		
		map.put("m_id", m_id);
		System.out.println(map.get("m_id"));
		
		sqlSession.update(NAMESPACE+"attendCheck", map);
		
		result=(Integer)map.get("result");
		
		System.out.println("출첵"+result);
		System.out.println("result : TOTAL 값이 넘어온다. 그래서 result로 누적 며 칠째 출석인지 확인.");
		
		return result;
	}
	
	//오늘 출첵 두번째인지 중복 확인.
	public int attendCut(String m_id) throws Exception{
		int result=0;
		if(sqlSession.selectOne(NAMESPACE+"attendCut", m_id)!=null){
			result=1;
		}
		
		return result;
	}
	
	
	
	//자정되면 clear today  0으로 
	public int attendClear() throws Exception{
		
		return sqlSession.update(NAMESPACE+"attendClear");
	}

	
	//누적 일이 15일 초과하면 리셋
	public int attendReset(String m_id) throws Exception{
		return sqlSession.update(NAMESPACE+"attendReset", m_id);
		
	}
	
	//회원탈퇴 및 신고로 삭제 될 경우.
	public int attendDel(String m_id) throws Exception{
		return sqlSession.delete(NAMESPACE+"attendDel",m_id);
	}
	
	
	
}
