package com.choa.fin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.choa.auction.AuctionDTO;
import com.choa.auction.AuctionService;
import com.choa.auction.CategoryDTO;
import com.choa.auction.RankDTO;
import com.choa.auction.SearchDTO;
import com.choa.reply.ReplyDTO;
import com.choa.upload.UploadDTO;
import com.choa.util.PageResult;

@Controller
@RequestMapping(value="/auction")
public class AuctionController {
	@Inject
	private AuctionService auctionService;
	
	// =========================================== auction view, reply 추가분 =========================
	@RequestMapping(value="auctionView/{num}")
	public ModelAndView auctionView(@PathVariable(value="num")int num, ModelAndView modelAndView, HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println(num);
		Map<String, Object> map = auctionService.view(num);
		modelAndView.setViewName("auction/auctionView");
		AuctionDTO auctionDTO = (AuctionDTO)map.get("auctionDTO");
		modelAndView.addObject("auctionDTO", auctionDTO);
		modelAndView.addObject("thum", (List<UploadDTO>)map.get("imgList"));
		modelAndView.addObject("bidder", (Integer)map.get("bidder"));
		auctionService.viewList(request, response, num);
		return modelAndView;
	}
	@RequestMapping(value="auctionReply", method=RequestMethod.POST)
	@ResponseBody
	public ReplyDTO reply(ReplyDTO replyDTO) throws Exception{
		String contents = replyDTO.getContents();
		replyDTO.setContents(contents);
		return auctionService.reply(replyDTO);
	}
	
	@RequestMapping(value="replyView")
	@ResponseBody
	public List<ReplyDTO> replyView(int pNum,int lastRow){
		List<ReplyDTO> ar = auctionService.reply_view(pNum,lastRow);
		
		return ar;
	}
	
	@RequestMapping(value="auction_tender/{num}/{kind}", method=RequestMethod.GET)
	public ModelAndView auction_tender(@PathVariable(value="num")int num, @PathVariable(value="kind") String kind, ModelAndView modelAndView) throws Exception{
		modelAndView.addObject("tender_info", this.auctionService.tenderInfo(num));
		modelAndView.setViewName("auction/auction_tender");
		return modelAndView;
	}
	
	@RequestMapping(value="auction_tender", method=RequestMethod.POST)
	@ResponseBody
	public int auction_tender(int num, int price, String id){
		return auctionService.tender(num, id, price);
		
	}
	
	
	@RequestMapping(value="auctionImage", method=RequestMethod.POST)
	public ModelAndView auctionImage(UploadDTO uploadDTO, ModelAndView modelAndView) throws Exception{
		List<UploadDTO> ar = auctionService.auctionImage(uploadDTO);
		modelAndView.setViewName("auction/img_view");
		modelAndView.addObject("img", ar);
		
		return modelAndView;
	}
	
	@RequestMapping(value="auctionLike", method=RequestMethod.POST)
	@ResponseBody
	public int auctionLikes(int pNum, String m_id) throws Exception{
		return auctionService.auctionLikes(pNum, m_id);
	}
	
	
	@RequestMapping(value="categoryDrop")
	public void categoryDrop(){
	}
	
	@RequestMapping(value="category_search", method=RequestMethod.POST)
	public ModelAndView category_search(String category, ModelAndView modelAndView)throws Exception{
			String[] cate = category.split(",");
			modelAndView.setViewName("auction/categoryDrop");
			modelAndView.addObject("cateList", auctionService.category_search(cate));
			modelAndView.addObject("cateTitle", cate);
		return modelAndView;
	}
	
	@RequestMapping(value="relateList", method=RequestMethod.POST)
	public ModelAndView relateList(int curPage, String category,int num, ModelAndView modelAndView) throws Exception{
		Map<String, Object> map = auctionService.auctionAll_list(curPage,category,num);
		List<AuctionDTO> ar = (List<AuctionDTO>)map.get("list");
		modelAndView.addObject("images", auctionService.listImage(ar));
		modelAndView.addObject("relate", ar);
		modelAndView.addObject("count", (Integer)map.get("total"));
		modelAndView.addObject("curPage", curPage);
		modelAndView.addObject("number", num);
		modelAndView.setViewName("auction/relatedProduct");
		return modelAndView;
	}
	
