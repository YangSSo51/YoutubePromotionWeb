package org.kpu.myweb.handler;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kpu.myweb.controller.EnterprisePostController;
import org.kpu.myweb.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	private UserService userservice;
	
	private String username;
	private String defaultUrl;
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException{
		// TODO Auto-generated method stub
		
			resultRedirectStratege(request, response, authentication);
	}

	protected void resultRedirectStratege(HttpServletRequest request, HttpServletResponse response,
										Authentication authentication) throws IOException {
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		HttpSession session = request.getSession();
		int ID;
		
		logger.info("authentication : " + authentication.getName() + authentication.getAuthorities());
		
		// 세션 설정
		try {
			ID = userservice.readID(authentication.getName());

			session.setAttribute("ID", ID);
			session.setAttribute("username", authentication.getName());
		} catch (Exception e) {
			e.printStackTrace();
		}

		if(savedRequest != null) {// 권한이 필요한 페이지에 접근
			String url = savedRequest.getRedirectUrl();
			redirectStratgy.sendRedirect(request, response, url);
		}
		else {// 직접 로그인 url로 이동했을 때
			redirectStratgy.sendRedirect(request, response, defaultUrl);
		}
	}
	
	// getter & setter
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDefaultUrl() {
		return username;
	}
	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}
}
