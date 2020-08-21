<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./navbar.jsp"%>

<!-- Password Encode -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script type="text/javascript" src="<c:url value="/resources/passwordEncrypt.js"/>"></script>

<body>
	     <section>
            <h2 class="text-center">Login</h2>
            <form class="login-form" name="loginForm" id="loginForm" onsubmit="return encrypt()" action="<c:url value="/login"/>" method="post">
              <div class="form-text">
                	ID
              </div>
              <input class="form-input" type="text" id="username" name="username" placeholder="Type your ID">      
              <div class="form-text">
                Password
              </div>
              <input class="form-input" type="password" id="password" name="password" placeholder="Type your password">
              <c:if test="${not empty msg}"> 
				<div class="login-error">
				아이디 또는 비밀번호가 일치하지않습니다.
				</div>
				<% session.removeAttribute("msg"); %>
			  </c:if>
			  
              <button class="button" name="loginBtn">LOGIN</button>
            </form>
            <a href="https://forms.gle/os59FReKZqf9WEUn8"><h2 class="text-signup">아직 회원이 아니신가요?</h2></a>
            
        </section>
        


</body>
<%@ include file="./footer.jsp"%>
</html>