	@RequestMapping(value="viewList")
	public ModelAndView viewList(int curPage, HttpServletRequest request, ModelAndView modelAndView) throws Exception{
		Cookie[] co = request.getCookies();
		System.out.println(co.length);
		modelAndView.setViewName("auction/cookieList");
		for(int i=0; i<co.length; i++){
			if(co[i].getName().equals("viewList")){
				System.out.println(co[i].getValue());
				Map<String, Object> map = auctionService.viewList(curPage, co[i].getValue());
				modelAndView.addObject("list", map.get("auction"));
				modelAndView.addObject("images", map.get("upload"));
				modelAndView.addObject("curPage", curPage);
				modelAndView.addObject("count", map.get("size"));
			}
		}
		return modelAndView;
	}
	
	@RequestMapping(value="auctionBid")
	@ResponseBody
	public String auctionBid(int num) throws Exception{
		auctionService.auctionBid(num);
		return "y";
	}
	
	
	@RequestMapping(value="auctionPay")
	public void auctionPay(){
		
	}
	// ============================== totalList- ajax ==========================================
	@ResponseBody
	@RequestMapping(value="/listChoice", method=RequestMethod.POST)
	public List<AuctionDTO> listChoice(String search, String category, int startNum, int lastNum )throws Exception{
		System.out.println(search);
		System.out.println(category);
		System.out.println(startNum);
		System.out.println(lastNum);
		List<AuctionDTO> l=auctionService.listChoice(search, category, startNum, lastNum);
		System.out.println(l.size());
		return l;
	}
	// ============================== totalList ==========================================
	@RequestMapping(value="/totalList", method=RequestMethod.POST)
	public ModelAndView totalList(String search, int startNum,int lastNum, ModelAndView mv)throws Exception{
		System.out.println("===================totalList");
		Map<String, Object> map= auctionService.totalList(search, "",startNum, lastNum);
		List<AuctionDTO> list=(List<AuctionDTO>)map.get("list");
		List<Integer> listCount=new ArrayList<Integer>();
		for(int i=0;i<7;i++){
			listCount.add((Integer)map.get("list_count"+i));
		}
		String [] ctg= {"패션","잡화","스포츠/레저/자동차","유아","가구/생활/건강","디지털/가전/컴퓨터","도서"};
		
		mv.addObject("totalCount", map.get("totalCount")).addObject("totalList",map.get("list")).addObject("listCount", listCount);
		mv.addObject("search", search).addObject("ctg", ctg);
		mv.setViewName("auction/totalList");
		return mv;
	}
	// ============================== Home ==========================================
	@RequestMapping(value="/home", method=RequestMethod.POST)
	public String home()throws Exception{
		return "redirect:/";
	}
	// ============================== 썸네일조회 ==========================================
	@RequestMapping(value="/selectThum", method=RequestMethod.POST)
	public String selectThum(int num, Model model)throws Exception{
		//System.out.println("섬네일 @ "+num);
		model.addAttribute("thumList", auctionService.thumbnail(num));
		return "auction/thumResult";
	}
	// ============================== 옥션리스트 ==========================================
	@RequestMapping(value="/auctionList", method=RequestMethod.POST)
	public void auctionList(int curPage, int perPage, int pri_curPage, String category, String kind, String search, String ctgNum, String view_kind,String isSearch, Model model)throws Exception{
		System.out.println("==================================== SearchCount");
		if(isSearch.equals("y")){
			System.out.println("검색어 업뎃");
			auctionService.setSearch(search);
		}
		System.out.println("==================================== AuctionList");
		System.out.println("curpage : "+curPage);
		System.out.println("perpage : "+perPage);
		System.out.println("pri_curpage : "+pri_curPage);
		System.out.println("category : "+category);
		System.out.println("kind : "+kind);
		System.out.println("search : "+search);
		System.out.println("view_kind : "+view_kind);
		System.out.println("카테고리번호 : "+ctgNum);
		// 2차,3차 카테고리 조회할 1차카테고리 번호
		String [] ctgGrade=ctgNum.split("_");
		int ctgNum1=Integer.parseInt(ctgGrade[0]);
		int ctgNum2=99999;
		if(ctgGrade.length>1){
			ctgNum2=Integer.parseInt(ctgGrade[1]);
		}
		// 1차 카테고리 이름
		String[] ctgNameArray=category.split(",");
		String ctgName1=ctgNameArray[0];
		Map<String, Object> map=null;
		if(kind.equals("titleContents")){
			map=auctionService.list(curPage, perPage, pri_curPage, 4, category, search);
		}else{
			map=auctionService.id_search(curPage, perPage, pri_curPage, 4, category, search);
		}
		List<AuctionDTO> l =(List<AuctionDTO>)map.get("list");
		
		// likeTop3
		List<AuctionDTO> likeTop3=auctionService.likeTop3(ctgName1);
		
		// getRank
		List<RankDTO> rank=auctionService.getRank();
		// getSearch (searchTop10)
		List<SearchDTO> searchTop10=auctionService.getSearch();
		// setRank
		//auctionService.setRank(searchTop10);    -->스케줄러에서
		
		// getRankMove
		List<Object> rankMove=auctionService.getRankMove(rank, searchTop10);
		//일반등록상품 페이징 : pageResult, 프리미엄등록상품 페이징 : pri_pageResult
		//일반등록상품 리스트 : aucList,    프리미엄등록상품 리스트 : pri_aucList
		//일반등록상품 현재페이지 : curPage, 프리미엄등록상품 현재페이지 : pri_curPage
		model.addAttribute("aucList", map.get("list")).addAttribute("pageResult", map.get("pageResult")).addAttribute("ctgName1", ctgName1).addAttribute("li", auctionService.ctgAllList());
		model.addAttribute("pri_aucList", map.get("pri_list")).addAttribute("pri_pageResult", map.get("pri_pageResult"));
		model.addAttribute("curPage", curPage).addAttribute("pri_curPage", pri_curPage).addAttribute("perPage", perPage);
		model.addAttribute("category", category).addAttribute("search", search);
		model.addAttribute("kind", kind).addAttribute("ctgNum", ctgNum);
		model.addAttribute("ctgNum1",ctgNum1).addAttribute("ctgNum2", ctgNum2);
		model.addAttribute("view_kind", view_kind);
		model.addAttribute("likeTop3", likeTop3);
		model.addAttribute("searchTop10", searchTop10);
		model.addAttribute("rankMove", rankMove);
	}
	// ============================== 전체 카테고리 ==========================================
	@RequestMapping(value="/category",method=RequestMethod.GET)
	public void categoryAll(Model model)throws Exception{
		String [] icon={"fa fa-diamond","fa fa-gift","fa fa-car","fa fa-weixin","fa fa-heartbeat","fa fa-desktop","fa fa-book"};
		model.addAttribute("li",auctionService.ctgAllList()).addAttribute("icon", icon);
		
	}
	// ============================== 카테고리 조회(pnum 글번호) ==========================================
	@ResponseBody
	@RequestMapping(value="/category", method=RequestMethod.POST)
	public List<CategoryDTO>  category(int pNum)throws Exception{
		List<CategoryDTO> cList= auctionService.category(pNum);
		return cList;
	}
	// ============================== 썸네일 삭제 (수정) ==========================================
	@RequestMapping(value="/modOrgImgDel", method=RequestMethod.POST)
	public void modOrgImgDel(String orgFName, HttpSession session){
		System.out.println("기존이미지 삭제할 fName : "+ orgFName);
		List<String> dList=null;
		if(session.getAttribute("delList")==null){
			dList=new ArrayList<String>();
		}else{
			dList=(List<String>)session.getAttribute("delList");
		}
		dList.add(orgFName);
		session.setAttribute("delList", dList);
		
		for (String s : dList) {
			System.out.println(s);
		}
	}
	// ============================== 썸네일 삭제(글쓰기) ==========================================
	@RequestMapping(value="/thumDel", method=RequestMethod.POST)
	public void thumDel(int idx, HttpSession session){
		System.out.println("삭제할 인덱스번호: "+idx);
		List<UploadDTO> uploadList=(List<UploadDTO>)session.getAttribute("uploadList");
		String fName=uploadList.get(idx).getfName();
		auctionService.thumDel(fName, session);
		uploadList.get(idx).setoName(null);
		uploadList.get(idx).setfName(null);
		session.setAttribute("uploadList", uploadList);
		for (UploadDTO u : uploadList) {
			System.out.println("oName : "+u.getoName());
			System.out.println("fName : "+u.getfName());
		}
	}
	// ============================== 썸네일 업로드 ==========================================
	@ResponseBody
	@RequestMapping(value="/thumUpload", method=RequestMethod.POST)
	public String thumUpload(MultipartHttpServletRequest request, HttpSession session)throws Exception{
		List<MultipartFile> ar= request.getFiles("files");
		List<UploadDTO> uploadList=null;
		if(session.getAttribute("uploadList")==null){
			System.out.println("NULL");
			uploadList=new ArrayList<UploadDTO>();
		}else{
			System.out.println("NOTNULL");
			uploadList=(List<UploadDTO>)session.getAttribute("uploadList");
		}
		
		for (MultipartFile m : ar) {
			uploadList.add(auctionService.thumnailUpload(m, session));
		}
		session.setAttribute("uploadList", uploadList);
		String size=uploadList.size()+"";
		return size;
		
	}
	
