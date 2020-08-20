package org.kpu.myweb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.kpu.myweb.domain.UserVO;
import org.kpu.myweb.domain.YoutuberVO;
import org.kpu.myweb.service.UserService;
import org.kpu.myweb.service.YoutuberService;
import org.kpu.myweb.youtube.YoutubeAPI2;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/youtuber")
public class YoutuberController {
	@Autowired
	private YoutuberService youtuberSerivce;
	@Autowired
	private UserService userService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(YoutuberController.class);
	
	@RequestMapping(value="/question",method=RequestMethod.GET)
	public String question() {
		return "question";
	}
	
	@RequestMapping(value="/description",method=RequestMethod.GET)
	public String description() {
		return "youtuber/description";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String readYoutuber(HttpSession session, Model model) throws Exception {
		int id = (Integer) session.getAttribute("ID");
    	YoutuberVO youtuber = youtuberSerivce.readYoutuber(id);
    	UserVO user = userService.readUser(id);
    
    	String channelId = user.getUsername(); // 유튜버 채널ID
    	List<String> profile = new ArrayList<String>();
    	YoutubeAPI2 api = new YoutubeAPI2();
    	profile = api.getYoutubeProfile(channelId); // 0 : 채널명, 1 : 채널개설일, 2: 구독자수
    	logger.info("api : " + profile);
    	// 구독자 수 (만 단위)
    	String subscriber = "";
    	int size = profile.get(2).length();
    	if(size > 5)
    	subscriber = profile.get(2).substring(0, size-4) + "만 " 
    			+ profile.get(2).substring(size-4, size) + "명";
    	else
    		subscriber = profile.get(2) + "명";
    	
    	model.addAttribute("channelTitle", profile.get(0));
    	model.addAttribute("publishedDate", profile.get(1));
    	model.addAttribute("subscriber", subscriber);
        model.addAttribute("youtuber", youtuber);
        model.addAttribute("channelUrl", "https://www.youtube.com/channel/" + channelId);
        model.addAttribute("ID",id);
        return "youtuber/profile";
    }
	
	@RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
	public String recipeDelete(@RequestParam("id") int id) throws Exception {
		youtuberSerivce.deleteYoutuber(id);
		return "redirect:/login";
	}
	
	@RequestMapping("/getImage")
	@ResponseBody
    public ResponseEntity<byte[]> getImage(@RequestParam("name") String filename) throws Exception {
        HttpHeaders header = new HttpHeaders();
        header.setContentType(MediaType.IMAGE_JPEG);
        return new ResponseEntity<byte[]>(IOUtils.toByteArray(new FileInputStream(new File("C:\\temp\\"+filename))), header, HttpStatus.CREATED);
    }
    
	@RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateYoutuberGet(@RequestParam("id") int id, Model model) throws Exception {
    	YoutuberVO youtuber = youtuberSerivce.readYoutuber(id);
    	UserVO user = userService.readUser(id);
    	model.addAttribute("channel", user.getUsername());
    	model.addAttribute("youtuber",youtuber);
        return "youtuber/update";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateYoutuberPost(MultipartHttpServletRequest mtf,
    									@ModelAttribute("youtuber") YoutuberVO vo,
    									@ModelAttribute("user") UserVO user) throws Exception {
		String fileTag = "file";
		String filePath = "C:\\temp\\";
		MultipartFile file = mtf.getFile(fileTag);
		String image = file.getOriginalFilename();
		if(image!="") {
			vo.setImage(image);
			try{
				file.transferTo(new File(filePath+image));
			}catch(Exception e) {
				System.out.println("업로드 오류");
			}
		}
		vo.setImage(image);
		youtuberSerivce.updateYoutuber(vo);
		
		if(user.getPassword().length() > 0) {// 비밀번호 변경
			user.setId(vo.getId());
			userService.updateUser(user); 
		}
        return "redirect:/youtuber/profile";
    }
}
