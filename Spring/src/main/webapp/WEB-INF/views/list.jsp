<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp"%>
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


    
    <section class="site-section" id="next">
      <div class="container">

        <div class="row mb-5 justify-content-center">
          <div class="col-md-7 text-center">
            <h2 class="section-title mb-2"><c:out value="${list}"/> Recipes</h2>
          </div>
        </div>
 	
        <ul class="job-listings mb-5">
          <c:forEach items="${recipe}" var="recipeVO">
          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
            <a href="http://localhost:8080/myweb/post/detail?title=${recipeVO.title}"></a>
            <div class="job-listing-logo">
              <img src="http://localhost:8080/myweb/post/getImage?name=${recipeVO.filename}" class="img-fluid"style="width:150px;height:80px;"/>
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2><c:out value="${recipeVO.title}(${recipeVO.view_cnt})"/></h2>
                <strong><c:out value="${recipeVO.id}"/></strong>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-check-circle"></span> <c:out value="${count}/${recipeVO.count}"/>
              </div>
              <div class="job-listing-meta">
              	<a href="https://youtu.be/UkpZvNV-dlw" class="button style3 fit" data-poptrox="youtube,800x400"></a>
                <span class="badge badge-success" onclick="location.href='${recipeVO.url}'">Watch</span>
              </div>
            </div>
          </li>
          </c:forEach>
        </ul>

      </div>
    </section>



	<%@ include file="footer.jsp"%>
	
</body>
</html>