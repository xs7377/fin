package com.choa.util;

public class PageMaker {
	
	private int curPage;
	private int perPage;
	private PageResult pageResult;
	private RowMaker rowMaker;
	
	public PageMaker(int curPage) {
		this(curPage,10);
	}
	
	public PageMaker(int curPage, int perPage){
		this.curPage=curPage;
		this.perPage=perPage;
		pageResult=new PageResult();
		rowMaker=new RowMaker();
	}
	
	public RowMaker getRowMaker(){
		rowMaker.makeRow(curPage, perPage);
		return rowMaker;
	}
	
	public PageResult paging(int totalCount){
		//total page
				if(totalCount%perPage==0){
					pageResult.setTotalPage(totalCount/perPage);
				}else{
					pageResult.setTotalPage(totalCount/perPage+1);
				}
				//total block
				int perBlock=5;
				if(pageResult.getTotalPage()%perBlock==0){
					pageResult.setTotalBlock(pageResult.getTotalPage()/perBlock);
				}else{
					pageResult.setTotalBlock(pageResult.getTotalPage()/perBlock+1);
				}
				//curblock
				if(curPage%perBlock==0){
					pageResult.setCurBlock(curPage/perBlock);
				}else{
					pageResult.setCurBlock(curPage/perBlock+1);
				}
				//startNum, lastNum
				int startNum=(pageResult.getCurBlock()-1)*perBlock+1;
				int lastNum=pageResult.getCurBlock()*perBlock;
				pageResult.setStartNum(startNum);
				pageResult.setLastNum(lastNum);

				//lastNum
				if(pageResult.getCurBlock()==pageResult.getTotalBlock()){
					lastNum=pageResult.getTotalPage();
				}
				pageResult.setLastNum(lastNum);

				return pageResult;
	}
}
