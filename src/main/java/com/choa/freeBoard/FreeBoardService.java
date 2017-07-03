package com.choa.freeBoard;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.board.BoardDTO;
import com.choa.util.PageMaker;
import com.choa.util.PageResult;
import com.choa.util.RowMaker;

@Service
public class FreeBoardService {
	
	@Inject
	private FreeBoardDAO freeBoardDAO;
	

	public Map<String, Object> freeBoardList(int curPage, String kinds, String search) throws Exception{
		PageMaker pageMaker=new PageMaker(curPage);
		RowMaker rowMaker=pageMaker.getRowMaker();
		PageResult pr=pageMaker.paging(freeBoardDAO.totalCount(kinds,search));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", freeBoardDAO.boardList(rowMaker, kinds, search));
		map.put("pageResult", pr);
		return map;
	}
	
	public BoardDTO freeBoardView(int num) throws Exception{
		return (FreeBoardDTO)freeBoardDAO.boardView(num);
	}
	
	public int freeBoardWrite(FreeBoardDTO freeBoardDTO) throws Exception{
		return freeBoardDAO.boardWrite(freeBoardDTO);
	}
	
	public int freeBoardUpdate(FreeBoardDTO freeBoardDTO) throws Exception{
		return freeBoardDAO.boardUpdate(freeBoardDTO);
	}
	
	public int freeBoardDelete(int num) throws Exception{
		return freeBoardDAO.boardDelete(num);
	}
	
	public int freeBoardReply(FreeBoardDTO freeBoardDTO) throws Exception{
		FreeBoardDTO parentDTO=(FreeBoardDTO)freeBoardDAO.boardView(freeBoardDTO.getNum());
		freeBoardDAO.stepUpdate(parentDTO);
		freeBoardDTO.setRef(parentDTO.getRef());
		freeBoardDTO.setStep(parentDTO.getStep()+1);
		freeBoardDTO.setDepth(parentDTO.getDepth()+1);
		return freeBoardDAO.boardReply(freeBoardDTO);
	}
}
