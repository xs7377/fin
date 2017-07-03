package com.choa.likes;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class LikesService {

	@Inject
	private LikesDAO likesDAO;
	
	public LikesDTO likesCheck(LikesDTO likesDTO) throws Exception{
		
		return likesDAO.likesCheck(likesDTO);
	}
	
	public int likes(LikesDTO likesDTO) throws Exception{
		
		return likesDAO.likes(likesDTO);
	}
	public int likesCount(LikesDTO likesDTO) throws Exception{
		
		return likesDAO.likesCount(likesDTO);
	}
	
	
}
