package com.choa.fin;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.friend.FriendDTO;
import com.choa.friend.FriendService;

@Controller
@RequestMapping(value="/friend/**")
public class FriendController {

	@Inject
	private FriendService friendService;
	
	@RequestMapping(value="friendList", method=RequestMethod.GET)
	public void friend(){
		
	}
	
	@RequestMapping(value="friendAdd", method=RequestMethod.GET)
	public String friendAdd(FriendDTO friendDTO, RedirectAttributes redirectAttributes){
		System.out.println(friendDTO.getF_id());
		friendDTO.setM_id("sonaaaa");
		String msg="이미 추가되어있음";
		try {
		
			if(friendService.friendCheck(friendDTO)!=null){
				System.out.println("친추 되어있음.");
			}else{
				System.out.println("친추 안되어있음");
				friendService.friendAdd(friendDTO);
				msg="친구추가 완료";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(msg);
		redirectAttributes.addFlashAttribute("msg",msg);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="friendDel", method=RequestMethod.GET)
	public String friendDel(FriendDTO friendDTO, RedirectAttributes redirectAttributes){
		System.out.println(friendDTO.getF_id());
		friendDTO.setM_id("sonaaaa");
		String msg="친구가 아닙니다.";
		
		try {
			if(friendService.friendCheck(friendDTO)!=null){
			friendService.friendDelete(friendDTO);
			msg="친구삭제 완료";
			}else{
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		redirectAttributes.addFlashAttribute("msg", msg);
		return "redirect:/";
	}
	
	
	
}
