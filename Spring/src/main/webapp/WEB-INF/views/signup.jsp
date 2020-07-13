<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp"%>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">    

<body>
     <section class="section-hero overlay inner-page bg-image" style="background-image: url('http://localhost:8080/myweb/post/getImage?name=home.jpg');" id="home-section">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="text-white font-weight-bold">Sign Up</h1>
            <div class="custom-breadcrumbs">
              <a href="#">Login</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>Sign up</strong></span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 mb-5">
          </div>
          <div class="col-lg-6 mb-5">
            <h2 class="mb-4">Sign Up</h2>
            <form class="p-4 border rounded" name=form1 action="http://localhost:8080/myweb/member/signup/" method="post">
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">Id</label>
                  <input type="text" id="fname" name="id" class="form-control" placeholder="ID">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">Password</label>
                  <input type="password" id="fname" name="passwd" class="form-control" placeholder="Password">
                </div>
              </div>
              <div class="row form-group mb-4">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">Username</label>
                  <input type="password" id="fname" name="username"class="form-control" placeholder="Re-type Password">
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" name="submit" value="Sign Up" class="btn px-4 btn-primary text-white">
                </div>
              </div>
            </form>
          </div>
          <div class="col-lg-3 mb-5">
          </div>
        </div>
      </div>
    </section>
	<%@ include file="footer.jsp"%>
	
</body>
</html>