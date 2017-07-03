package com.choa.board;

import java.util.List;

import com.choa.util.RowMaker;

public interface BoardDAO {
	
	public List<BoardDTO> boardList(RowMaker rowMaker, String kind, String search) throws Exception;
	
	public BoardDTO boardView(int num) throws Exception;
	
	public int boardWrite(BoardDTO boardDTO) throws Exception;
	
	public int boardDelete(int num) throws Exception;
	
	public int hitPlus(int num) throws Exception;
	
	public int hitMinus(int num) throws Exception;
	
	public int totalCount(String kind, String search) throws Exception;
	
	public int boardUpdate(BoardDTO boardDTO) throws Exception;
}
