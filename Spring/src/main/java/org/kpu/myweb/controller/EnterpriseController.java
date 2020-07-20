package org.kpu.myweb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.EnterpriseVO;
import org.kpu.myweb.service.EnterpriseService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/enterprise")
public class EnterpriseController {
	


	@Autowired
	private EnterpriseService enterpriseService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(EnterpriseController.class);

    
	@RequestMapping(value = {"/register"}, method = RequestMethod.GET)
	public String createMemberGet() throws Exception {
		logger.info(" /register URL GET method called. then forward member_register.jsp.");
		return "member/member_register";
	}
	

    
	@RequestMapping(value = {"/signup"}, method = RequestMethod.GET)
	public String signupMemberGet() throws Exception {
		logger.info(" /register URL GET method called. then forward signup.jsp.");
		return "signup";
	}
	
	@RequestMapping(value = {"/signup"}, method = RequestMethod.POST)
	public String signupMemberPost( @ModelAttribute("user") EnterpriseVO vo) throws Exception {
		enterpriseService.addUser(vo);
		logger.info(vo.toString());
		logger.info(" /register URL GET method called. then forward signup.jsp.");
		return "redirect:/enterprise/login";
	}
	
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
	public String loginMemberGet() throws Exception {
		logger.info(" /register URL GET method called. then forward login.jsp.");
		return "enterprise/login";
	}
	/*
	@RequestMapping(value = {"/login"}, method = RequestMethod.POST)
	public ModelAndView loginMemberPost( @ModelAttribute("user") UserVO vo,HttpSession session) throws Exception {
		boolean result = userService.login(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.setViewName("home");
			mav.addObject("msg","success");
		}else {
			mav.setViewName("redirect:/member/login");
			mav.addObject("mgs","failure");
		}
		return mav;
	}*/
    
	@RequestMapping(value = {"/login"}, method = RequestMethod.POST)
	public ModelAndView loginMemberPost( @ModelAttribute("enterprise") EnterpriseVO vo,HttpSession session) throws Exception {
		//boolean result = userService.login(vo, session);
		boolean result = enterpriseService.login(vo,session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.setViewName("home");
			mav.addObject("msg","success");
		}else {
			mav.setViewName("redirect:/enterprise/login");
			mav.addObject("msg","failure");
		}
		return mav;
	}
	@RequestMapping(value= {"/logout"},method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception {
		enterpriseService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/enterprise/login");
		mav.addObject("msg","logout");
		return mav;
	}
	
	
/*  MemberControllerAdvice占쎈퓠 占쎌굙占쎌뇚筌ｌ꼶�봺 疫꿸퀡�뮟占쎌읅占쎌뒠    
    @ExceptionHandler(DataNotFoundException.class)
    public String handleException(DataNotFoundException e) {
        return "member/not_found";
    }
*/
   
}