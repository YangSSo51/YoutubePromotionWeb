package org.kpu.myweb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.ApplyVO;
import org.kpu.myweb.domain.EnterpriseVO;
import org.kpu.myweb.domain.UserVO;
import org.kpu.myweb.domain.YoutuberVO;
import org.kpu.myweb.service.EnterpriseService;
import org.kpu.myweb.service.UserService;
import org.kpu.myweb.youtube.YoutubeAPI2;
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
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String readYoutuber(HttpSession session, Model model) throws Exception {
		int id = (Integer) session.getAttribute("ID");
    	EnterpriseVO youtuber = enterpriseService.readUser(id);
    	UserVO user = userService.readUser(id);

        return "enterprise/profile";
    }
}