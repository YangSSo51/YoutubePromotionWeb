<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value="/resources/main.css"/>">    

<%@ include file="navbar.jsp"%>
     <!-- HOME -->
    <section class="home-section section-hero overlay bg-image" style="background-image: url('http://localhost:8080/myweb/post/getImage?name=home.jpg');" id="home-section">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12">
            <div class="mb-5 text-center">
              <h1 class="text-white font-weight-bold">Search recipe!</h1>
              <p>Masitneun bab muggo sheepda...</p>
            </div>
           <form class="search-jobs-form" name=form1 action="http://localhost:8080/myweb/post/search" method="post">
              <div class="row mb-5">
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                  <input name="search1" type="text" class="form-control form-control-lg" placeholder="콩나물..">
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                  <input name="search2" type="text" class="form-control form-control-lg" placeholder="계란..">
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                  <input name="search3" type="text" class="form-control form-control-lg" placeholder="양파..">
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                  <button type="submit" class="btn btn-primary btn-lg btn-block text-white btn-search"><span class="icon-search icon mr-2"></span>Search Recipe</button>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 popular-keywords">
                  <h3>Trending Keywords:</h3>
                  <ul class="keywords list-unstyled m-0 p-0">
                    <li><a href="#" class="">연어</a></li>
                    <li><a href="#" class="">계란</a></li>
                    <li><a href="#" class="">콩나물</a></li>
                  </ul>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>

      <a href="#next" class="scroll-button smoothscroll">
        <span class=" icon-keyboard_arrow_down"></span>
      </a>

    </section>

    			<!-- Main -->
				<div id="main">
					<div class="inner">

					<!-- Boxes -->
						<div class="thumbnails">

							<div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="http://localhost:8080/myweb/post/getImage?name=pic01.jpg" alt="" /></a>
								<div class="inner">
									<h3>치즈 계란말이</h3>
									<p>계란 4개,스트링치즈 3개,체다치즈 1개,대파 1/4개,소금 약간</p>
									<a href="https://youtu.be/jKqmEZe3lcE" class="button fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>

							<div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit">
								<img src="http://localhost:8080/myweb/post/getImage?name=pic02.jpg" alt=""></img></a>
								<div class="inner">
									<h3>버터계란밥</h3>
									<p>즉석밥 1개,계란 2알,진간장 1T,소금 약간,무염버터 10g</p>
									<a href="https://youtu.be/Bw6Tt-ZbosI" class="button style2 fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>

							<div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="http://localhost:8080/myweb/post/getImage?name=pic03.jpg" alt="" /></a>
								<div class="inner">
									<h3>연어덮밥</h3>
									<p>연어 300g,대파 1/2개,양파 1개,청양고추 2개,생강 1개,물240ml,진간장240ml,맛술120ml...</p>
									<a href="https://youtu.be/LipwfAy4FT4" class="button style3 fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>

							<div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="http://localhost:8080/myweb/post/getImage?name=pic07.jpg" alt="" /></a>
								<div class="inner">
									<h3>간장비빔 국수</h3>
									<p>소면 50g,간장 5큰술,참기름 2큰술,고춧가루 0.5큰술,깨 1큰술,설탕 2.5큰술</p>
									<a href="https://youtu.be/KArzc7ySjp8" class="button style2 fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>

							<div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="http://localhost:8080/myweb/post/getImage?name=pic05.jpg" alt="" /></a>
								<div class="inner">
									<h3>김치볶음밥</h3>
									<p>공기밥 한공기,김치 반컵,참치 반캔,양파 1/4개,고춧가루 반큰술,소금 한꼬집,후추 한꼬집,깨 조금</p>
									<a href="https://youtu.be/UkpZvNV-dlw" class="button style3 fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>

							<div class="box">
								<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="http://localhost:8080/myweb/post/getImage?name=pic06.jpg" alt="" /></a>
								<div class="inner">
									<h3>규동</h3>
									<p>차돌박이 100g,양파 반개,계란 두개,소금 조금,후추 조금,설탕 1.5큰술,미림 2큰술,간장 3큰술,밥 1인분</p>
									<a href="https://youtu.be/18XuG56P0uk" class="button fit" data-poptrox="youtube,800x400">Watch</a>
								</div>
							</div>

						</div>

					</div>
				</div>
 <%@ include file="footer.jsp"%>
 

    <!-- SCRIPTS -->
    <script src="<c:url value="/resources/js/jquery.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/resources/js/isotope.pkgd.min.js" />"></script>
    <script src="<c:url value="/resources/js/stickyfill.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.fancybox.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.easing.1.3.js" />"></script>
    
    <script src="<c:url value="/resources/js/jquery.waypoints.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.animateNumber.min.js" />"></script>
    <script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
    
    <script src="<c:url value="/resources/js/bootstrap-select.min.js" />"></script>
    <script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
    
    <script src="<c:url value="/resources/js/bootstrap-select.min.js" />"></script>
    <script src="<c:url value="/resources/js/custom.js" />"></script>

  
  </body>
</html>