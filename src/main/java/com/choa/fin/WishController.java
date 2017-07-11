package com.choa.fin;

import java.io.BufferedWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.auction.CategoryDTO;
import com.choa.likes.LikesDTO;
import com.choa.likes.LikesService;
import com.choa.reply.ReplyDTO;
import com.choa.util.PageMaker;
import com.choa.util.PageResult;
import com.choa.util.RowMaker;
import com.choa.wish.WishDTO;
import com.choa.wish.WishService;

@Controller
@RequestMapping(value="/wish/**")
public class WishController {

	@Inject
	private WishService wishService;
	@Inject
	private LikesService likesService;
	
	
	//List, view , write , mod, del, reply 
	
	
	//글 작성할 때 select 처리해주는 부분.
	@RequestMapping(value="selectOption", method=RequestMethod.POST)
	public @ResponseBody List<CategoryDTO> categorySel(int pnum) throws Exception{
		System.out.println("카테고리 들어옴");
		System.out.println(pnum);
		
		List<CategoryDTO> ar=wishService.categorySel(pnum);
		
		for(CategoryDTO dd: ar){
			System.out.println(dd.getName());
		}
		
		
		return ar;
	}
	
	
	
	
	@RequestMapping(value="wishViewReply", method=RequestMethod.POST)
	@ResponseBody
	public ReplyDTO reply(ReplyDTO replyDTO) throws Exception{
		String contents = replyDTO.getContents();
		replyDTO.setContents(contents);
		return wishService.reply(replyDTO);
	}
	@RequestMapping(value="replyView")
	@ResponseBody
	public List<ReplyDTO> replyView(int pNum,int lastRow){
		List<ReplyDTO> ar = wishService.reply_view(pNum,lastRow);
		
		return ar;
	}
	
	
	
	
	//List//7.10
	@RequestMapping(value="wishList", method=RequestMethod.GET)
	public String wishList( Integer curPage,String kinds,String search, Model model) throws Exception{
		//list
		// String category, String kind,
		if(curPage==null){
			curPage=1;
		}
		if(kinds==null){
			//검색
			kinds="num";
		}
		if(search==null){
			search="%";
		}
		String sb="";
		List<WishDTO> ar =new ArrayList<WishDTO>();
		Map<String, Object> map=new HashMap<String, Object>();
		PageMaker pageMaker=new PageMaker(curPage);
		RowMaker rowMaker=pageMaker.getRowMaker();
		PageResult pageResult=new PageResult();
		
		
		map.put("kind", "wish");
		map.put("startRow", rowMaker.getStartRow());
		map.put("lastRow", rowMaker.getLastRow());
		//map설정
	
		map.put("kinds", kinds);
		map.put("search", search);
			
		pageResult=pageMaker.paging(wishService.wishCount());
		ar=wishService.wishList(map);
		//ar.get(0).getThumb();  이 놈을 처리해야함.
		//컨텐츠 꺼내서 img 처리하고 그 다음 set으로 설정 그러면 thumb에 값이 담겼지 그리고 보내준다. 
		
		
		model.addAttribute("pageResult", pageResult);
		model.addAttribute("list", ar);
		model.addAttribute("board","wish");
		model.addAttribute("curPage",curPage);
		model.addAttribute("kinds",kinds);
		model.addAttribute("search", search);
		
		return "board/boardList";
	}
 	
	//VIEW
	@RequestMapping(value="wishView", method=RequestMethod.GET)
	public String wishView(int num, LikesDTO likesDTO,Model model) {
		
		int count=0;
		int check=0;
		
		try {
			
			model.addAttribute("dto", wishService.wishView(num));
			model.addAttribute("board","wish");
			
			count=likesService.likesCount(likesDTO);
			if(likesService.likesCheck(likesDTO)!=null){
				check=1;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("likes"+check);
		
		model.addAttribute("check", check);
		model.addAttribute("count", count);
		
		
	
		return "board/boardView";
	}
	
	
	//글쓰기
	@RequestMapping(value="wishWrite", method=RequestMethod.GET)
	public String wishWrite(Model model){
		
		model.addAttribute("board","wish");
		model.addAttribute("state","Write");
		return "board/boardWrite";
	}
	
	
	//글쓰기
	@RequestMapping(value="wishWrite", method=RequestMethod.POST)
	public String wishWrite(WishDTO wishDTO,RedirectAttributes redirectAttributes) throws Exception{
		System.out.println("WISH WRITE");
		StringBuffer sb=new StringBuffer();
	
		
		int [] list=new int[3];
		list[0]=Integer.parseInt(wishDTO.getCate1());
		list[1]=Integer.parseInt(wishDTO.getCate2());
		list[2]=Integer.parseInt(wishDTO.getCate3());
		CategoryDTO categoryDTO=new CategoryDTO();
		for(int i=0;i<3;i++){
				categoryDTO=wishService.category(list[i]);
				if(i==2){
					sb.append(categoryDTO.getName());
				}else{
					sb.append(categoryDTO.getName()+",");	
				}
		}
			
		System.out.println(sb.toString());
		wishDTO.setCategory(sb.toString());
		String msg="글쓰기 실패";
		int result=0;
		wishDTO.setKind("wish");
		result=wishService.wishWrite(wishDTO);
		if(result>0){
			msg="글쓰기 완료";
		}
		redirectAttributes.addFlashAttribute("msg", msg);
		return "redirect:/";
		
	}
	
	
	//수정
	@RequestMapping(value="wishUpdate", method=RequestMethod.GET)
	public String wishUpdate(int num, Model model){
		
		
		try {
			model.addAttribute("dto",wishService.wishView(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("board","wish");
		model.addAttribute("state","Update");
		
		return "board/boardWrite";
	}
	
	
	//수정 처리
	@RequestMapping(value="wishUpdate", method=RequestMethod.POST)
	public String wishMod(WishDTO wishDTO, RedirectAttributes redirectAttributes){
		String msg="수정 실패";
		int result=0;
		
		try {
			result=wishService.wishMod(wishDTO);
			if(result>0){
				msg="수정 성공";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		redirectAttributes.addFlashAttribute("msg", msg);
		
		return "redirect:/";
	}
	
	
	//DEL
	@RequestMapping(value="wishDelete", method=RequestMethod.GET)
	public String wishDel(int num, RedirectAttributes redirectAttributes){
		String msg="삭제 실패";
		int result=0;
		try {
			result = wishService.wishDel(num);
			if(result>0){
				msg="삭제 성공";
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		redirectAttributes.addFlashAttribute("msg", msg);
		return "redirect:/";
	}
	
	
	
	//답글
	@RequestMapping(value="wishReply", method=RequestMethod.GET)
	public String wishReply(int num,RedirectAttributes redirectAttributes){
		//num은 답글다는 게시글의 번호 
		redirectAttributes.addFlashAttribute("num", num);
		redirectAttributes.addFlashAttribute("board", "wish");
		
		return "/board/boardWrite";
	}
	
	
	
	
	
	@RequestMapping(value="wishReply", method=RequestMethod.POST)
	public String wishReply(WishDTO wishDTO, RedirectAttributes redirectAttributes){
		String path="redirect:/";
		String msg="답글 실패";
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("wish", wishDTO);
		int result=0;
		try {
			wishService.wishReply(map);
			result=(Integer)map.get("result");
			if(result>0){
				msg="답글작성 완료";
				path="redirect:/wish/wishList";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		redirectAttributes.addFlashAttribute("msg", msg);
		
		return path;
	}
	
	
	
}
