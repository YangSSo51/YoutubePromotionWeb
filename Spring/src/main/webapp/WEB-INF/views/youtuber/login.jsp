<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<c:url value="images/icons/favicon.ico"/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/animate/animate.css"/>">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/css-hamburgers/hamburgers.min.css"/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/animsition/css/animsition.min.css"/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/select2/select2.min.css"/>">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/daterangepicker/daterangepicker.css"/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/util.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css"/>">
<!--===============================================================================================-->
<script type="text/javascript">
	$(document).ready(function(){
		$("loginBtn").click(function(){
		var url = $("#url").val();"
		var passwd = $("#passwd").val();
		if(url==""){
			alert("아이디를 입력하세요.");
			$("#url").focus();
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
<div id="page">
    <%
       if(url==null){
    %>

	<div class="limiter">
		<div class="container-login100"> <!--style="background-image: url('images/bg-01.jpg');"-->
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form"  name=form1 action="http://localhost:8080/myweb/member/login/" method="post" >
					<span class="login100-form-title p-b-49">
						<h2>Login</h2>
					</span>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">Youtube Url</span>
						<input class="input100" type="text" name="url" placeholder="https://www.youtube.com/channel/...">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="passwd" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="text-right p-t-8 p-b-31">
						<a href="#">
							Forgot password?
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	 <c:if test="${msg=='failure'}"> 
      <div style="color:red">
              아이디 또는 비밀번호가 일치하지않습니다.
      </div>
    </c:if>
    <c:if test="${msg=='logout'}"> 
      <div style="color:red">
         로그아웃되었습니다.
      </div>
   </c:if>
   <%}else{ %>
      <section class="site-section">
      <div class="container">
      
      </div>
      </section>
    <% } %>
</div>
</body>
<%@ include file="../footer.jsp"%>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.16.0/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
</html>