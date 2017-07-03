package com.choa.friend;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class FriendService {

	@Inject
	private FriendDAO friendDAO;
	
	public int friendAdd(FriendDTO friendDTO) throws Exception{
		return friendDAO.friendAdd(friendDTO);
	}
	
	
	public int friendDelete(FriendDTO friendDTO) throws Exception{
		return friendDAO.friendDelete(friendDTO);
		
	}
	
	public FriendDTO friendCheck(FriendDTO friendDTO) throws Exception{
		return friendDAO.friendCheck(friendDTO);
	}
	
	public List<FriendDTO> friendList(String m_id) throws Exception{
		return friendDAO.friendList(m_id);
	}
	
}
