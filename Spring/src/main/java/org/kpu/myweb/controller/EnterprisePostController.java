package org.kpu.myweb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.kpu.myweb.domain.EnterprisePostVO;
import org.kpu.myweb.domain.SearchVO;
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
@RequestMapping(value="/enterprise")
public class EnterprisePostController {
	
	@Autowired
    private EnterprisePostService service;

	private static final Logger logger = LoggerFactory.getLogger(EnterprisePostController.class);
    
	@RequestMapping(value = {"/post"}, method = RequestMethod.GET)
	public String postEnterprisePostGet() throws Exception {
		logger.info(" /register URL GET method called. then forward post.jsp.");
		return "/enterprise/post";
	}
	
	@RequestMapping(value = {"/post"}, method = RequestMethod.POST)
	public String signupMemberPost(MultipartHttpServletRequest mtf,@ModelAttribute("EnterprisePost") EnterprisePostVO vo) throws Exception {
		String fileTag = "file";
		String filePath = "C:\\temp\\";
		//MultipartFile file = mtf.getFile(fileTag);
		//String fileName = file.getOriginalFilename();
		//vo.setImage(fileName);
		//try{
		//	file.transferTo(new File(filePath+fileName));
		//}catch(Exception e) {
		//	System.out.println("업로드 오류");
		//}
		service.addEnterprisePost(vo);
		logger.info(" /register URL GET method called. then forward post.jsp.");
		return "redirect:/enterprise/list";
	}

	
	
	@RequestMapping(value = {"/list"}, method = RequestMethod.GET)
	public String EnterprisePostListGet(@ModelAttribute("EnterprisePost") EnterprisePostVO vo,Model model) throws Exception {
		List<EnterprisePostVO> EnterprisePost = service.readEnterprisePostList();
		model.addAttribute("EnterprisePost",EnterprisePost);
		model.addAttribute("count",0);
		model.addAttribute("size",EnterprisePost.size());
		logger.info(" /register URL GET method called. then forward list.jsp.");
		return "/enterprise/list";
	}
	
	@RequestMapping(value = {"/search"}, method = RequestMethod.POST)
	public String EnterprisePostSearchPost(@RequestParam String title, Model model) throws Exception {		
		List<EnterprisePostVO> postlist = service.searchEnterprisePost(title);
		model.addAttribute("EnterprisePost",postlist);
		//int count=0;
		//if(vo.getSearch1()!="") count++;
		//model.addAttribute("count",count);
		model.addAttribute("size",postlist.size());

		return "/enterprise/list";
	}
	
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateEnterprisePostGet(@RequestParam("id") int id, Model model) throws Exception {
    	EnterprisePostVO EnterprisePost = service.readEnterprisePost(id);
        model.addAttribute("EnterprisePost",EnterprisePost);
        return "/enterprise/update";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateEnterprisePostPost(MultipartHttpServletRequest mtf,@ModelAttribute("title") EnterprisePostVO vo) throws Exception {
		String fileTag = "file";
		String filePath = "C:\\temp\\";
		MultipartFile file = mtf.getFile(fileTag);
		String fileName = file.getOriginalFilename();
		if(fileName!="") {
			vo.setImage(fileName);
			try{
				file.transferTo(new File(filePath+fileName));
			}catch(Exception e) {
				System.out.println("업로드 오류");
			}
		}
    	service.updateEnterprisePost(vo);
		logger.info(vo.toString());
        return "redirect:/enterprise/list";
    }
    
	@RequestMapping("/getImage")
	@ResponseBody
    public ResponseEntity<byte[]> getImage(@RequestParam("name") String filename) throws Exception {
        HttpHeaders header = new HttpHeaders();
        header.setContentType(MediaType.IMAGE_JPEG);
        return new ResponseEntity<byte[]>(IOUtils.toByteArray(new FileInputStream(new File("C:\\temp\\"+filename))), header, HttpStatus.CREATED);
    }
	
	@RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
	public String EnterprisePostDelete(@RequestParam("id") int id) throws Exception {
		service.deleteEnterprisePost(id);
		logger.info(" /register URL GET method called. then forward detail.jsp.");
		return "redirect:/enterprise/list";
	}
	
	@RequestMapping(value = {"/detail"}, method = RequestMethod.GET)
	public String EnterprisePostDetailById(@RequestParam("id") int id,Model model) throws Exception {
		EnterprisePostVO EnterprisePost = service.readEnterprisePost(id);
		model.addAttribute("EnterprisePost",EnterprisePost);
		String[] detail = EnterprisePost.getDescription().split("\r\n");
		model.addAttribute("detail",detail);
		logger.info(" /register URL GET method called. then forward detail.jsp.");
		return "/enterprise/detail";
	}
	    
	@RequestMapping(value = "/read", method = RequestMethod.GET)
    public String readMember(@RequestParam("id") int id, Model model) throws Exception {
    	EnterprisePostVO EnterprisePost = service.readEnterprisePost(id);
		logger.info(" /read?id=kang URL called. then readMemebr method executed.");
        model.addAttribute("EnterprisePost", EnterprisePost);
        return "/enterprise/detail";
    }
	
}