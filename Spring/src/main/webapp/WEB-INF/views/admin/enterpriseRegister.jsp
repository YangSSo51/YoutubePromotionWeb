<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원 등록</title>

<!-- Password Encode -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script type="text/javascript" src="<c:url value="/resources/passwordEncrypt.js"/>"></script>
</head>

<body>
	     <section>
            <h2 class="text-center">기업 등록</h2>
            <form class="login-form" name="loginForm" id="loginForm" method="post" action="<c:url value="/register/enterprise"/>"onsubmit="return encrypt()">
              <div class="form-text">
                	사업자번호
              </div>
              <input class="form-input" type="text" id="username" name="username" placeholder="000-00-00000">      
              <div class="form-text">
                	비밀번호
              </div>
              <input class="form-input" type="password" id="password" name="password" placeholder="Type your password">
              <input class="form-input" type="hidden" name="authorities" value="ROLE_ENTERPRISE">
              <div class="form-text">
               		 이름
              </div>
              <input class="form-input" type="text" id="name" name="name" placeholder="">
              <div class="form-text">
               		 이메일
              </div>
              <input class="form-input" type="email" id="email" name="email" placeholder="">                  	
              <div class="form-text">
               		 주소
              </div>
              <input class="form-input" type="text" id="address" name="address" placeholder="">
              <div class="form-text">
               		 담당자
              </div>
              <input class="form-input" type="text" id="manager" name="manager" placeholder="">
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

</body>
</html>