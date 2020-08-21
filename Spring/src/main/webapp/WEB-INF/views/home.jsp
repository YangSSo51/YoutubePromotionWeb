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
                <a href="<c:url value="/enterprise/list"/>"><button type="button" name="button">업체 푸시 메세지 발송</button></a>
              </div>
            </div>
          </div>
          <div class="category">
            <ul class="home-list">
              <li>
                <a href="<c:url value="/enterprise/search?category=네일"/>" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/nail.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Nails
                  </div>
                </a>
              </li>
              <li>
                <a href="<c:url value="/enterprise/search?category=헤어"/>" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/hair_styling.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Hair
                  </div>
                </a>
              </li>
              <li>
                <a href="<c:url value="/enterprise/search?category=바디"/>" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/body_treatment.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Body
                  </div>
                </a>
              </li>
              <li>
                <a href="<c:url value="/enterprise/search?category=헬스"/>" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/health.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Health
                  </div>
                </a>
              </li>
              <li>
                <a href="<c:url value="/enterprise/search?category=뷰티"/>" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/youtuber.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                    Beauty
                  </div>
                </a>
              </li>
              <li>
                <a href="<c:url value="/enterprise/search?category=메이크업"/>" class="inner">
                  <div class="thumb">
                    <img src="<c:url value="/resources/images/makeup.jpg"/>" alt="" width="250px">   
                  </div>
                  <div class="desc">
                      Makeup
                  </div>
                </a>
              </li>
              </ul>
          </div>
          <div class="description">
          	<img src="<c:url value="/resources/images/description.png"/>" alt="" width="100%">
          </div>
          <div class="button-center">
          	<a href="https://forms.gle/os59FReKZqf9WEUn8"><button type="button" name="button">등록하기</button></a>
            <a href="<c:url value="/login"/>"><button type="button" name="button">로그인하기</button></a>
          </div>
        </section>


 <%@ include file="footer.jsp"%>

  </body>
  <script>
	window.open("popup","popup","width=596, height=600, left=100, top=50");
  </script>
</html>