package com.choa.fin;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.board.BoardDTO;
import com.choa.freeBoard.FreeBoardDTO;
import com.choa.freeBoard.FreeBoardService;
import com.choa.likes.LikesDTO;
import com.choa.likes.LikesService;

@Controller
@RequestMapping(value="/freeBoard/")
public class FreeBoardController {
	
	@Inject
	private FreeBoardService freeBoardService;
	@Inject
	private LikesService likesService;
	
	@RequestMapping(value="freeBoardList", method=RequestMethod.GET)
	public String freeBoardList(Integer curPage, String kinds, String search, Model model){
		try {
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
			Map<String, Object> map=freeBoardService.freeBoardList(curPage, kinds, search);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("pageResult",map.get("pageResult"));
			model.addAttribute("board","freeBoard");
			model.addAttribute("curPage",curPage);
			model.addAttribute("kind",kinds);
			model.addAttribute("search", search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "board/boardList";
	}
	
	@RequestMapping(value="freeBoardView",method=RequestMethod.GET)
	public String freeBoardView(int num,LikesDTO likesDTO,Model model){
		int count=0;
		int check=0;
		
	
		try {
			model.addAttribute("dto",freeBoardService.freeBoardView(num));
			model.addAttribute("board","freeBoard");
			
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
	
	@RequestMapping(value="freeBoardWrite",method=RequestMethod.GET)
	public String freeBoardWrite(Model model){
		BoardDTO boardDTO=new BoardDTO();
		model.addAttribute("dto",boardDTO);
		
		model.addAttribute("board","freeBoard");
		model.addAttribute("state","Write");
		return "board/boardWrite";
	}
	
	@RequestMapping(value="freeBoardWrite",method=RequestMethod.POST)
	public String freeBoardWrite(FreeBoardDTO freeBoardDTO){
		int result=0;
		try {
			result = freeBoardService.freeBoardWrite(freeBoardDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String path="";
		if(result>0){
			path="redirect:./freeBoardList?curPage=1";
		}
		
		return path;
	}
	
	@RequestMapping(value="freeBoardUpdate",method=RequestMethod.GET)
	public String freeBoardUpdate(int num,Model model){
		try {
			model.addAttribute("dto",freeBoardService.freeBoardView(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("board","freeBoard");
		model.addAttribute("state","Update");
		return "board/boardWrite";
	}
	
	@RequestMapping(value="freeBoardUpdate",method=RequestMethod.POST)
	public String freeBoardUpdate(FreeBoardDTO freeBoardDTO){
		int result=0;
		try {
			result = freeBoardService.freeBoardUpdate(freeBoardDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String path="";
		if(result>0){
			path="redirect:./freeBoardList?curPage=1";
		}
		return path;
	}
	
	@RequestMapping(value="freeBoardDelete", method=RequestMethod.GET)
	public String freeBoardDelete(int num){
		int result=0;
		try {
			result = freeBoardService.freeBoardDelete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String path="";
		if(result>0){
			path="redirect:./freeBoardList?curPage=1";
		}
		return path;
	}
	
	@RequestMapping(value="freeBoardReply",method=RequestMethod.POST)
	public String freeBoardReply(FreeBoardDTO freeBoardDTO){
		int result=0;
		try {
			result = freeBoardService.freeBoardReply(freeBoardDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String path="";
		if(result>0){
			path="redirect:./freeBoardList?curPage=1";
		}
		return path;
	}
	
}
