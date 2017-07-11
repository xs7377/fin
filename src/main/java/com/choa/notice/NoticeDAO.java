package com.choa.notice;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choa.board.BoardDAO;
import com.choa.board.BoardDTO;

import com.choa.util.RowMaker;

@Repository
public class NoticeDAO implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	private String namespace="NoticeMapper.";
	

	@Override
	public List<BoardDTO> boardList(RowMaker rowMaker, String kinds, String search) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("row", rowMaker);
		map.put("kinds", kinds);
		map.put("search", search);
		return sqlSession.selectList(namespace+"noticeList",map);
	}

	@Override
	public BoardDTO boardView(int num) throws Exception {
		NoticeDTO noticeDTO=null;
		noticeDTO=sqlSession.selectOne(namespace+"noticeView",num);
		this.hitPlus(num);
		return noticeDTO;
	}

	@Override
	public int boardWrite(BoardDTO boardDTO) throws Exception {
		
		
		return sqlSession.insert(namespace+"noticeWrite", boardDTO);
	}

	@Override
	public int boardDelete(int num) throws Exception {
		
		return sqlSession.delete(namespace+"noticeDelete", num);
	}

	@Override
	public int hitPlus(int num) throws Exception{
		
		return sqlSession.update(namespace+"hitPlus", num);
	}
	
	@Override
	public int hitMinus(int num) throws Exception{
		
		return sqlSession.update(namespace+"hitMinus",num);
	}

	@Override
	public int totalCount(String kinds, String search) throws Exception {
		Map<String, String> map=new HashMap<String, String>();
		map.put("kinds", kinds);
		map.put("search", search);
		return sqlSession.selectOne(namespace+"totalCount",map);
	}

	@Override
	public int boardUpdate(BoardDTO boardDTO) throws Exception {
		this.hitMinus(boardDTO.getNum());
		return sqlSession.update(namespace+"noticeUpdate", boardDTO);
	}
}
