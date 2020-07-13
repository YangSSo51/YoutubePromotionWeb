<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp"%>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">    

<body>
<% 	String msg=null;
	if(id == null){
		msg = "로그인이 필요합니다.";
		%>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/myweb/member/login";
		</script>
	<%
	}
	%>
    <!-- HOME -->
    <section class="section-hero overlay inner-page bg-image" style="background-image: url('http://localhost:8080/myweb/post/getImage?name=home.jpg');" id="home-section">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="text-white font-weight-bold">Post A Recipe</h1>
            <div class="custom-breadcrumbs">
              <a href="#">Home</a> <span class="mx-2 slash">/</span>
              <a href="#">Recipe</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>Post a Job</strong></span>
            </div>
          </div>
        </div>
      </div>
    </section>

    
    <section class="site-section">
      <div class="container">

        <div class="row align-items-center mb-5">
          <div class="col-lg-8 mb-4 mb-lg-0">
            <div class="d-flex align-items-center">
              <div>
                <h2>Post A Recipe</h2>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
          </div>
        </div>
        <div class="row mb-5">
          <div class="col-lg-12">
            <form class="p-4 p-md-5 border rounded" name=form1 action="http://localhost:8080/myweb/post/postRecipe/" method="post" enctype="multipart/form-data">
              <h3 class="text-black mb-5 border-bottom pb-2">Recipe Details</h3>
              <div class="form-group">
                <label for="company-website-tw d-block">Upload Featured Image</label> <br>
                <label class="btn btn-primary btn-md btn-file">
                  Browse File<input type="file" hidden>
                </label>
 
              </div>

              <div class="form-group">
                <label for="job-title">Recipe Title</label>
                <input name="title" type="text" class="form-control" id="recipe-title" placeholder="Title">
              </div>
              <div class="form-group">
                <label for="job-title">ID</label>
                <input name="id" type="text" class="form-control" id="recipe-title" value=<%=id %>>
              </div>
              <div class="form-group">
                <label for="job-title">Url</label>
                <input name="url" type="text" class="form-control" id="recipe-title" placeholder="url">
              </div>
              <div class="form-group">
                <label for="job-description">Ingredients</label>
               <input name="ingredients" type="text" class="form-control" id="recipe-title" placeholder="ingredients">
              </div>
              <div class="form-group">
                <label for="job-description">Counts</label>
               <input name="count" type="text" class="form-control" id="recipe-title" placeholder="count">
              </div>
              <div class="form-group">
                <label for="job-description">Recipe Description</label>
               <input name="recipe" type="text" class="form-control" id="recipe-title" placeholder="recipe">
              </div>
               <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" name="submit" value="save" class="btn px-4 btn-primary text-white">
                </div>
              </div>
            </form>
          </div>

         
        </div>
      </div>
    </section>


	<%@ include file="footer.jsp"%>
	
</body>
</html>