	// ============================== 수정 ==========================================
	@RequestMapping(value="/auctionModProcess",method=RequestMethod.POST)
	public void auctionModProcess(AuctionDTO auctionDTO, HttpSession session)throws Exception{
		auctionDTO.setPeriod(auctionDTO.getPeriod().toString());
		auctionDTO.setCategory(auctionDTO.getCategory().toString());
		System.out.println(auctionDTO.getNum());
		System.out.println(auctionDTO.getM_id());
		System.out.println(auctionDTO.getTitle());
		System.out.println(auctionDTO.getContents());
		System.out.println(auctionDTO.getMin_price());
		System.out.println(auctionDTO.getMax_price());
		System.out.println(auctionDTO.getPeriod());
		System.out.println(auctionDTO.getPrimeum());
		System.out.println(auctionDTO.getReply());
		List<String> dList=new ArrayList<String>();
		if(session.getAttribute("delList")!=null){
			dList=(List<String>)session.getAttribute("delList");
		}
		
		auctionService.update(auctionDTO, this.thum(session), dList);
	}
	// ============================== 수정조회 ==========================================
	@RequestMapping(value="/auctionMod", method=RequestMethod.POST)
	public ModelAndView auctionModForm(ModelAndView mv, int num)throws Exception{
		System.out.println("넘어온 글번호 : "+num);
		mv.addObject("kind", "ModProcess");
		mv.setViewName("auction/auction");
		Map<String, Object> map=auctionService.view(num);
		mv.addObject("auc",map.get("auctionDTO")).addObject("img",map.get("imgList"));
		return mv;
	}
	// ============================== 글쓰기 ==========================================
	@RequestMapping(value="/auctionWrite", method=RequestMethod.POST)
	public String auctionWrite(AuctionDTO auctionDTO, HttpSession session)throws Exception{
		auctionDTO.setPeriod(auctionDTO.getPeriod().toString());
		auctionDTO.setCategory(auctionDTO.getCategory().toString());
		
		auctionService.write(auctionDTO, this.thum(session));
		return "redirect:/";
	}
	// ============================== 테스트 ==========================================
	@RequestMapping(value="/test1",method=RequestMethod.GET)
	public void test1(Model model)throws Exception{
		List<SearchDTO> search=auctionService.getSearch();
		model.addAttribute("search",search);
	}
	@RequestMapping(value="/test2",method=RequestMethod.GET)
	public void test2()throws Exception{
	}
	@RequestMapping(value="/test3",method=RequestMethod.GET)
	public void test3()throws Exception{
	}
	@RequestMapping(value="/test4",method=RequestMethod.GET)
	public void test4()throws Exception{
	}
	// ============================== 글쓰기폼 ==========================================
	@RequestMapping(value="/auctionWriteFrm", method=RequestMethod.POST)
	public ModelAndView auctionWrite(ModelAndView mv)throws Exception{
		mv.addObject("kind", "Write");
		mv.setViewName("auction/auction");
		return mv;
	}
	
	
	
	
	
	//=========================================================================
	private List<UploadDTO> thum(HttpSession session){
		List<UploadDTO> uploadList=null;
		List<UploadDTO> newList=new ArrayList<UploadDTO>();
		if(session.getAttribute("uploadList")!=null){
			System.out.println("================썸네일 리스트");
			uploadList=(List<UploadDTO>)session.getAttribute("uploadList");
			for (UploadDTO u : uploadList) {
				if(u.getoName()!=null){
					newList.add(u);
				}
			}
			session.removeAttribute("uploadList");
			for (UploadDTO u : newList) {
				System.out.println("oName : "+u.getoName());
				System.out.println("fName : "+u.getfName());
			}
			System.out.println(newList.size());
		}else{
			System.out.println("================썸네일없음");
		}
		return newList;
	}
}
