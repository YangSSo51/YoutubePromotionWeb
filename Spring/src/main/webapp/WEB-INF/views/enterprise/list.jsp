<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">    
<style>
	.button.fit{
		display:block;
		margin: 0 0 1em 0;
		width:100%;
	}

</style>
<body>
     <!-- HOME -->
    <!-- <section class="home-section section-hero overlay bg-image" style="background-image: url('http://localhost:8080/myweb/post/getImage?name=home.jpg');" id="home-section">
	-->
<!-- Main -->
<div id="page">
		
	<!-- Main -->
	<div id="main" class="container">
	<section>
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12">
            <div class="mb-5 text-center">
              <h1 class="text-white font-weight-bold">Search Post!</h1>
         
            </div>
           <form class="search-jobs-form" name=form1 action="http://localhost:8080/myweb/enterprise/search" method="post">
              <div class="row mb-5">
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                  <select name="searchType">
                  	<option value="title">제목</option>
                  	<option value="name">작성자</option>
                  </select>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                  <input name="title" type="text" class="form-control form-control-lg" placeholder="제목을 입력하세요">
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                  <button type="submit" class="btn btn-primary btn-lg btn-block text-white btn-search"><span class="icon-search icon mr-2"></span>검색</button>
                </div>
              </div>
            </form>
            <div class="row">
                <div class="col-md-12 popular-keywords">
                  <h3>Category Keywords:</h3>
                  <ul class="keywords list-unstyled m-0 p-0">
                    <li><a href="search?category=뷰티" class="">뷰티</a></li>
                    <li><a href="search?category=헬스" class="">헬스</a></li>
                    <li><a href="search?category=필라테스" class="">필라테스</a></li>
                  </ul>
                </div>
             </div>
          </div>
        </div>
      </div>

      <a href="#next" class="scroll-button smoothscroll">
        <span class=" icon-keyboard_arrow_down"></span>
      </a>
    </section>

    
    <section class="site-section" id="next">
      <div class="container">

        <div class="row mb-5 justify-content-center">
          <div class="col-md-7 text-center">
            <h2 class="section-title mb-2"><c:out value="${list}"/> Posts</h2>
          </div>
        </div>
 	
        <ul class="job-listings mb-5">
          <c:forEach items="${EnterprisePost}" var="EnterprisePostVO">
          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">

            <div class="job-listing-logo">
              <!--   <img src="http://localhost:8080/myweb/post/getImage?name=${EnterprisePostVO.image}" class="img-fluid"style="width:150px;height:80px;"/>
            	-->
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <a href="http://localhost:8080/myweb/enterprise/detail?id=${EnterprisePostVO.id}">
                <h2><strong><c:out value="${EnterprisePostVO.title}(${EnterprisePostVO.viewCnt})"/></strong></h2>
                </a>
                <c:out value="${EnterprisePostVO.description}"/>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-check-circle"></span> <c:out value="${EnterprisePostVO.applyCnt}/${EnterprisePostVO.recuitCnt}"/>
              </div>
            </div>
            <br>
          </li>

          </c:forEach>
        </ul>

      </div>
    </section>
	</div>
	</div>
	
</body>
</html>