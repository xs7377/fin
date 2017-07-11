package com.choa.wish;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choa.auction.CategoryDTO;
import com.choa.reply.ReplyDAO;
import com.choa.reply.ReplyDTO;

@Repository
public class WishDAO {
	
	
	@Inject
	private ReplyDAO replyDAO;
	
	@Inject
	private SqlSession sqlSession;
	private static String NAMESPACE="WishMapper.";
	
	//totalCount
	public int wishCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"wishCount");
	}
	
	
	
	
	//LIST//7.10
	public List<WishDTO> wishList(Map<String, Object> map) throws Exception{
			List<WishDTO> ar=new ArrayList<WishDTO>();
			List<WishDTO> sendAr=new ArrayList<WishDTO>();
			String sb="";
			ar=sqlSession.selectList(NAMESPACE+"wishList", map);
		
			String name="";
			String [] t=null;
			for(WishDTO wd: ar){
			
			String part=wd.getContents();
			String sm1="<img";
			int ix=part.indexOf(sm1);
			if(ix!=-1){
				sb=part.substring(ix, part.indexOf(">", ix+1));
				StringBuffer sf=new StringBuffer(sb);
				sf.append(" class=\"img-responsive\" style=\"width:100%; height:100%;\" alt=\"Image\">");
				sb=sf.toString();
				
			}else{
				sb="<img src=\"https://placehold.it/150x80?text=IMAGE\" class=\"img-responsive\" style=\"width:100%; height:100%;\" alt=\"Image\">";
				
			}
			name=wd.getCategory();
			t=name.split(",");
			name=t[0].toString();
			System.out.println(name);
			
			wd.setCategory(name);
			
			
			wd.setThumb(sb);
			sendAr.add(wd);
		}
		
		
		
		return sendAr;
	}
	
	//WRITE
	public int wishWrite(WishDTO wishDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"wishWrite", wishDTO);
	}
	
	//View
	public WishDTO wishView(int num) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"wishView", num);
	}
	
	//mod
	public int wishMod(WishDTO wishDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"wishMod", wishDTO);
		
	}
	//del
	public int wishDel(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"wishDel", num);
	}
	
	//답글
	public int wishReply(Map<String, Object> map) throws Exception{
		System.out.println("DAO wish reply");
		return sqlSession.insert(NAMESPACE+"wishReply", map);
	}
	
	//댓글
	public ReplyDTO reply(ReplyDTO replyDTO){
		replyDTO.setKind("wish");
		return this.replyDAO.reply(replyDTO);
	}
	public List<ReplyDTO> reply_view(int pNum, int lastRow){
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setKind("wish");
		replyDTO.setpNum(pNum);
		return this.replyDAO.reply_view(lastRow,replyDTO);
	}
	
	
	//글 쓸 때 카테고리 선택 별로 필요 없음.
	public List<CategoryDTO> categorySel(int pnum) throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"categorySel", pnum);
		
	}
	
	public CategoryDTO category(int num) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"category", num);
	}
	
	
}
