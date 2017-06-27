package com.choa.auction;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import com.choa.upload.UploadDTO;
import com.choa.util.FileUploader;
import com.choa.util.RowMaker;

@Service
public class AuctionService {
	
	@Inject
	private AuctionDAO auctionDAO;
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
	
	

	
}
