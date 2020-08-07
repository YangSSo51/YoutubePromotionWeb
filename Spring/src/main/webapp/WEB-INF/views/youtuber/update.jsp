<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
      <section>
            <h2 class="text-center">프로필 수정하기</h2>
            <form class="login-form" action="http://localhost:8080/myweb/youtuber/update/" method="post" enctype="multipart/form-data">
              <div class="form-text">
                	이미지를 선택하세요
              </div>
              <label class="filebtn">
		        Browse File<input type="file" name="file" value="${youtuber.image}" hidden>
				<input type="text" name="image" value="${youtuber.image}" hidden>
              </label>
              <input class="form-input" type="text" name="id" value="${youtuber.id}" hidden>              
              <div class="form-text">
                Youtube URL
              </div>
              <input class="form-input" type="text"  name="username" value="${channel}" autofocus>
              <div class="form-text">
                Password
              </div>
              <input class="form-input" type="password" name="password" value=>
              <div class="form-text">
                Name
              </div>
              <input class="form-input" type="text" name="name" value="${youtuber.name}">
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
