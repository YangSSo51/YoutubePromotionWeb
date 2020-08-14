package org.kpu.myweb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.kpu.myweb.domain.ApplyVO;
import org.kpu.myweb.domain.EnterprisePostVO;
import org.kpu.myweb.domain.InviteVO;
import org.kpu.myweb.domain.YoutuberVO;
import org.kpu.myweb.service.ApplyService;
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
@RequestMapping(value="/apply")
public class ApplyController {
	
	@Autowired
    private ApplyService service;
	@Autowired
	private EnterprisePostService postService;

	private static final Logger logger = LoggerFactory.getLogger(ApplyController.class);
    
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String readYoutuber(@RequestParam("id") int id,Model model) throws Exception {
		model.addAttribute("id", id);
		logger.info(" /read?id=kang URL called. then readMemebr method executed.");
        return "/youtuber/popup/popup";
    }
	
	@RequestMapping(value = {"/"}, method = RequestMethod.POST)
	public String signupMemberPost(@ModelAttribute("Apply") ApplyVO vo,Model model) throws Exception {
		List<ApplyVO> Invite = service.readApplyList();
		if(service.checkOverlap(Invite, vo)){
			service.addApply(vo);
			model.addAttribute("result","신청이 완료되었습니다");
			return "enterprise/result";
		}else {
			model.addAttribute("result","이미 진행중인 신청입니다");
		}
		logger.info(" /register URL GET method called. then forward post.jsp.");
		return "/enterprise/result";
	}
	
	@RequestMapping(value = {"/list"}, method = RequestMethod.GET)
	public String ApplyListGet(@ModelAttribute("Apply") ApplyVO vo,Model model) throws Exception {
		List<ApplyVO> Apply = service.readApplyList();
		model.addAttribute("Apply",Apply);
		model.addAttribute("count",0);
		model.addAttribute("size",Apply.size());
		logger.info(" /register URL GET method called. then forward list.jsp.");
		return "youtuber/applyList";
	}
	
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateApplyGet(@RequestParam("id") int id, Model model) throws Exception {
    	ApplyVO Apply = service.readApply(id);
        model.addAttribute("Apply",Apply);
        return "/enterprise/update";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateApplyPost(MultipartHttpServletRequest mtf,@ModelAttribute("title") ApplyVO vo) throws Exception {
    	service.updateApply(vo);
		logger.info(vo.toString());
        return "redirect:/enterprise/list";
    }

	@RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
	public String ApplyDelete(@RequestParam("id") int id) throws Exception {
		service.deleteApply(id);
		logger.info(" /register URL GET method called. then forward detail.jsp.");
		return "redirect:/enterprise/list";
	}
	
	/* 기업 공고별 지원 현황 확인 */
	@RequestMapping(value = {"/youtuber/list"}, method = RequestMethod.GET)
	public String ApplyListGet(Model model, HttpSession session) throws Exception {
		int id = (Integer)session.getAttribute("ID");
		List<ApplyVO> apply = service.readListByYoutuberID(id); 
		List<EnterprisePostVO> post = new ArrayList<EnterprisePostVO>();
		EnterprisePostVO temp;
		
		for(int i=0; i<apply.size(); i++) {
			temp = postService.readEnterprisePost(apply.get(i).getPostID());
			post.add(temp);
		}
		model.addAttribute("Apply", apply);
		model.addAttribute("Post", post);
		logger.info(" /register URL GET method called. then forward list.jsp.");
		return "youtuber/apply_status";
	}     
}