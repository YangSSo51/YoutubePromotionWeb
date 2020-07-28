<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">    
<% String enterNo = (String)session.getAttribute("enterNo"); %> 
<% int enterID = (Integer)session.getAttribute("enterID"); %> 

<body>
<% 	String msg=null;
	if(enterNo == null){
		msg = "로그인이 필요합니다.";
		%>
		<script> // alert 메세지
		alert("<%=msg%>");
		document.location.href="/myweb/enterprise/login"
		</script>
	<%
	}
	%>
<!-- Main -->
<div id="page">
		
	<!-- Main -->
	<div id="main" class="container">
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
            <form class="p-4 p-md-5 border rounded" name=form1 action="http://localhost:8080/myweb/enterprise/post/" method="post" enctype="multipart/form-data">
              <h3 class="text-black mb-5 border-bottom pb-2">Recipe Details</h3>
              <div class="form-group">
                <label for="company-website-tw d-block">Upload Featured Image</label> <br>
                <label class="btn btn-primary btn-md btn-file">
                  Image File
                  <input type="file" name="file"/>
                  <input type="text" name="filename" hidden/>
                </label>
              </div>

              <div class="form-group">
                <label for="job-title">Title</label>
                <input name="title" type="text" class="form-control" id="recipe-title" placeholder="Title">
              </div>
              <div class="form-group">
                <label for="job-title">date</label>
                <input name="date" type="text" class="form-control" id="recipe-title" placeholder="Date">
              </div>
              <div class="form-group">
                <label for="job-title">category</label>
                <input name="category" type="text" class="form-control" id="recipe-title" placeholder="Category">
              </div>
              <div class="form-group">
                <label for="job-description">recuitCnt</label>
               <input name="recuitCnt" type="text" class="form-control" id="recipe-title" placeholder="recuitCnt">
              </div>
              <div class="form-group">
                <label for="job-description">description</label>
               <input name="description" type="text" class="form-control" id="recipe-title" placeholder="설명을 입력해주세요">
              </div>
               <div class="form-group">
               <input name="enterID" type="hidden" class="form-control" id="recipe-title" value=<%=enterID%> >
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
</div>
</div>

	
</body>
</html>