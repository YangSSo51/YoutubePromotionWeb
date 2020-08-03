<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp"%>
<html>
<body>
        <section>
          <div class="home-container">
            <div class="video">
              <iframe src="https://www.youtube.com/embed/DgyD88xLcLE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            <div class="call">
              <h3>체험/제품 요청하기</h3>
              <div class="circle">
                <a href="#">CALL</a>
              </div>
              <div class="message">
                <a href=""><button type="button" name="button">업체 푸시 메세지 발송</button></a>
              </div>
            </div>
          </div>
          <div class="category">
            <ul class="home-list">
              <li>
                <a href="#" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/youtuber.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Nails
                  </div>
                </a>
              </li>
              <li>
                <a href="#" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/youtuber.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Hair
                  </div>
                </a>
              </li>
              <li>
                <a href="#" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/youtuber.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Body
                  </div>
                </a>
              </li>
              <li>
                <a href="#" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/youtuber.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Health
                  </div>
                </a>
              </li>
              <li>
                <a href="#" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/youtuber.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Fashion
                  </div>
                </a>
              </li>
              <li>
                <a href="#" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/youtuber.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Makeup
                  </div>
                </a>
              </li>
              </ul>
          </div>
        </section>


 <%@ include file="footer.jsp"%>

  </body>
</html>