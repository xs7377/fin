package com.choa.notice;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.board.BoardDTO;
import com.choa.util.PageMaker;
import com.choa.util.PageResult;
import com.choa.util.RowMaker;

@Service
public class NoticeService {
	
	@Inject
	private NoticeDAO noticeDAO;
	
		
	public Map<String, Object> noticeList(int curPage, String kinds, String search) throws Exception{
		PageMaker pageMaker=new PageMaker(curPage);
		RowMaker rowMaker=pageMaker.getRowMaker();
		PageResult pr=pageMaker.paging(noticeDAO.totalCount(kinds,search));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", noticeDAO.boardList(rowMaker, kinds, search));
		map.put("pageResult", pr);
		
		return map;
	}
	
	public BoardDTO noticeView(int num) throws Exception{
		
		return noticeDAO.boardView(num);
	}
	
	public int noticeWrite(NoticeDTO noticeDTO) throws Exception{
		
		return noticeDAO.boardWrite(noticeDTO);
	}
	
	public int noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		
		return noticeDAO.boardUpdate(noticeDTO);
	}
	
	public int noticeDelete(int num) throws Exception{
		
		return noticeDAO.boardDelete(num);
	}

}
