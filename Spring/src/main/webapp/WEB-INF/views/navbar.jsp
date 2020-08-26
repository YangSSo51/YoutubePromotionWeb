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
   String name = (String)session.getAttribute("name");
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
        <a href="#" class="gnb_menu" onclick="navFunction()">gnb menu</a>
        <nav id="nav">
          <a href="<c:url value="/"/>">홈</a>
          <a href="<c:url value="/enterprise/list"/>">비즈니스</a>
          
          <sec:authorize access="hasRole('ROLE_YOUTUBER')">
             <a href="<c:url value="/youtuber/myprofile"/>">마이페이지</a>
          </sec:authorize>
          <sec:authorize access="hasRole('ROLE_ENTERPRISE')">
             <a href="<c:url value="/enter/profile"/>">마이페이지</a>
          </sec:authorize>
          
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
         
        </nav>
        <div class="logo">
<<<<<<< HEAD
		<img src="<c:url value="/resources/images/logo.png"/>" alt="" width="250px" style="border-radius:0">        
		</div>
=======
      <img src="<c:url value="/resources/images/logo.png"/>" alt="" width="250px">        
      </div>
>>>>>>> c39219281a16efc2fc3ab081ea2c8c1ca32290e7
      </header>
     </div>
     <script>
     function navFunction() {
    	  var x = document.getElementById("nav");
    	  if (x.style.display === "none") {
    	    x.style.display = "block";
    	  } else {
    	    x.style.display = "none";
    	  }    	}
     </script>
 </body>