<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% String url = (String)session.getAttribute("url"); %>

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
          <a href="#">비즈니스</a>
          <a href="#">프로필</a>
          <a href="<c:url value="/youtuber/question"/>">고객센터</a>
          <a href="#">로그인</a>
        </nav>
        <div class="logo">
		<img src="<c:url value="/resources/images/logo.png"/>" alt="" width="250px">        
		</div>
      </header>
     </div>
 </body>