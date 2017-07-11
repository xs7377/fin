package com.choa.fin;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.board.BoardDTO;
import com.choa.likes.LikesDTO;
import com.choa.likes.LikesService;
import com.choa.notice.NoticeDTO;
import com.choa.notice.NoticeService;


@Controller
@RequestMapping(value="/notice/")
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;
	
	@Inject
	private LikesService likesService;
	
	
	@RequestMapping(value="noticeList", method=RequestMethod.GET)
	public String noticeList(Integer curPage, @RequestParam(required=false)String kinds, @RequestParam(required=false)String search, Model model){
		try {
			if(curPage==null){
				curPage=1;
			}
			if(kinds==null){
				kinds="num";
			}
			if(search==null){
				search="%";
			}
			System.out.println(kinds);
			System.out.println(search);
			Map<String, Object> map=noticeService.noticeList(curPage,kinds,search);
			model.addAttribute("list",map.get("list"));
			model.addAttribute("pageResult",map.get("pageResult"));
			model.addAttribute("board","notice");
			model.addAttribute("curPage",curPage);
			model.addAttribute("kind",kinds);
			model.addAttribute("search", search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "board/boardList";
	}
	
	@RequestMapping(value="noticeView", method=RequestMethod.GET)
	public String noticeView(int num,LikesDTO likesDTO ,Model model){
		int count=0;
		int check=0;
		
		
		try {
			model.addAttribute("dto", noticeService.noticeView(num));
			model.addAttribute("board","notice");
			count=likesService.likesCount(likesDTO);
			if(likesService.likesCheck(likesDTO)!=null){
				check=1;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		model.addAttribute("check", check);
		model.addAttribute("count", count);
		
		
		return "board/boardView";
	}
	
	@RequestMapping(value="noticeWrite", method=RequestMethod.GET)
	public String noticeWrite(Model model){
		BoardDTO boardDTO=new BoardDTO();
		model.addAttribute("dto",boardDTO);
		model.addAttribute("board","notice");
		model.addAttribute("state","Write");
		return "board/boardWrite";
	}
	
	@RequestMapping(value="noticeWrite", method=RequestMethod.POST)
	public String noticeWrite(NoticeDTO noticeDTO) throws Exception{
		int result=0;
		try {
			result=noticeService.noticeWrite(noticeDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String path="";
		if(result>0){
			path="redirect:./noticeList?curPage=1";	
			//	DB를 거쳐야 하기 때문에 jsp가 아니라 주소창에 입력(redirect)으로 컨트롤러를 거친다.
		}else{
			path="redirect:./noticeList?curPage=1";
		}
		return path;
	}
	
	@RequestMapping(value="noticeUpdate",method=RequestMethod.GET)
	public String noticeUpdate(int num,Model model){
		try {
			model.addAttribute("dto",noticeService.noticeView(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("board","notice");
		model.addAttribute("state","Update");
		return "board/boardWrite";
	}
	
	@RequestMapping(value="noticeUpdate",method=RequestMethod.POST)
	public String noticeUpdate(NoticeDTO noticeDTO){
		int result=0;
		try {
			result=noticeService.noticeUpdate(noticeDTO);
			System.out.println("result: "+result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String path="";
		if(result>0){
			path="redirect:./noticeList?curPage=1";	
		}else{
			path="redirect:./noticeList?curPage=1";
		}
		return path;
	}
	
	@RequestMapping(value="noticeDelete",method=RequestMethod.GET)
	public String noticeDelete(int num){
		int result=0;
		try {
			result=noticeService.noticeDelete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String path="";
		if(result>0){
			path="redirect:./noticeList?curPage=1";	
		}else{
			path="redirect:./noticeList?curPage=1";
		}
		return path;
	}
	
}
