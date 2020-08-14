<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유튜버 회원 등록</title>

<!-- Password Encode -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script type="text/javascript" src="<c:url value="/resources/passwordEncrypt.js"/>"></script>
</head>

<body>
	     <section>
            <h2 class="text-center">유튜버 등록</h2>
            <form class="login-form" name="loginForm" method="post" action="<c:url value="/register/youtuber" />" onsubmit="return encrypt()">
              <div class="form-text">
                	유튜브 주소
              </div>
              <input class="form-input" type="text" id="username" name="username" placeholder="000-00-00000">      
              <div class="form-text">
                	비밀번호
              </div>
              <input class="form-input" type="password" id="password" name="password" placeholder="Type your password">
              <input class="form-input" type="hidden" name="authorities" value="ROLE_YOUTUBER">
              <div class="form-text">
               		 이름
              </div>
              <input class="form-input" type="text" id="name" name="name" placeholder="">
              <div class="form-text">
               		 카테고리
              </div>
                  	<select name="category" style="margin-bottom:20px;">
                  		<option value="네일">네일</option>
                  		<option value="헤어">헤어</option>
                  		<option value="바디">바디</option>
                  		<option value="헬스">헬스</option>
						<option value="뷰티">뷰티</option>
                  		<option value="메이크업">메이크업</option>                  		
                  	</select>              
              <button class="button" name="loginBtn">등록하기</button></a>
            </form>
        </section>
	<form class="login100-form validate-form"  name=loginForm method="post" action="<c:url value="/register/youtuber" />" onsubmit="return encrypt()">
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
			<input class="input100" type="password" id="password" name="password" placeholder="Type your password">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<input class="input100" type="hidden" name="authorities" value="ROLE_YOUTUBER">
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
			<span class="label-input100">image</span>
			<input class="input100" type="text" name="image" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="text-right p-t-8 p-b-31">
			<div class="container-login100-form-btn">
				<div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn">Sign</button>
					</div>
				</div>
			</div>
		</form>
</body>
</html>