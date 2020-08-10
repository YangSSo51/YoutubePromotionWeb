<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원 등록</title>

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
			  // alert(text);
			   
	           return true;
		   }
	}
</script>
</head>

<body>
	<form class="login100-form validate-form"  name="loginForm" method="post" onsubmit="return encrypt()" >
		<sec:csrfInput/>
		<span class="login100-form-title p-b-49">
			<h2>Register</h2>
		</span>
		<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
			<span class="label-input100">ID</span>
			<input class="input100" type="text" id="username" name="username" placeholder="000-00-00000">
			<span class="focus-input100" data-symbol="&#xf206;"></span>
		</div>

		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">Password</span>
			<input class="input100" type="password"  id="password" name="password" placeholder="Type your password">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<input class="input100" type="hidden" name="authorities" value="ROLE_ENTERPRISE">
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">name</span>
			<input class="input100" type="text" name="name" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">category</span>
			<input class="input100" type="text" name="category" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">email</span>
			<input class="input100" type="text" name="email" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">address</span>
			<input class="input100" type="text" name="address" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">manager</span>
			<input class="input100" type="text" name="manager" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		<a href="#"><button class="button" name="signUpBtn">SIGN</button></a>
		</form>
</body>
</html>