package com.choa.friend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.util.PageMaker;
import com.choa.util.PageResult;
import com.choa.util.RowMaker;

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
	
	public Map<String, Object> friendList(int curPage, String m_id) throws Exception{
		PageMaker pageMaker=new PageMaker(curPage);
		RowMaker rowMaker=pageMaker.getRowMaker();
		PageResult pr=pageMaker.paging(friendDAO.totalCount(m_id));
		System.out.println(pr.getLastNum());
		System.out.println(pr.getStartNum());
		System.out.println(pr.getTotalBlock());
		System.out.println(pr.getTotalPage());
		System.out.println(pr.getCurBlock());
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", friendDAO.friendList(rowMaker, m_id));
		map.put("pageResult", pr);
		return map;
	}
	
}
