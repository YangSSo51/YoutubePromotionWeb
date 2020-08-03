<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
        <section>
            <h3>프로필</h3>
            <hr>
            <h6>내정보</h6>
            <div class="box">
              <div class="image">
                <img src="getImage?name=${youtuber.image}" alt="">
                <h3 class="chanel">혀니_Hyeon</h3>
              </div>
              <div class="content">
                <table class="youtuber_table">
                  <tr>
                    <td class="title">이름</td>
                    <td class="content">${youtuber.name}</td>
                  </tr>
                  <tr>
                    <td class="title">카테고리</td>
                    <td class="content">${youtuber.category}</td>
                  </tr>
                  <tr>
                    <td class="title">채널 개설일</td>
                    <td class="content">2018.05.25</td>
                  </tr>
                  <tr>
                    <td class="title">채널링크</td>
                    <td class="content">${youtuber.url}</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="button_group">
              <a href="<c:url value="/youtuber/delete?id=${id}"/>"><button class="button" type="button" name="button" id="out">회원탈퇴</button></a>
              <a href="<c:url value="/youtuber/update?id=${id}"/>"><button class="button" type="button" name="button">정보수정</button></a>
            </div>
        </section>
	
<%@ include file="../footer.jsp"%>
</html>