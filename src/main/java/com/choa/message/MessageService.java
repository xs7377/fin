package com.choa.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.util.PageMaker;
import com.choa.util.RowMaker;

@Service
public class MessageService {

	@Inject
	private MessageDAO messageDAO;
	
	
	
	public List<MessageDTO> messageSendList(Map<String, Object> map) throws Exception{
		
		return messageDAO.messageSendList(map);
	}
	
	public List<MessageDTO> messageReciveList(Map<String, Object> map) throws Exception{
	
		return messageDAO.messageReciveList(map);
	}

	
	//보내기
	public int messageSend(MessageDTO messageDTO) throws Exception{
		return messageDAO.messageSend(messageDTO);
	}
	
	//삭제
	public int messageDelete(int num) throws Exception {
		
		return messageDAO.messageDelete(num);
	}
	
	//읽기
	public MessageDTO messageView(int num,int send_check) throws Exception{
		return messageDAO.messageView(num, send_check);
	}

	//신고메세지
	public int messageReport(Map<String, Object> map) throws Exception{
		
		return messageDAO.messageReport(map);
	}
	
	
	
}
