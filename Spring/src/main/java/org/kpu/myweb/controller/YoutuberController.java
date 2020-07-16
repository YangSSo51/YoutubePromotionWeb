package org.kpu.myweb.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.kpu.myweb.domain.RecipeVO;
import org.kpu.myweb.domain.YoutuberVO;
import org.kpu.myweb.service.YoutuberService;
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
	
	
	private static final Logger logger = LoggerFactory.getLogger(YoutuberController.class);
	
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
			mav.setViewName("redirect:/youtuber/login");
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
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String readYoutuber(HttpSession session, Model model) throws Exception {
		int id = (Integer) session.getAttribute("id");
    	YoutuberVO youtuber = youtuberSerivce.readYoutuber(id);
        model.addAttribute("youtuber", youtuber);
        model.addAttribute("id",id);
        return "youtuber/profile";
    }
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateYoutuberGet(@RequestParam("id") int id, Model model) throws Exception {
    	YoutuberVO youtuber = youtuberSerivce.readYoutuber(id);
    	model.addAttribute("youtuber",youtuber);
        return "youtuber/update";
    }

	
	@RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
	public String recipeDelete(@RequestParam("id") int id) throws Exception {
		youtuberSerivce.deleteYoutuber(id);
		return "redirect:/youtuber/login";
	}
	
	@RequestMapping("/getImage")
	@ResponseBody
    public ResponseEntity<byte[]> getImage(@RequestParam("name") String filename) throws Exception {
        HttpHeaders header = new HttpHeaders();
        header.setContentType(MediaType.IMAGE_JPEG);
        return new ResponseEntity<byte[]>(IOUtils.toByteArray(new FileInputStream(new File("C:\\temp\\"+filename))), header, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateYoutuberPost(MultipartHttpServletRequest mtf,@ModelAttribute("youtuber") YoutuberVO vo) throws Exception {
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
		System.out.println(vo.getId());
		logger.info(vo.toString());
        return "redirect:/youtuber/profile";
    }
}
