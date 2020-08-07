package org.kpu.myweb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.ApplyVO;
import org.kpu.myweb.domain.EnterpriseVO;
import org.kpu.myweb.service.EnterpriseService;

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
@RequestMapping(value="/enterprise")
public class EnterpriseController {
	
	@Autowired
	private EnterpriseService enterpriseService;

}