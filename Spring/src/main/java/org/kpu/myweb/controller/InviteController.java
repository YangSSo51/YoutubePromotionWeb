package org.kpu.myweb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.kpu.myweb.domain.InviteVO;
import org.kpu.myweb.domain.SearchVO;
import org.kpu.myweb.service.InviteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
@RequestMapping(value="/enterprise/invite")
public class InviteController {
	
	@Autowired
    private InviteService service;

	private static final Logger logger = LoggerFactory.getLogger(InviteController.class);
    
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String readYoutuber(@RequestParam("id") int id,Model model) throws Exception {
		model.addAttribute("postID", id);
		logger.info(" /read?id=kang URL called. then readMemebr method executed.");
        return "/enterprise/popup";
    }
	
	@RequestMapping(value = {"/"}, method = RequestMethod.POST)
	public String signupMemberPost(@ModelAttribute("Invite") InviteVO vo) throws Exception {
		service.addInvite(vo);
		logger.info(" /register URL GET method called. then forward post.jsp.");
		return "/enterprise/list";
	}
	
	
	@RequestMapping(value = {"/list"}, method = RequestMethod.GET)
	public String InviteListGet(@ModelAttribute("Invite") InviteVO vo,Model model) throws Exception {
		List<InviteVO> Invite = service.readInviteList();
		model.addAttribute("Invite",Invite);
		model.addAttribute("count",0);
		model.addAttribute("size",Invite.size());
		logger.info(" /register URL GET method called. then forward list.jsp.");
		return "/enterprise/list";
	}
	
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateInviteGet(@RequestParam("id") int id, Model model) throws Exception {
    	InviteVO Invite = service.readInvite(id);
        model.addAttribute("Invite",Invite);
        return "/enterprise/update";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateInvitePost(MultipartHttpServletRequest mtf,@ModelAttribute("title") InviteVO vo) throws Exception {
    	service.updateInvite(vo);
		logger.info(vo.toString());
        return "redirect:/enterprise/list";
    }

	@RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
	public String InviteDelete(@RequestParam("id") int id) throws Exception {
		service.deleteInvite(id);
		logger.info(" /register URL GET method called. then forward detail.jsp.");
		return "redirect:/enterprise/list";
	}
	
}