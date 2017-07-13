package com.choa.fin;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.choa.likes.LikesDTO;
import com.choa.likes.LikesService;

@RestController
@RequestMapping(value="/likes/**")
public class LikesController {

	@Inject
	private LikesService likesService;
	
	
	//좋아요 추가 삭제.
	@RequestMapping(value="likesInsert", method=RequestMethod.POST)
	public Map<String, Object> likeInsert(LikesDTO likesDTO){
		int result=0;
		String msg="취소되었습니다";
		System.out.println("controller"+likesDTO.getKind());
		int count=0;
		Map<String, Object> map=new HashMap<String, Object>();
		try {
			result=likesService.likes(likesDTO);
			if(result==1){
				msg="찜하기~";
			}
			count=likesService.likesCount(likesDTO);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		map.put("msg", msg);
		map.put("count", count);
		
		return map;
	}
	
	@RequestMapping(value="likesCheck", method=RequestMethod.POST)
	@ResponseBody
	public LikesDTO likeCheck(LikesDTO likesDTO) throws Exception{
		return likesService.likesCheck(likesDTO);
	}
	
	

	
	
}
