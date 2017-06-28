package com.choa.auction;

import java.awt.Image;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.upload.UploadDAO;
import com.choa.upload.UploadDTO;
import com.choa.util.PageMaker;
import com.choa.util.PageResult;
import com.choa.util.RowMaker;

@Repository
public class AuctionDAO {
	
	@Autowired
	private UploadDAO uploadDAO;
	
	@Autowired
	private SqlSession sqlSession;
	private String NAME_SPACE="AuctionMapper.";
	
	
	public Map<String, Object> total_list(String search, String category, int lastNum)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("category", category);
		map.put("lastNum", lastNum);
		sqlSession.selectList(NAME_SPACE+"total_list", map);
		String [] ctg= {"패션","잡화","스포츠/레저/자동차","유아","가구/생활/건강","디지털/가전/컴퓨터","도서"};
		for(int i=0;i<ctg.length;i++){
			System.out.println(ctg.length);
			map.put("ctg", ctg[i]);
			System.out.println("list_count"+i);
			map.put("list_count"+i,sqlSession.selectOne(NAME_SPACE+"category_count", map));
		}
		return map;
	}
	public List<RankDTO> getRank()throws Exception{
		return sqlSession.selectList(NAME_SPACE+"getRank");
	}
	public void setRank(RankDTO rankDTO)throws Exception{
		sqlSession.insert(NAME_SPACE+"setRank", rankDTO);
	}
	public List<SearchDTO> getSearch()throws Exception{
		return sqlSession.selectList(NAME_SPACE+"getSearch");
	}
	public void setSearch(String search)throws Exception{
		sqlSession.insert(NAME_SPACE+"setSearch", search);
	}
	public List<UploadDTO> thumbnail(int pNum) throws Exception{
		UploadDTO uploadDTO = new UploadDTO();
		uploadDTO.setpNum(pNum);
		uploadDTO.setKind("auction");
		return this.uploadDAO.imgView(uploadDTO);
	}
	public List<CategoryDTO> ctgAllList() throws Exception{
		return sqlSession.selectList(NAME_SPACE+"ctgAllList");
	}
	
	public List<CategoryDTO> category(int pnum) throws Exception{
		return sqlSession.selectList(NAME_SPACE+"category",pnum);
	}
	
	public int update(AuctionDTO auctionDTO, List<UploadDTO> imgs, List<String> del) throws Exception{
		System.out.println(auctionDTO.getNum());
		System.out.println(auctionDTO.getM_id());
		System.out.println(auctionDTO.getTitle());
		System.out.println(auctionDTO.getContents());
		System.out.println(auctionDTO.getMin_price());
		System.out.println(auctionDTO.getMax_price());
		System.out.println(auctionDTO.getPeriod());
		System.out.println(auctionDTO.getPrimeum());
		System.out.println(auctionDTO.getReply());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("auctionDTO", auctionDTO);
		sqlSession.update(NAME_SPACE+"update", map);
		int result = (Integer)map.get("result");
		System.out.println(imgs.size());
		if(result==1){
			if(imgs.size()>0){
				for (UploadDTO uploadDTO : imgs){
					uploadDTO.setpNum(auctionDTO.getNum());
					uploadDTO.setKind("auction");
					uploadDAO.imgUpload(uploadDTO);
				}
			}else{
				UploadDTO uploadDTO = new UploadDTO();
				uploadDTO.setKind("auction");
				uploadDTO.setpNum(auctionDTO.getNum());
				this.uploadDAO.noImage(uploadDTO);
			}
			
			if(del.size()>0){
				for (String fName : del) {
					uploadDAO.imgDelete(fName);
				}
			}
		}
		return (Integer)map.get("result");
		
	}
	
	public Integer write(AuctionDTO auctionDTO, List<UploadDTO> imgs) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("auctionDTO", auctionDTO);
		sqlSession.insert(NAME_SPACE+"write", map);
		int result = (Integer)map.get("result");
		System.out.println((Integer)map.get("maxnum"));
		int pNum = (Integer)map.get("maxnum");
		if(result==1){
			if(imgs.size()>0){
				for (UploadDTO uploadDTO : imgs){
					uploadDTO.setpNum(pNum);
					uploadDTO.setKind("auction");
					uploadDAO.imgUpload(uploadDTO);
				}
			}else{
				UploadDTO uploadDTO = new UploadDTO();
				uploadDTO.setKind("auction");
				uploadDTO.setpNum(pNum);
				this.uploadDAO.noImage(uploadDTO);
			}
		}
		return result;
	}
	
	public int delete(int num)throws Exception{
		return sqlSession.delete(NAME_SPACE+"delete", num);
	}
	
	public Map<String, Object> view(int num)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		UploadDTO uploadDTO = new UploadDTO();
		uploadDTO.setKind("auction");
		uploadDTO.setpNum(num);
		sqlSession.selectOne(NAME_SPACE+"view", map);
		List<AuctionDTO> ar = (List<AuctionDTO>)map.get("view");
		map.put("auctionDTO", ar.get(0));
		map.put("imgList", uploadDAO.imgView(uploadDTO));
		return map;
	}
	public Map<String, Object> list(int curPage, int perPage, int pri_curPage, int pri_perPage, String category, String search)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker(curPage, perPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		
		PageMaker pri_pageMaker=new PageMaker(pri_curPage, pri_perPage);
		RowMaker pri_rowMaker=pri_pageMaker.getRowMaker();
		
		//System.out.println(pri_rowMaker.getStartRow());
		//System.out.println(pri_rowMaker.getLastRow());
		
		map.put("row", rowMaker);
		map.put("pri_row", pri_rowMaker);
		map.put("category", category);
		map.put("search", search);
		sqlSession.selectOne(NAME_SPACE+"list", map);
		PageResult pageResult = pageMaker.paging((Integer)map.get("total"));
		PageResult pri_pageResult=pri_pageMaker.paging((Integer)map.get("pri_total"));
		map.put("pageResult", pageResult);
		map.put("pri_pageResult", pri_pageResult);
		return map;
	}
	
	public Map<String, Object> id_search(int curPage, int perPage, int pri_curPage, int pri_perPage, String category, String id)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker(curPage, perPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		
		PageMaker pri_pageMaker=new PageMaker(pri_curPage, pri_perPage);
		RowMaker pri_rowMaker=pri_pageMaker.getRowMaker();
		map.put("row", rowMaker);
		map.put("pri_row", pri_rowMaker);
		map.put("category", category);
		map.put("id", id);
		sqlSession.selectOne(NAME_SPACE+"id_list", map);
		System.out.println((Integer)map.get("total"));
		PageResult pageResult = pageMaker.paging((Integer)map.get("total"));
		PageResult pri_pageResult= pri_pageMaker.paging((Integer)map.get("pri_total"));
		map.put("pageResult", pageResult);
		map.put("pri_pageResult", pri_pageResult);
		
		return map;
	}
	public List<AuctionDTO> likeTop3(String cate)throws Exception{
		return sqlSession.selectList(NAME_SPACE+"likeTop3", cate);
	}
	public void reply(Map<String, Object> map){
		sqlSession.insert(NAME_SPACE+"reply", map);
	}
	
}
