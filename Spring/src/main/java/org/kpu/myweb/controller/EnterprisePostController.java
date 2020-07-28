package org.kpu.myweb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.kpu.myweb.domain.ApplyVO;
import org.kpu.myweb.domain.EnterprisePostVO;
import org.kpu.myweb.domain.YoutuberVO;
import org.kpu.myweb.service.EnterprisePostService;
import org.kpu.myweb.service.YoutuberService;
import org.kpu.myweb.service.ApplyService;
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
	@Autowired
	private ApplyService applyservice;
	@Autowired
	private YoutuberService youtuberservice;

	private static final Logger logger = LoggerFactory.getLogger(EnterprisePostController.class);
    
	/* 기업 공고 등록 */
	@RequestMapping(value = {"/post"}, method = RequestMethod.GET)
	public String postEnterprisePostGet() throws Exception {
		logger.info(" /register URL GET method called. then forward post.jsp.");
		return "/enterprise/post";
	}
	
	@RequestMapping(value = {"/post"}, method = RequestMethod.POST)
	public String postEnterprisePost(MultipartHttpServletRequest mtf, @ModelAttribute("EnterprisePost") EnterprisePostVO vo) throws Exception {
		String fileTag = "file";
		String filePath = "C:\\temp\\";
		MultipartFile file = mtf.getFile(fileTag);
		String fileName = file.getOriginalFilename();
		vo.setImage(fileName);
		logger.info("file : " + filePath+fileName );
		try{
			file.transferTo(new File(filePath+fileName)); // 파일 저장
		}catch(Exception e) {
			System.out.println("업로드 오류");
		}
		service.addEnterprisePost(vo);
		logger.info(" /register URL GET method called. then forward post.jsp.");
		return "redirect:/enterprise/list";
	}

	/* 기업 공고 목록 */	
	@RequestMapping(value = {"/list"}, method = RequestMethod.GET)
	public String EnterprisePostListGet(@ModelAttribute("EnterprisePost") EnterprisePostVO vo,Model model) throws Exception {
		List<EnterprisePostVO> EnterprisePost = service.readEnterprisePostList();
		model.addAttribute("EnterprisePost",EnterprisePost);
		model.addAttribute("count",0);
		model.addAttribute("size",EnterprisePost.size());
		logger.info(" /register URL GET method called. then forward list.jsp.");
		return "/enterprise/list";
	}
	
	
	/* 기업 공고 수정 */
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

    /* 기업 공고 삭제 */
	@RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
	public String EnterprisePostDelete(@RequestParam("id") int id) throws Exception {
		service.deleteEnterprisePost(id);
		logger.info(" /register URL GET method called. then forward detail.jsp.");
		return "redirect:/enterprise/list";
	}
	
	/* 기업 공고 확인 - 디테일 페이지 */
	@RequestMapping(value = {"/detail"}, method = RequestMethod.GET)
	public String EnterprisePostDetailById(@RequestParam("id") int id,Model model) throws Exception {
		EnterprisePostVO EnterprisePost = service.readEnterprisePost(id);
		model.addAttribute("EnterprisePost",EnterprisePost);
		String[] detail = EnterprisePost.getDescription().split("\r\n");
		model.addAttribute("detail",detail);
		logger.info(" /register URL GET method called. then forward detail.jsp.");
		return "/enterprise/detail";
	}
	
    /* 이미지 업로드 */
	@RequestMapping("/getImage")
	@ResponseBody
    public ResponseEntity<byte[]> getImage(@RequestParam("name") String filename) throws Exception {
        HttpHeaders header = new HttpHeaders();
        header.setContentType(MediaType.IMAGE_JPEG);
        return new ResponseEntity<byte[]>(IOUtils.toByteArray(new FileInputStream(new File("C:\\temp\\"+filename))), header, HttpStatus.CREATED);
    }
    
    /* 내가 올린 공고 확인 */
	@RequestMapping(value = {"/mypost"}, method = RequestMethod.GET)
	public String MyPostListGet(@ModelAttribute("EnterprisePost") EnterprisePostVO vo,Model model) throws Exception {
		int enterid = 1;
		List<EnterprisePostVO> EnterprisePost = service.readMyEnterprisePost(enterid);
		model.addAttribute("EnterprisePost",EnterprisePost);
		model.addAttribute("count",0);
		model.addAttribute("size",EnterprisePost.size());
		logger.info(" /register URL GET method called. then forward mylist.jsp.");
		return "/enterprise/my_postlist";
	}
	
	/* 공고 제목 검색 */
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
	
	/* 기업 공고별 지원 현황 확인 */
	@RequestMapping(value = {"/apply/list"}, method = RequestMethod.GET)
	public String ApplyListGet(@RequestParam int id, Model model) throws Exception {
		List<ApplyVO> apply = applyservice.readListByPostID(id); 
		List<YoutuberVO> youtuber = new ArrayList<YoutuberVO>();
		YoutuberVO temp;
		
		for(int i=0; i<apply.size(); i++) {
			temp = youtuberservice.readYoutuber(apply.get(i).getYoutuberID());
			youtuber.add(temp);
		}
		model.addAttribute("Apply", apply);
		model.addAttribute("Youtuber", youtuber);
		logger.info(" /register URL GET method called. then forward list.jsp.");
		return "enterprise/apply_status";
	}     
	
	@RequestMapping(value = "/apply/accept", method = RequestMethod.GET)
    public String acceptApply(@RequestParam("id") int id,Model model) throws Exception {
		ApplyVO Apply = applyservice.readApply(id); // applyid로 가져온 VO
		Apply.setResult(1); // 수락
		applyservice.updateApply(Apply);
        return "redirect:/enterprise/apply/list?id=" + Apply.getPostID();
    }
	
	
	@RequestMapping(value = "/apply/reject", method = RequestMethod.GET)
    public String rejectApply(@RequestParam("id") int id,Model model) throws Exception {
		ApplyVO Apply = applyservice.readApply(id); // applyid로 가져온 VO
		Apply.setResult(2); // 거절
		applyservice.updateApply(Apply);
        return "redirect:/enterprise/apply/list?id=" + Apply.getPostID();
    }
}