<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<% int ID = (Integer)session.getAttribute("ID"); %> 

<script type="text/javascript" src="<c:url value="/resources/passwordEncrypt.js"/>"></script>
<script type="text/javascript">
	function checkPassword(){
		var form = document.login-form;
		var password1 = document.getElementById("password").value;
		var password2 = document.getElementById("passwordCheck").value;
		
		if(!password1 && !password2){
			// 비밀번호를 변경하지 않음
			alert("비밀번호를 변경하지 않음.");
			return true;
		}
		else if(password1 || password2){
			// 비밀번호를 변경함
			if(password1 == password2)
				var encrypt = encrypt_data(password, passphrase, iv);
	    		form.password.value=encrypt;  // 암호화 한 값으로 등록	   
	    		alert(encrypt); 		
				return true;
			else{
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
	}
</script>

      <section>
            <h2 class="text-center">프로필 수정하기</h2>
            <form class="login-form" action="<c:url value="/enterprise/update/"/>" method="post" onsubmit="return checkPassword()">
              <input class="form-input" type="text" name="id" value="<%=ID%>" hidden>           
              <input class="form-input" type="text" name="id" value="${enter.name}" hidden>              
              <div class="form-text">
                Password
              </div>
              <input class="form-input" type="password" name="password" id="password" >
              <div class="form-text">
                Password Check
              </div>
              <input class="form-input" type="password" name="password" id="password" >
              <div class="form-text">
                	이메일
              </div>
              <input class="form-input" type="email" name="email" id="email" >
              <div class="form-text">
                	주소
              </div>
              <input class="form-input" type="text" name="address" id="address" >
              <div class="form-text">
                	담당자
              </div>
              <input class="form-input" type="text" name="manager" id="manager" >
              <div class="form-text">
                Category
              </div>
                    <select name="category">
                  		<option value="네일">네일</option>
                  		<option value="헤어">헤어</option>
                  		<option value="바디">바디</option>
                  		<option value="헬스">헬스</option>
						<option value="뷰티">뷰티</option>
                  		<option value="메이크업">메이크업</option>                  		
                  	</select>
              <a href="#"><button class="button" type="submit" name="button">수정하기</button></a>
            </form>
        </section>

</div>
</body>
<%@ include file="../footer.jsp"%>
