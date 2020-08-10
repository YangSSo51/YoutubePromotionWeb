<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./navbar.jsp"%>

<!-- Password Encode -->
<script    src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script    src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script type="text/javascript">
	function encrypt(){ 
	       var passphrase="1234";
	       var username = document.getElementById("username").value;
		   var password = document.getElementById("password").value;

		   if(!username){
				alert("아이디를 입력하세요.");
				document.getElementById("username").focus();
				return false;
			}
		   else if(!password){
				alert("비밀번호를 입력하세요.");
				document.getElementById("password").focus();
				return false;
			}
		   else{
		       var encrypt = CryptoJS.AES.encrypt(password.toString(), passphrase);
	    	   var form = document.loginForm;
	    	   form.password.value=encrypt;  // 암호화 한 값으로 등록
	    	   alert(form.password.value);
			   var decrypt = CryptoJS.AES.decrypt(encrypt, passphrase);
			   var text = decrypt.toString(CryptoJS.enc.Utf8);
			   alert(text);
			   
	           return true;
		   }
	}
</script>

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
             
              <input type="submit" value="로그인">
              
               <a href="#"><button class="button" name="loginBtn">LOGIN</button></a>
            </form>
        </section>
	
	
	<div id="dropDownSelect1"></div>
	 <c:if test="${not empty msg}"> 
	  <c:out value="${msg}"/>
	  
      <div style="color:red">
              아이디 또는 비밀번호가 일치하지않습니다.
      </div>
      <% session.removeAttribute("msg"); %>
    </c:if>
    <c:if test="${msg=='logout'}"> 
      <div style="color:red">
         로그아웃되었습니다.
      </div>
   </c:if>
   
</body>
<%@ include file="./footer.jsp"%>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.16.0/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
</html>