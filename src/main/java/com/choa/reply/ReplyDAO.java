package com.choa.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "ReplyMapper.";
	
	public ReplyDTO reply(ReplyDTO replyDTO){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyDTO", replyDTO);
		sqlSession.insert(NAME_SPACE+"reply", map);
		List<ReplyDTO> ar = (List<ReplyDTO>)map.get("replyDTO");
		
		return ar.get(0);
	}
	
	public List<ReplyDTO> reply_view(int lastRow, ReplyDTO replyDTO){
		Map<String, Object> map = new HashMap<String, Object>();
		int startRow = 1;
		map.put("reply", replyDTO);
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		return sqlSession.selectList(NAME_SPACE+"reply_view", map);
	}
	
	

}
