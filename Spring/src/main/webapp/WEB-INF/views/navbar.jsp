<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.GrantedAuthority"%>
<%@ page import="java.util.Collection" %>

<% 
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	String username = authentication.getName();
	Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
%>

<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width==device-width, initial-scale=1.0" http-equiv="content-type" content="text/html; charset=utf-8">

    <title>오아영</title>
	<link rel="stylesheet" href="<c:url value="/resources/reset.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/main.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/mobile.css"/>">

  </head>
  <body>
    <div class="wrap">
      <header>
        <a href="#" class="gnb_menu">gnb menu</a>
        <nav>
          <a href="<c:url value="/"/>">홈</a>
          <a href="<c:url value="/enterprise/list"/>">비즈니스</a>
          <a href="<c:url value="/youtuber/profile"/>">마이페이지</a>
          <a href="<c:url value="/youtuber/question"/>">고객센터</a>
          
           <sec:authorize access="isAnonymous()">
			<a href="<c:url value="/login"/>">로그인</a>
		  </sec:authorize>
		  
		  <sec:authorize access="isAuthenticated()">
		  	<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
			  <form id="logout-form" action="<c:url value="/logout"/>" method="POST">
			  	<sec:csrfInput/>
	    		<input type="hidden" value="로그아웃" />
			  </form>
		  </sec:authorize>
    	  <%= username %>
		  <%= authorities %>
		  
        </nav>
        <div class="logo">
		<img src="<c:url value="/resources/images/logo.png"/>" alt="" width="250px">        
		</div>
      </header>
     </div>
 </body>