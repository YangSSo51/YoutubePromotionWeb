<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<% int ID = (Integer)session.getAttribute("ID"); %> 

      <section>
            <h2 class="text-center">프로필 수정하기</h2>
            <form class="login-form" action="<c:url value="/youtuber/update/"/>" method="post" enctype="multipart/form-data">
              <div class="form-text">
                	이미지를 선택하세요
              </div>
              <label class="filebtn">
		        Browse File<input type="file" name="file" value="${youtuber.image}" hidden>
				<input type="text" name="image" value="${youtuber.image}" hidden>
              </label>
              <input class="form-input" type="text" name="id" value="<%=ID%>" hidden>              
              <div class="form-text">
                Password
              </div>
              <input class="form-input" type="password" name="password">
              <div class="form-text">
                Category
              </div>
              <input class="form-input" type="text" name="category" value="${youtuber.category}">
              <a href="#"><button class="button" type="submit" name="button">수정하기</button></a>
            </form>
        </section>

</div>
</body>
<%@ include file="../footer.jsp"%>
