<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
ㄴ
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% String url = (String)session.getAttribute("url"); %>

<head>
   <meta charset="UTF-8">
         <title>오아영</title>
      <meta http-equiv="content-type" content="text/html; charset=utf-8" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->

	  <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
      <link rel="stylesheet" href="<c:url value="/resources/css/custom-bs.css"/>">
      <link rel="stylesheet" href="<c:url value="/resources/css/skel-noscript.css"/>" />
      <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
      <link rel="stylesheet" href="<c:url value="/resources/css/style-desktop.css"/>" />
      
      <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
      <!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
      
      <style>
         #nav2 > ul > li > a.button{
            margin-left: 0.7em;
            padding: 0.80em 1.2em;
            display: block;
            font-size : 30px;
            background : #ABD5FB;
            margin-top : 0;
            color : #fff;   
         }
         #nav2 > ul > li
         {
            float: left;
         }
         .center{
            text-align : center;
         }
         div.box header h2 {
                font-size: 1.6em;
            text-align : center;
         }   
         header.youtube_desc h2{
            font-size: 1.6em;
            padding-top:4.0em;
         }
         
      </style>
   </head>
   <body class="homepage">

   <!-- Header -->
      <div id="header">
         <div class="container">
               
            <!-- Logo -->
               <div id="logo">
                  <h1><a href="#"><img src="<c:url value="/resources/images/logo.png"/>" alt="" width="250px"></a></h1>
               </div>
         </div>
         <div class="container">
            <!-- Nav -->
               <nav id="nav">
                  <ul>
                     <li class="active"><a href="index.html">Homepage</a></li>
                     <li><a href="left-sidebar.html">News</a></li>
                     <li><a href="right-sidebar.html">Services</a></li>
                     <li><a href="no-sidebar.html">Apply</a></li>
                  </ul>
                  
               </nav>
         </div>
               <nav id="nav2" style='margin-right:3em'>
                  <ul>   
                     <li><a href="#" class="button" style='background-color : #FF97B6 !important'>유튜버</a></li>
                     <li><a href="#" class="button">기업</a></li>
                  </ul>
                  
               </nav>
      </div>
   </body>
   
    