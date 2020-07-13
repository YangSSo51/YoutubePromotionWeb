<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% String id = (String)session.getAttribute("id"); %>
<style>

	.site-section {
	    padding-top: 7rem;
	    padding-bottom: 7rem;
	    position: relative;
	    z-index: 2;
	}	
</style>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Free-Template.co" />
    <link rel="shortcut icon" href="<c:url value="ftco-32x32.png"/>">
    
    <link rel="stylesheet" href="<c:url value="/resources/css/custom-bs.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/jquery.fancybox.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-select.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/fonts/icomoon/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/fonts/line-icons/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.min.css"/>">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">    
</head>
  <body id="top">

<!--  
  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>
-->

<div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    

    <!-- NAVBAR -->
    <header class="site-navbar mt-3">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="site-logo col-6"><a href="/myweb">AskRecipe</a></div>

          <nav class="mx-auto site-navigation">
            <ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
              <li><a href="/myweb" class="nav-link active">Home</a></li>
              <li><a href="/myweb/post/list">Recipes</a></li>
              <li><a href="/myweb/post/postRecipe">Post</a></li>
              <li class="d-lg-none"><a href="/myweb/post/postRecipe"><span class="mr-2">+</span> Post a Recipe</a></li>
              <%
              	if(id==null){
              %>
              <li class="d-lg-none"><a href="/myweb/member/login">Login</a></li>
              <%
              	}else{
              %>
              <li class="d-lg-none"><a href="/myweb/member/logout">LogOut</a></li>
              <% 
              	}
              %>
            </ul>
          </nav>
          
          <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
            <div class="ml-auto">
              <a href="/myweb/post/postRecipe" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-add"></span>Post a Recipe</a>
              <%
              	if(id==null){
              %>
              <a href="/myweb/member/login" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>Login</a>
             <%
              	}else{
              %>
              <a href="/myweb/member/logout" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>Logout</a>
              
              <% 
              	}
              %>
            </div>
            <a href="#" class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span class="icon-menu h3 m-0 p-0 mt-2"></span></a>
          </div>

        </div>
      </div>
    </header>
</div>
</body>
    