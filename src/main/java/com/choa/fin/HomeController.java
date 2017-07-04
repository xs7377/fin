package com.choa.fin;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.auction.AuctionService;
import com.choa.auction.RankDTO;
import com.choa.auction.SearchDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private AuctionService auctionService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public void index(Model model)throws Exception{
		String [] icon={"fa fa-diamond","fa fa-gift","fa fa-car","fa fa-weixin","fa fa-heartbeat","fa fa-desktop","fa fa-book"};
		// getRank
		List<RankDTO> rank=auctionService.getRank();
		// getSearch (searchTop10)
		List<SearchDTO> searchTop10=auctionService.getSearch();
		// getRankMove
		List<Object> rankMove=auctionService.getRankMove(rank, searchTop10);
		model.addAttribute("li",auctionService.ctgAllList()).addAttribute("icon", icon);
		model.addAttribute("searchTop10", searchTop10);
		model.addAttribute("rankMove", rankMove);
	}
	
}
