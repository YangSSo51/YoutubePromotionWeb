<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<% int ID = (Integer)session.getAttribute("ID"); %> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script type="text/javascript" src="<c:url value="/resources/passwordEncrypt.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/checkPassword.js"/>"></script>

      <section>
            <h2 class="text-center">프로필 수정하기</h2>
            <form class="login-form" name="loginForm"action="<c:url value="/youtuber/update/"/>" method="post" enctype="multipart/form-data" onsubmit="return checkPassword()">
              <div class="form-text">
                	이미지를 선택하세요
              </div>
               <label class="filebtn" style="display:inline-block; ">
                    <div style="text-align:center; padding-top:10px;">
                      Browse File
                    </div>
            	<input type="file" name="file" value="${youtuber.image}" hidden>
				<input type="text" name="image" value="${youtuber.image}" hidden>
              </label>
              <input class="form-input" type="text" name="id" value="<%=ID%>" hidden>              
              <div class="form-text">
                Password
              </div>
              <input class="form-input" type="password" name="password" id="password" >
              <div class="form-text">
                Password Check
              </div>
              <input class="form-input" type="password" name="passwordCheck" id="passwordCheck">
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
