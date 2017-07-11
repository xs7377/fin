package com.choa.util;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.auction.AuctionDTO;
import com.choa.freeBoard.FreeBoardDTO;
import com.choa.notice.NoticeDTO;
import com.choa.wish.WishDTO;

@Service
public class SearchService {

	@Inject
	private SearchDAO searchDAO;


	
	public List<FreeBoardDTO> searchFreeBoard(Map<String, Object> map) throws Exception{
		return searchDAO.searchFreeBoard(map);
	}
	public List<WishDTO> searchWish(Map<String, Object> map) throws Exception{
		return searchDAO.searchWish(map);
	}
	public List<NoticeDTO> searchNotice(Map<String, Object> map) throws Exception{
		return searchDAO.searchNotice(map);
	}
	/*public List<E> searchReview(Map<String, Object> map) throws Exception{

}*/


}
