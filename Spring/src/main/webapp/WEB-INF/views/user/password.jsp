<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<% int ID = (Integer)session.getAttribute("ID"); %> 

<!-- Password Encode -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>


<body>
	     <section>
            <h2 class="text-center">비밀번호 확인</h2>
            <form class="login-form" name="loginForm" action="<c:url value="/password?next=${next}"/>" method="post" onsubmit="return encrypt()">
              <input class="form-input" type="hidden" name="id" value="<%=ID%>">
              <input class="form-input" type="hidden" id="username" name="username" value="<%=ID%>">
             
              <div class="form-text">
                Password
              </div>
              <input class="form-input" type="password" id="password" name="password" placeholder="Type your password">
              <a href="#"><button class="button" type="submit" name="button">확인</button></a>
            </form>
        </section>
	

	<div id="dropDownSelect1"></div>
	 <c:if test="${msg=='failure'}"> 
      <div style="color:red">
              비밀번호가 일치하지않습니다.
      </div>
    </c:if>
</body>
<%@ include file="../footer.jsp"%>
<script type="text/javascript" src="<c:url value="/resources/passwordEncrypt.js"/>"></script>

</html>