<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		$("loginBtn").click(function()){
		var id = $("#id").val();"
		var passwd = $("#passwd").val();
		if(id==""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return;
			}
		if(passwd==""){
			alter("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
			}
		document.form1.action="http://localhost:8080/myweb/member/login/"
		document.form1.submit();
		});
	});
</script>

<body>
     <section class="section-hero overlay inner-page bg-image" style="background-image: url('http://localhost:8080/myweb/post/getImage?name=home.jpg');" id="home-section">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="text-white font-weight-bold">Login</h1>
            <div class="custom-breadcrumbs">
              <a href="/myweb/member/signup">Signup</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>Login</strong></span>
            </div>
          </div>
        </div>
      </div>
    </section>
    <%
    	if(id==null){
    %>

    <section class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 mb-5">
          </div>
          <div class="col-lg-6 mb-5">
            <h2 class="mb-4">Login</h2>
            <form class="p-4 border rounded" name=form1 action="http://localhost:8080/myweb/member/login/" method="post">
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">Id</label>
                  <input type="text" name="id" id="fname" class="form-control" placeholder="Email address">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">Password</label>
                  <input type="password" name="passwd" id="fname" class="form-control" placeholder="Password">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12">
                  <input id="loginBtn" type="submit" value="Login" class="btn px-4 btn-primary text-white">
                </div>
              </div>
            </form>
          </div>
          <div class="col-lg-3 mb-5">
          </div>
        </div>
      </div>
         <c:if test="${mgs=='failure'}"> 
   	<div style="color:red">
   		아이디 또는 비밀번호가 일치하지않습니다.
   	</div>
   </c:if>
   <c:if test="${mgs=='logout'}"> 
   	<div style="color:red">
   		로그아웃되었습니다.
   	</div>
   </c:if>
   </section>
   <%}else{ %>
      <section class="site-section">
      <div class="container">
      
      </div>
      </section>
    <% } %>

     	<%@ include file="footer.jsp"%>
	
</body>
</html>