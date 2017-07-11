package com.choa.fin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.reply.ReplyDTO;
import com.choa.review.ReviewDTO;
import com.choa.review.ReviewService;
import com.choa.util.PageMaker;
import com.choa.util.PageResult;
import com.choa.util.RowMaker;
import com.choa.wish.WishDTO;

import sun.reflect.generics.visitor.Reifier;

@Controller
@RequestMapping(value="/review/**")
public class ReviewController {

	@Inject
	private ReviewService reviewService;
	
	//List는 그거 뭐냐 pnum으로 where 
	
	//List
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	public String ReviewList(Integer curPage, String id , Model model) throws Exception{
	//list
	// String category, String kind,
			
			List<ReviewDTO> ar =new ArrayList<ReviewDTO>();
			Map<String, Object> map=new HashMap<String, Object>();
			PageMaker pageMaker=new PageMaker(curPage);
			RowMaker rowMaker=pageMaker.getRowMaker();
			PageResult pageResult=new PageResult();
			map.put("kind", "review");
			map.put("p_id", id);
			map.put("startRow", rowMaker.getStartRow());
			map.put("lastRow", rowMaker.getLastRow());
			//map설정
			
			ar=reviewService.reviewList(map);
			
			
			model.addAttribute("pageResult", pageResult);
			model.addAttribute("list", ar);
			model.addAttribute("p_id", id);
			model.addAttribute("board","review");
			model.addAttribute("curPage",curPage);
			
			return "auction/reviewBoard";
		}
	
	
	
	
	
	
	
	//view
	@RequestMapping(value="reviewView", method=RequestMethod.GET)
	public void reviewView(int num,Model model) throws Exception{
		System.out.println("===============VIEW=================");
		model.addAttribute("dto", reviewService.reviewView(num));
	}
	
	//write
	@RequestMapping(value="reviewWrite", method=RequestMethod.GET)
	public String reviewInsert(Model model) throws Exception{
		model.addAttribute("board","review");
		model.addAttribute("state","Write");
		return "board/boardWrite";
	}
	
	@RequestMapping(value="reviewWrite", method=RequestMethod.POST)
	public String reviewInsert(ReviewDTO reviewDTO,int rating,RedirectAttributes redirectAttributes) throws Exception{
		System.out.println("Review WRITE");
		System.out.println("별점:"+rating);
		//별점
		int result=0;
		String msg="작성 실패";
		reviewDTO.setScore(rating);
		result=reviewService.reviewInsert(reviewDTO);
		System.out.println(result);
		if(result>0){
			msg="글쓰기 완료";
		}
		redirectAttributes.addFlashAttribute("msg", msg);
		return "redirect:/";
		
	}
	
	//delete
	@RequestMapping(value="reviewDelete", method=RequestMethod.GET)
	public String reviewDelete(int num, RedirectAttributes redirectAttributes) throws Exception{
		int result=0;
		String msg="삭제 실패";
		result=reviewService.reviewDelete(num);
		if(result>0){
			msg="삭제 성공";
		}
		
		redirectAttributes.addFlashAttribute("msg", msg);
		return "redirect:/"; 
	}
	
	@RequestMapping(value="reviewUpdate", method=RequestMethod.GET)
	public String reviewMod(int num,Model model) throws Exception{
		ReviewDTO reviewDTO=new ReviewDTO();
		model.addAttribute("dto", reviewService.reviewView(num));
		model.addAttribute("board","review");
		model.addAttribute("state","Update");
		
		return "board/boardWrite";
		
		
	}
	//tnwjd
	@RequestMapping(value="reviewUpdate", method=RequestMethod.POST)
	public String reviewMod(ReviewDTO reviewDTO, RedirectAttributes redirectAttributes) throws Exception{
		String msg="수정 실패";
		int result=0;
		result=reviewService.reviewUpdate(reviewDTO);
		if(result>0){
		msg="수정 성공";
		}
		redirectAttributes.addFlashAttribute("msg", msg);
	
		return "redirect:/";
	}
	
	
		//답글
		@RequestMapping(value="reviewReply", method=RequestMethod.GET)
		public String wishReply(int num,RedirectAttributes redirectAttributes) throws Exception{			//num은 답글다는 게시글의 번호 
			redirectAttributes.addFlashAttribute("num", num);
			redirectAttributes.addFlashAttribute("board", "review");
			
			return "/board/boardWrite";
		}
	
	
		@RequestMapping(value="revieReply", method=RequestMethod.POST)
		public String wishReply(ReviewDTO reviewDTO, RedirectAttributes redirectAttributes) throws Exception{
			String path="redirect:/";
			String msg="답글 실패";
			Map<String, Object> map= new HashMap<String, Object>();
			map.put("review", reviewDTO);
			int result=0;
			
				reviewService.reivewReply(map);
				result=(Integer)map.get("result");
				if(result>0){
					msg="답글작성 완료";
					path="redirect:/wish/wishList";
				}
			
			redirectAttributes.addFlashAttribute("msg", msg);
			
			return path;
		}
	
	
	
}
