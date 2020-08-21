package org.kpu.myweb.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kpu.myweb.service.EnterpriseService;
import org.kpu.myweb.service.UserService;
import org.kpu.myweb.service.YoutuberService;
import org.kpu.myweb.youtube.YoutubeAPI2;
import org.kpu.myweb.domain.EnterprisePostVO;
import org.kpu.myweb.domain.EnterpriseVO;
import org.kpu.myweb.domain.UserVO;
import org.kpu.myweb.domain.YoutuberVO;
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
@RequestMapping(value="")
public class UserController {

	@Autowired
	private UserService service;
	@Autowired
	private EnterpriseService enterservice;
	@Autowired
	private YoutuberService youtuberservice;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	// 로그인 
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(@RequestParam(value="msg", required=false) String msg, Model model) {
		logger.info("Is this process login?");
		return "/login";
	}

	// 회원등록 (기업)
	@RequestMapping(value="/register/enterprise", method=RequestMethod.GET)
	public String enterRegisterGet(@ModelAttribute("User") UserVO user) throws Exception {
		return "/admin/enterpriseRegister";
	}
	@RequestMapping(value="/register/enterprise", method=RequestMethod.POST)
	public String enterRegisterPost(@ModelAttribute("User") UserVO user, @ModelAttribute("EnterpriseVO") EnterpriseVO vo) throws Exception {
		service.addUser(user); // username과 password 설정
		int enterID = service.readID(user.getUsername());// addUser 한 후, id받아와서 
		vo.setId(enterID); 
		enterservice.addUser(vo); // vo에 id 설정 후 enterprise_auth에 addUser
		logger.info("user : " + user.getUsername() + user.getPassword() + user.getAuthorities());
		// return "redirect:/register/enterprise";
		return "/admin/enterpriseRegister";
	}
	
	// 회원등록 (유튜버)
	@RequestMapping(value="/register/youtuber", method=RequestMethod.GET)
	public String youRegisterGet(@ModelAttribute("User") UserVO user) throws Exception {
		return "/admin/youtuberRegister";
	}
	@RequestMapping(value="/register/youtuber", method=RequestMethod.POST)
	public String youRegisterPost(@ModelAttribute("User") UserVO user, @ModelAttribute("YoutuberVO") YoutuberVO vo) throws Exception {
		service.addUser(user); // username과 password 설정	
		int youID = service.readID(user.getUsername()); // addUser 한 후, id받아와서 
		vo.setId(youID); 
		
    	YoutubeAPI2 api = new YoutubeAPI2();
    	List<String> profile = api.getYoutubeProfile(user.getUsername()); // 0: 채널명, 1: 채널개설일, 2: 구독자수, 3: 썸네일
		vo.setImage(profile.get(3)); // 채널 썸네일 이미지에 설정
		youtuberservice.addYoutuber(vo);
		logger.info("user : " + user.getUsername() + user.getPassword() + user.getAuthorities());
		return "/admin/youtuberRegister";
	}
	

	/*비밀번호 확인*/
	@RequestMapping(value = {"/password"}, method = RequestMethod.GET)
	public String loginMemberGet(@RequestParam("next") String next,Model model) throws Exception {
		model.addAttribute("next",next);
		return "/user/password";
	}
	    
		@RequestMapping(value = {"/password"}, method = RequestMethod.POST)
		public String loginMemberPost( @ModelAttribute("User") UserVO vo,@RequestParam("next") String next,HttpSession session,Model model) throws Exception {
			boolean result = service.login(vo);
			if(result == true) {
				if(next.equals("update")) return "redirect:/youtuber/update?id="+vo.getId();
				else if(next.equals("enter_update")) return "redirect:/enter/update?id="+vo.getId();
				else return "redirect:/delete?id="+vo.getId();
			}else {
				model.addAttribute("result","비밀번호가 맞지 않습니다.");
			}
			return "/enterprise/result";
		}
		
    /* 회원목록 확인 */
	@RequestMapping(value = {"/list"}, method = RequestMethod.GET)
	public String UserList(Model model) throws Exception {
		List<UserVO> user = service.readUserList();
		List<String> auth = new ArrayList<String>();
		String temp;

		for(int i=0; i<user.size(); i++) {
			String username = user.get(i).getUsername();
			temp = service.readAuthByUsername(username);
			if(temp.equals("ROLE_ENTERPRISE")) temp="기업";
			else if(temp.equals("ROLE_YOUTUBER")) temp="유튜버";
			else temp="관리자";
			auth.add(temp);
		}
		model.addAttribute("user", user);
		model.addAttribute("auth", auth);
		return "/admin/list";
	}
	
	/* 프로필에서 본인이 회원탈퇴 */
	@RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
	public String UserDelete(@RequestParam("id") int id) throws Exception {
		service.deleteUser(id);
		return "redirect:/logout";
	}
	
    /* 관리자가 회원삭제 */
	@RequestMapping(value = {"/deleteUser"}, method = RequestMethod.GET)
	public String AdminUserDelete(@RequestParam("id") int id) throws Exception {
		service.deleteUser(id);
		return "redirect:/list";
	}
}