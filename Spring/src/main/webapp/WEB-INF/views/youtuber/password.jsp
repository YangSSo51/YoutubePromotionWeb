<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./navbar.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		$("loginBtn").click(function(){
		var enterNo = $("#enterNo").val();"
		var passwd = $("#passwd").val();
		if(enterNo==""){
			alert("아이디를 입력하세요.");
			$("#enterNo").focus();
			return;
			}
		if(passwd==""){
			alter("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
			}
		document.form1.action="http://localhost:8080/myweb/login"
		document.form1.submit();
		});
	});
</script>

<body>
	     <section>
            <h2 class="text-center">Login</h2>
            <form class="login-form" name=form1 action="<c:url value="/login"/>" method="post">
              <div class="form-text">
                	ID
              </div>
              <input class="form-input" type="text" name="username" placeholder="Type your ID">
              <div class="form-text">
                Password
              </div>
              <input class="form-input" type="password" name="password" placeholder="Type your password">
              <a href="#"><button class="button" type="submit" name="button">LOGIN</button></a>
            </form>
        </section>
	

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
   
</body>
<%@ include file="./footer.jsp"%>

</html>