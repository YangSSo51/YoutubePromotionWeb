package org.kpu.myweb.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kpu.myweb.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler{
	
	@Autowired
	private UserService userservice;
	
	private String msg;
	private String defaultUrl;
	private static final Logger logger = LoggerFactory.getLogger(LoginFailureHandler.class);
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
	
		String errorMsg = null;

		if(exception instanceof BadCredentialsException) { // 비밀번호 불일치
			errorMsg = "error.BadCredentials";
		}
		if(exception instanceof InternalAuthenticationServiceException){ // 존재하지 않는 아이디
			errorMsg = "error.BadCredentials";
		}
		logger.info("error Message : " + errorMsg);

		HttpSession session = request.getSession();
		session.setAttribute("msg", errorMsg);
		response.sendRedirect("/myweb/login");
	}
	// getter & setter
	
	public String getMsg() {
		return msg;
	}
	public String getDefaultUrl() {
		return defaultUrl;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}
}
