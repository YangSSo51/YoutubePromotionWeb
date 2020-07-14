<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value="/resources/main.css"/>">    

<%@ include file="navbar.jsp"%>
       <div id="page">
      <!-- Main -->
         <div id="main" class="container">
            <div class="row">
               <div class="6u">
                  <section>
                     <img src="<c:url value="/resources/images/youtube.jpg"/>" width="600px" alt="">
                     <br>
                  </section>
               </div>
               <div class="6u">
                  <section>
                     <header class = "youtube_desc">
                        <h2>유튜버와 기업이 만나다</h2>
                        <br>
                        <p>국내 다수의 업체들이 마케팅을 하기 위해 많은 비용을 사용하고있습니다. </p>
                        <p>저희 플랫폼에서 무료로 유튜버를 초대할 수 있습니다.</p>
                     </header>
                  </section>
               </div>
            </div>
         </div>
         <!-- Main -->
   <!-- Featured -->
      <div id="featured">
         <div class="container">
            <header class="center">
               <h2 style="margin-bottom:30px">Our Services</h2>
               <hr color="#FF97B6" width="150px" style="border-top:thin solid #FF97B6 !important">
            </header>
            <div class="row">
               <section class="4u">
                  <div class="box">
                     <header>
                        <h2>Makeup</h2>
                     </header>                     
                     <a href="#" class="image left"><img src="<c:url value="/resources/images/makeup.jpg"/>" alt=""></a>
                     <p>In posuere eleifend odio. Quisque semper augue mattis maecenas ligula </p>
                  </div>
               </section>
               <section class="4u">
                  <div class="box">
                     <header>
                        <h2>Hair Styling</h2>
                     </header>
                     <a href="#" class="image left"><img src="<c:url value="/resources/images/hair_styling.jpg"/>" alt=""></a>
                     <p>In posuere eleifend odio. Quisque semper augue mattis maecenas ligula</p>
                  </div>
               </section>
               <section class="4u">
                  <div class="box">
                     <header>
                        <h2>Nails</h2>
                     </header>
                     <a href="#" class="image left"><img src="<c:url value="/resources/images/nail.jpg"/>" alt=""></a>
                     <p>In posuere eleifend odio. Quisque semper augue mattis maecenas ligula</p>
                  </div>
               </section>
            </div>
            <div class="row">
               <section class="4u">
                  <div class="box">
                     <header>
                        <h2>Body Treatment</h2>
                     </header>
                     <a href="#" class="image left"><img src="<c:url value="/resources/images/body_treatment.jpg"/>" alt=""></a>
                     <p>In posuere eleifend odio. Quisque semper augue mattis maecenas ligula</p>
                  </div>
               </section>
               <section class="4u">
                  <div class="box">
                     <header>
                        <h2>Health care</h2>
                     </header>
                     <a href="#" class="image left"><img src="<c:url value="/resources/images/health.jpg"/>" alt=""></a>
                     <p>In posuere eleifend odio. Quisque semper augue mattis maecenas ligula</p>
                  </div>
               </section>
               <section class="4u">
                  <div class="box">
                     <header>
                        <h2>Fashion</h2>
                     </header>
                     <a href="#" class="image left"><img src="<c:url value="/resources/images/fashion.jpg"/>" alt=""></a>
                     <p>In posuere eleifend odio. Quisque semper augue mattis maecenas ligula</p>
                  </div>
               </section>
            </div>
         </div>
      </div>
   <!-- /Featured -->   
         
      </div>
   <!-- /Main -->

 <%@ include file="footer.jsp"%>

  </body>
</html>