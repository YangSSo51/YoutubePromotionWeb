package org.kpu.myweb.controller;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.YoutuberVO;
import org.kpu.myweb.service.YoutuberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/youtuber")
public class YoutuberController {
	@Autowired
	private YoutuberService youtuberSerivce;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="/question",method=RequestMethod.GET)
	public String question() {
		return "question";
	}
	
	@RequestMapping(value="/description",method=RequestMethod.GET)
	public String description() {
		return "youtuber/description";
	}
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
	public String loginMemberGet() throws Exception {
		logger.info(" /register URL GET method called. then forward login.jsp.");
		return "youtuber/login";
	}
    
	@RequestMapping(value = {"/login"}, method = RequestMethod.POST)
	public ModelAndView loginMemberPost( @ModelAttribute("youtuber") YoutuberVO vo,HttpSession session) throws Exception {
		boolean result = youtuberSerivce.login(vo,session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.setViewName("home");
			mav.addObject("msg","success");
		}else {
			mav.setViewName("redirect:/member/login");
			mav.addObject("msg","failure");
		}
		return mav;
	}
	@RequestMapping(value= {"/logout"},method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception {
		youtuberSerivce.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/login");
		mav.addObject("msg","logout");
		return mav;
	}
	
}
