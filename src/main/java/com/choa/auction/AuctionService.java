package com.choa.auction;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.choa.reply.ReplyDTO;
import com.choa.upload.UploadDTO;
import com.choa.util.FileUploader;
import com.choa.util.RowMaker;

@Service
public class AuctionService {
	
	@Inject
	private AuctionDAO auctionDAO;
	public List<AuctionDTO> listChoice(String search, String category, int startNum, int lastNum)throws Exception{
		return auctionDAO.listChoice(search, category, startNum, lastNum);
	}
	public Map<String, Object> totalList(String search, String category,int startNum, int lastNum)throws Exception{
		return auctionDAO.total_list(search, category,startNum, lastNum);
	}
	public List<Object> getRankMove(List<RankDTO> rank, List<SearchDTO> search)throws Exception{
		List<Object> rankMove=new ArrayList<Object>();
		for(int i=0;i<search.size();i++){
			//System.out.println("=====================");
			for(int j=0;j<rank.size();j++){
				if(search.get(i).getSearch().equals(rank.get(j).getSearch())){
					int num=(i+1)-rank.get(j).getRank();
					rankMove.add(num);
					//System.out.println(num);
					break;
				}
				else{
					if(j==9){
						rankMove.add("new");
						//System.out.println("new");
					}
				}
			}
		}
		/* 
		System.out.println("이전랭크"+"\t"+"현재랭크"+"\t"+"순위변동");
		for(int i=0;i<rank.size();i++){
			System.out.println(rank.get(i).getRank()+"."+rank.get(i).getSearch()+"\t"+(i+1)+"."+search.get(i).getSearch()+"\t"+rankMove.get(i));
		}*/
		return rankMove;
	}
	public List<RankDTO> getRank()throws Exception{
		return auctionDAO.getRank();
	}
	public void setRank(List<SearchDTO> searchTop10)throws Exception{
		for(int i=0;i<searchTop10.size();i++){
			RankDTO rankDTO=new RankDTO();
			rankDTO.setRank(i+1);
			rankDTO.setSearch(searchTop10.get(i).getSearch());
			auctionDAO.setRank(rankDTO);
		}
	}
	public List<SearchDTO> getSearch()throws Exception{
		return auctionDAO.getSearch();
	}
	public void setSearch(String search)throws Exception{
		auctionDAO.setSearch(search);
	}
	public List<AuctionDTO> likeTop3(String cate)throws Exception{
		return auctionDAO.likeTop3(cate);
	}
	public int write(AuctionDTO auctionDTO, List<UploadDTO> imgs) throws Exception{
		return auctionDAO.write(auctionDTO, imgs);
	}
	public List<UploadDTO> thumbnail(int pNum) throws Exception{
		return auctionDAO.thumbnail(pNum);
	}
	public List<CategoryDTO> ctgAllList()throws Exception{
		return auctionDAO.ctgAllList();
	}
	public List<CategoryDTO> category(int pNum) throws Exception{
		return auctionDAO.category(pNum);
	}
	public void test(){
		System.out.println("service");
	}
	public void thumDel(String fName, HttpSession session){
		String path=session.getServletContext().getRealPath("resources/upload");
		File f= new File(path+"/"+fName);
		f.delete();
	}
	public UploadDTO thumnailUpload(MultipartFile multipartFile, HttpSession session)throws Exception{
		System.out.println("================================업로드서비스");
		FileUploader fileUploader=new FileUploader();
		
		String path=session.getServletContext().getRealPath("resources/upload");
		System.out.println(path);
		
		String oName=multipartFile.getOriginalFilename();
		System.out.println(oName);
		String fName=fileUploader.fileUploader(multipartFile, path);
		System.out.println(fName);
		UploadDTO uploadDTO=new UploadDTO();
		
		uploadDTO.setoName(oName);
		uploadDTO.setfName(fName);
		return uploadDTO;
	}
	
	public Map<String, Object> view(int num) throws Exception{
		return auctionDAO.view(num);
	}
	
	public Map<String, Object> list(int curPage, int perPage, int pri_curPage, int pri_perPage, String category, String search) throws Exception{
		return auctionDAO.list(curPage, perPage, pri_curPage, pri_perPage, category, search);
	}
	
	public Map<String, Object> id_search(int curPage, int perPage, int pri_curPage, int pri_perPage, String category, String id) throws Exception{
		return auctionDAO.id_search(curPage, perPage, pri_curPage, pri_perPage, category, id);
	}
	public int update(AuctionDTO auctionDTO, List<UploadDTO> imgs, List<String> del) throws Exception{
		return auctionDAO.update(auctionDTO, imgs, del);
	}
	public ReplyDTO reply(ReplyDTO replyDTO) throws Exception{
		return auctionDAO.reply(replyDTO);
	}
	public List<ReplyDTO> reply_view(int pNum,int lastRow){
		return auctionDAO.reply_view(pNum,lastRow);
	}
	
	public AuctionDTO tenderInfo(int num) throws Exception{
		return auctionDAO.tenderInfo(num);
	}
	
	public int tender(int num, String id, int t_price,String addr){
		return auctionDAO.auctionTender(num, id, t_price,addr);
	}
	
	public List<UploadDTO> auctionImage(UploadDTO uploadDTO) throws Exception{
		return auctionDAO.auctionImage(uploadDTO);
	}
	
	public int auctionLikes(int pNum, String m_id) throws Exception{
		return auctionDAO.auctionLikes(pNum, m_id);
	}
	
	public List<List<CategoryDTO>> category_search(String[] cate) throws Exception{
		return auctionDAO.category_search(cate);
	}
	
	public Map<String, Object> auctionAll_list(int curPage, String category, int num)throws Exception{
		return auctionDAO.auctionAll_list(curPage,category,num);
	}
	
	public Map<String, Object> viewList(int curPage, String num) throws Exception{
		String[] number = num.split(",");
		Map<String, Object> list = new HashMap<String, Object>();
		List<AuctionDTO> auction = new ArrayList<AuctionDTO>();
		List<UploadDTO> upload = new ArrayList<UploadDTO>();
		int start = number.length-(4*curPage);
		int last = number.length-(4*(curPage-1));
		if(start<0){
			start=0;
		}
		for (int i=start; i<last; i++) {
			Map<String, Object> view = auctionDAO.view(Integer.parseInt(number[i]));
			System.out.println(view.size());
			if(view.size()>0){
				auction.add((AuctionDTO)view.get("auctionDTO"));
				upload.add(((List<UploadDTO>)view.get("imgList")).get(0));
			}
		}
		list.put("size", number.length);
		list.put("auction", auction);
		list.put("upload", upload);
		return list;
	}

	public void viewList(HttpServletRequest request, HttpServletResponse response, int num){
		auctionDAO.viewList(request, response, num);
	}
	
	public List<UploadDTO> listImage(List<AuctionDTO> auctionDTO) throws Exception{
		List<UploadDTO> ar = new ArrayList<UploadDTO>();
		for(int i=0; i<auctionDTO.size(); i++){
			ar.add(auctionDAO.listImage(auctionDTO.get(i).getNum()));
		}
		return ar;
	}
	
	public void auctionBid(int num) throws Exception{
		auctionDAO.auctionBid(num);
	}
	public void auction() throws Exception{
		auctionDAO.auction();
	}
	
	public int reply_remove(int num, int pnum){
		return auctionDAO.reply_remove(num, pnum);
		
	}
	
	public int likeSelect(String id, int num)throws Exception{
		return auctionDAO.likeSelect(id, num);
	}
	
}
