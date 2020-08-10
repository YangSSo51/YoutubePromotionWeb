<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./navbar.jsp"%>

<!-- Password Encode -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script type="text/javascript" src="<c:url value="/resources/passwordEncrypt.js"/>"></script>

<body>
	     <section>
            <h2 class="text-center">Login</h2>
            <form class="login-form" name="loginForm" onsubmit="return encrypt()" action="<c:url value="/login"/>" method="post">
              <div class="form-text">
                	ID
              </div>
              <input class="form-input" type="text" id="username" name="username" placeholder="Type your ID">      
              <div class="form-text">
                Password
              </div>
              <input class="form-input" type="password" id="password" name="password" placeholder="Type your password">
             
              <button class="button" name="loginBtn">LOGIN</button></a>
            </form>
        </section>
        
<c:if test="${not empty msg}"> 
	<div style="color:red">
	아이디 또는 비밀번호가 일치하지않습니다.
	</div>
	<% session.removeAttribute("msg"); %>
</c:if>

</body>
<%@ include file="./footer.jsp"%>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.16.0/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
</html>