package org.kpu.myweb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.kpu.myweb.domain.InviteVO;
import org.kpu.myweb.domain.YoutuberVO;
import org.kpu.myweb.domain.EnterprisePostVO;
import org.kpu.myweb.service.InviteService;
import org.kpu.myweb.service.YoutuberService;
import org.kpu.myweb.service.EnterprisePostService;
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
	@Autowired
	private YoutuberService youtuberservice;
	@Autowired
	private EnterprisePostService postservice;

	private static final Logger logger = LoggerFactory.getLogger(InviteController.class);
    
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String readYoutuberList(@RequestParam("id") int id,Model model) throws Exception {
		List<YoutuberVO> youtuber = youtuberservice.readYoutuberList();
		model.addAttribute("postID", id);
		model.addAttribute("Youtuber", youtuber);
		logger.info(" /read?id=kang URL called. then readMemebr method executed.");
        return "/enterprise/popup";
    }
	
	@RequestMapping(value = {"/"}, method = RequestMethod.POST)
	public String signupMemberPost(@ModelAttribute("Invite") InviteVO vo) throws Exception {
		List<InviteVO> Invite = service.readInviteList();
		if(service.checkOverlap(Invite, vo)){
			service.addInvite(vo);
			return "enterprise/popup_finish";
		}
		logger.info(" /register URL GET method called. then forward post.jsp.");
		return "enterprise/popup_fail";
	}
	
	@RequestMapping(value = {"/youtuberlist"}, method = RequestMethod.GET)
	public String InviteListGet(@ModelAttribute("postList") EnterprisePostVO vo, Model model) throws Exception {
		int youtuberID = 1; // 임시
		
		List<InviteVO> Invite = service.readListByYoutuberID(youtuberID);
		List<EnterprisePostVO> postList = new ArrayList<EnterprisePostVO>();
		EnterprisePostVO temp;
		for(int i=0; i < Invite.size(); i++) {
			temp = postservice.readEnterprisePost(Invite.get(i).getPostID());
			postList.add(temp);
		}
		model.addAttribute("Invite_post",postList);
		model.addAttribute("count",0);
		model.addAttribute("size",postList.size());
		logger.info(" /register URL GET method called. then forward list.jsp.");
		
		return "/youtuber/invite_status";
	}
	

	@RequestMapping(value = "/choice", method = RequestMethod.GET)
    public String choiceInvite(@RequestParam("id") int id,Model model) throws Exception {
		EnterprisePostVO post = postservice.readEnterprisePost(id);
		model.addAttribute("EnterprisePost", post);
		logger.info(" /read?id=kang URL called. then readMemebr method executed.");
        return "/youtuber/invite_popup";
    }
	
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateInviteGet(@RequestParam("id") int id, Model model) throws Exception {
    	InviteVO Invite = service.readInvite(id);
        model.addAttribute("Invite",Invite);
        return "/enterprise/update";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateInvitePost(@ModelAttribute("Invite") InviteVO vo, Model model) throws Exception {
    	vo.setResult(2); // 거절
    	service.updateInvite(vo);
        return "redirect:/enterprise/list";
    }

	@RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
	public String InviteDelete(@RequestParam("id") int id) throws Exception {
		service.deleteInvite(id);
		logger.info(" /register URL GET method called. then forward detail.jsp.");
		return "redirect:/enterprise/list";
	}
	
	
}