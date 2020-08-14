package org.kpu.myweb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.kpu.myweb.domain.InviteVO;
import org.kpu.myweb.domain.YoutuberVO;
import org.kpu.myweb.domain.EnterprisePostVO;
import org.kpu.myweb.domain.EnterpriseVO;
import org.kpu.myweb.service.InviteService;
import org.kpu.myweb.service.YoutuberService;
import org.kpu.myweb.service.EnterprisePostService;
import org.kpu.myweb.service.EnterpriseService;
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
@RequestMapping(value="/invite")
public class InviteController {
	
	@Autowired
    private InviteService service;
	@Autowired
	private YoutuberService youtuberservice;
	@Autowired
	private EnterprisePostService postservice;
	@Autowired
    private EnterprisePostService enterservice;

	private static final Logger logger = LoggerFactory.getLogger(InviteController.class);
    
	/* 기업 초대 등록 
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String readYoutuberList(@RequestParam("id") int id,Model model) throws Exception {
		List<YoutuberVO> youtuber = youtuberservice.readYoutuberList();
		model.addAttribute("postID", id);
		model.addAttribute("Youtuber", youtuber);
		logger.info(" /read?id=kang URL called. then readMemebr method executed.");
        return "/enterprise/popup/popup";
    }*/
	
	@RequestMapping(value = {"/"}, method = RequestMethod.POST)
	public String signupMemberPost(@ModelAttribute("Invite") InviteVO vo,Model model) throws Exception {
		List<InviteVO> Invite = service.readInviteList();
		if(service.checkOverlap(Invite, vo)){
			service.addInvite(vo);
			model.addAttribute("result","초대가 완료되었습니다");
			return "enterprise/result";
		}else {
			model.addAttribute("result","이미 진행중인 초대입니다");
		}
		logger.info(" /register URL GET method called. then forward post.jsp.");
		return "enterprise/result";
	}

	/* 기업 초대 삭제 */
	@RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
	public String InviteDelete(@RequestParam("id") int id) throws Exception {
		service.deleteInvite(id);
		logger.info(" /register URL GET method called. then forward detail.jsp.");
		return "redirect:/enterprise/list";
	}
	
	/* 기업 공고별 초대 현황 */
	@RequestMapping(value = "/enterprise/list", method = RequestMethod.GET)
    public String myInviteList(@RequestParam("id") int id,Model model) throws Exception {
		List<InviteVO> Invite = service.readListByPostID(id);
		ArrayList<YoutuberVO> Youtuber = new ArrayList<YoutuberVO>();
		ArrayList<String> result = new ArrayList<String>();	
		YoutuberVO temp;
		
		for(int i=0; i<Invite.size(); i++) {
			temp = youtuberservice.readYoutuber(Invite.get(i).getYoutuberID());
			Youtuber.add(temp);
			if(Invite.get(i).getResult()==0) Invite.get(i).setPhoneNo("");
		}
		model.addAttribute("Invite", Invite);
		model.addAttribute("Youtuber", Youtuber);
        return "/enterprise/invite_status";
    }
	
	/* 유튜버 초대 목록 확인 */
	@RequestMapping(value = {"/youtuber/list"}, method = RequestMethod.GET)
	public String InviteListGet(Model model, HttpSession session) throws Exception{
		int youtuberID = (Integer)session.getAttribute("ID"); // 세션에서 받아온 youtuberID
		List<InviteVO> Invite = service.readListByYoutuberID(youtuberID);
		List<EnterprisePostVO> postList = new ArrayList<EnterprisePostVO>();
		EnterprisePostVO temp;
		for(int i=0; i < Invite.size(); i++) {
			temp = postservice.readEnterprisePost(Invite.get(i).getPostID());
			postList.add(temp);
		}
		model.addAttribute("postList",postList);
		model.addAttribute("Invite", Invite);
		model.addAttribute("count",0);
		model.addAttribute("size",postList.size());
		logger.info(" /register URL GET method called. then forward list.jsp.");
		
		return "/youtuber/invite_status";
	}
	
	
	@RequestMapping(value = "/accept", method = RequestMethod.GET)
    public String acceptInvite(@RequestParam("inviteid") int inviteid,Model model) throws Exception {
		model.addAttribute("inviteid", inviteid);
        return "/youtuber/popup/invite_popup2";
    }
	
	
	@RequestMapping(value = "/accept", method = RequestMethod.POST)
    public String InsertInviteInfo(@ModelAttribute("Invite") InviteVO vo,Model model) throws Exception {
		InviteVO invite = service.readInvite(vo.getId());
		invite.setPhoneNo(vo.getPhoneNo());
		invite.setResult(1); // 수락
		service.updateInvite(invite);
		model.addAttribute("result","초대가 승인되었습니다");
        return "/enterprise/result";
    }
	
	@RequestMapping(value = "/reject", method = RequestMethod.GET)
    public String rejectInvite(@RequestParam("inviteid") int inviteid,Model model) throws Exception {
		InviteVO invite = service.readInvite(inviteid);
		invite.setResult(2); // 거절
		service.updateInvite(invite);
        return "redirect:/invite/youtuber/list";
    }

}