package org.kpu.myweb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.kpu.myweb.domain.RecipeVO;
import org.kpu.myweb.domain.SearchVO;
import org.kpu.myweb.service.RecipeService;
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
@RequestMapping(value="/post")
public class PostController {
	
	@Autowired
    private RecipeService recipeService;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
	@RequestMapping(value = {"/postRecipe"}, method = RequestMethod.GET)
	public String postRecipeGet() throws Exception {
		logger.info(" /register URL GET method called. then forward post.jsp.");
		return "post";
	}
	
	@RequestMapping(value = {"/postRecipe"}, method = RequestMethod.POST)
	public String signupMemberPost(MultipartHttpServletRequest mtf,@ModelAttribute("recipe") RecipeVO vo) throws Exception {
		String fileTag = "file";
		String filePath = "C:\\temp\\";
		MultipartFile file = mtf.getFile(fileTag);
		String fileName = file.getOriginalFilename();
		vo.setFilename(fileName);
		try{
			file.transferTo(new File(filePath+fileName));
		}catch(Exception e) {
			System.out.println("업로드 오류");
		}
		recipeService.addRecipe(vo);
		logger.info(vo.toString());
		logger.info(" /register URL GET method called. then forward post.jsp.");
		return "redirect:/post/list";
	}

	
	
	@RequestMapping(value = {"/list"}, method = RequestMethod.GET)
	public String recipeListGet(@ModelAttribute("recipe") RecipeVO vo,Model model) throws Exception {
		List<RecipeVO> recipe=recipeService.readRecipeList();
		model.addAttribute("recipe",recipe);
		model.addAttribute("count",0);
		model.addAttribute("list",recipe.size());
		logger.info(" /register URL GET method called. then forward list.jsp.");
		return "list";
	}
	
	@RequestMapping(value = {"/search"}, method = RequestMethod.POST)
	public String recipeSearchPost(@ModelAttribute("search") SearchVO vo,Model model) throws Exception {		
		List<RecipeVO> recipe = recipeService.searchRecipe(vo);
		model.addAttribute("recipe",recipe);
		int count=0;
		if(vo.getSearch1()!="") count++;
		if(vo.getSearch2()!="") count++;
		if(vo.getSearch3()!="") count++;
		
		model.addAttribute("count",count);
		model.addAttribute("list",recipe.size());

		return "list";
	}
	
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateRecipeGet(@RequestParam("title") String title, Model model) throws Exception {
    	RecipeVO recipe = recipeService.readRecipe(title);
        model.addAttribute("recipe",recipe);
        return "update";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateRecipePost(MultipartHttpServletRequest mtf,@ModelAttribute("title") RecipeVO vo) throws Exception {
		String fileTag = "file";
		String filePath = "C:\\temp\\";
		MultipartFile file = mtf.getFile(fileTag);
		String fileName = file.getOriginalFilename();
		if(fileName!="") {
			vo.setFilename(fileName);
			try{
				file.transferTo(new File(filePath+fileName));
			}catch(Exception e) {
				System.out.println("업로드 오류");
			}
		}
    	recipeService.updateRecipe(vo);
		logger.info(vo.toString());
        return "redirect:/post/list";
    }
    
	@RequestMapping("/getImage")
	@ResponseBody
    public ResponseEntity<byte[]> getImage(@RequestParam("name") String filename) throws Exception {
        HttpHeaders header = new HttpHeaders();
        header.setContentType(MediaType.IMAGE_JPEG);
        return new ResponseEntity<byte[]>(IOUtils.toByteArray(new FileInputStream(new File("C:\\temp\\"+filename))), header, HttpStatus.CREATED);
    }
	
	@RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
	public String recipeDelete(@RequestParam("title") String title) throws Exception {
		recipeService.deleteRecipe(title);
		logger.info(" /register URL GET method called. then forward detail.jsp.");
		return "redirect:/post/list";
	}
	
	@RequestMapping(value = {"/detail"}, method = RequestMethod.GET)
	public String recipeDetailByTitle(@RequestParam("title") String title,Model model) throws Exception {
		RecipeVO recipe = recipeService.readRecipe(title);
		model.addAttribute("recipe",recipe);
		String[] detail = recipe.getRecipe().split("\r\n");
		model.addAttribute("detail",detail);
		logger.info(" /register URL GET method called. then forward detail.jsp.");
		return "detail";
	}
	    
	@RequestMapping(value = "/read", method = RequestMethod.GET)
    public String readMember(@RequestParam("id") String id, Model model) throws Exception {
    	RecipeVO recipe = recipeService.readRecipe(id);
		logger.info(" /read?id=kang URL called. then readMemebr method executed.");
        model.addAttribute("recipe", recipe);
        return "detail";
    }
	
}