package com.choa.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choa.util.PageMaker;
import com.choa.util.RowMaker;

@Repository
public class MessageDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String NAMESPACE="MessageMapper.";
	
	//보낸 리스트
	public List<MessageDTO> messageSendList(Map<String, Object> map) throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"messageSendList", map);
	}
	
	//받은 리스트
	public List<MessageDTO> messageReciveList(Map<String, Object> map) throws Exception{
	
		return sqlSession.selectList(NAMESPACE+"messageReciveList", map);
	}
	
	
	//메세지 보내기 ㅋ
	public int messageSend(MessageDTO messageDTO) throws Exception{
		System.out.println("send는");
		int result=0;
		System.out.println(messageDTO.getFrom_id());
		result=sqlSession.insert(NAMESPACE+"messageSend", messageDTO);
		
		System.out.println(result);
		return result;
	}
	
	//쪽지 삭제 
	public int messageDelete(int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"messageDelete", num);
	}
	
	//쪽지 읽었냐 
	public MessageDTO messageView(int num, int send_check) throws Exception{
		MessageDTO messageDTO=new MessageDTO();
		messageDTO=sqlSession.selectOne(NAMESPACE+"messageView",num);
		
		if((messageDTO!=null)&&(send_check==1)){
			sqlSession.update(NAMESPACE+"messageRead", num);
		}
		return messageDTO;
	}
	
	//신고 됐을 때
	public int messageReport(Map<String, Object> map) throws Exception{
		int result=0;
		
		sqlSession.insert(NAMESPACE+"messageReport",map);
		result=(Integer)map.get("result");
		System.out.println(result);
		
		return result;
	}
	
	
	
}
