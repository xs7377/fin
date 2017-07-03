package com.choa.fin;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.message.MessageDTO;
import com.choa.message.MessageService;
import com.choa.util.PageMaker;
import com.choa.util.RowMaker;

@Controller
@RequestMapping(value="/message/**")
public class MessageController {

	@Inject
	private MessageService messageService;
	
	//쪽지보내기
	@RequestMapping(value="messageSend",method=RequestMethod.POST)
	public String sendMessage(MessageDTO messageDTO, RedirectAttributes redirectAttributes){
		int result=0;
		String msg="쪽지 보내기 실패";
		try {
			result=messageService.messageSend(messageDTO);
			if(result>0){
				msg="쪽지 보내기 성공";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		redirectAttributes.addFlashAttribute("msg",msg);
		return "redirect:/";
	}
	
	
	
	//sendList
	@RequestMapping(value="sendList",method=RequestMethod.GET)
	@ResponseBody
	public void sendList(@RequestParam(defaultValue="1") int curPage, String from_id){
		Map<String, Object> map=new HashMap<String, Object>();
		
		PageMaker pageMaker=new PageMaker(curPage);
		RowMaker rowMaker=pageMaker.getRowMaker();
		rowMaker.makeRow(curPage, 10);
		
		map.put("from_id", from_id);
		map.put("startRow", rowMaker.getStartRow());
		map.put("lastRow", rowMaker.getLastRow());
		
		try {
			messageService.messageSendList(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//reciveList
	@RequestMapping(value="reciveList",method=RequestMethod.GET)
	@ResponseBody
	public void reciveList(@RequestParam(defaultValue="1") int curPage, String to_id){
		Map<String, Object> map=new HashMap<String, Object>();
		
		PageMaker pageMaker=new PageMaker(curPage);
		RowMaker rowMaker=pageMaker.getRowMaker();
		rowMaker.makeRow(curPage, 10);
		
		map.put("to_id", to_id);
		map.put("startRow", rowMaker.getStartRow());
		map.put("lastRow", rowMaker.getLastRow());
		
		try {
			messageService.messageReciveList(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//READ
	@RequestMapping(value="messageView", method=RequestMethod.GET)
	public String messageView(int num, int send_check, Model model,RedirectAttributes redirectAttributes){
		MessageDTO messageDTO =new MessageDTO();
		System.out.println(send_check);
		String path="redirect: /";
		//여기 손봐야함.
		try {
			messageDTO=messageService.messageView(num, send_check);
			if(messageDTO!=null){
				
				model.addAttribute("msgDTO", messageDTO);
				path="./message/messageView";
			}else{
				redirectAttributes.addFlashAttribute("msg", "읽기 실패");
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return path;
	}
	
	
	//삭제
	
	@ResponseBody
	@RequestMapping(value="messageDelete",method=RequestMethod.POST)
	public String messageDelete(int num){
		String msg="fail";
		int result=0;
		try {
			result=messageService.messageDelete(num);
			if(result>0){
				msg="success";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return msg;
	}
	
	
}
