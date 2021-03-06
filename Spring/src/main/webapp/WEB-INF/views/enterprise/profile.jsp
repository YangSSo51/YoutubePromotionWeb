<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<style>
#select{
	background-color:#FF97B6;
	color:#fff;
}
</style>

        <section>
         <div class="my-list">
            <ul>
              <li class="mypage">마이페이지</li>
              <li id="select"><a id="select" href="<c:url value="/enter/profile"/>">프로필</a></li>
              <li><a href="<c:url value="/enterprise/mypost"/>">내 공고 리스트</a></li>
              <li><a href="<c:url value="/enter/list"/>">유튜버 목록</a></li>
            </ul>
          </div>
          <div class="right-container">
            <h3>프로필</h3>
            <hr>
            <h6>내정보</h6>
            <div class="box">

              <div class="content">
                <table class="youtuber_table">
                  <tr>
                    <td class="title">이름</td>
                    <td class="content">${enter.name}</td>
                  </tr>
                  <tr>
                    <td class="title">카테고리</td>
                    <td class="content">${enter.category}</td>
                  </tr>
                  <tr>
                    <td class="title">이메일</td>
                    <td class="content">${enter.email}</td>
                  </tr>
                   <tr>
                    <td class="title">주소</td>
                    <td class="content">${enter.address}</td>
                  </tr>
                  <tr>
                    <td class="title">담당자</td>
                    <td class="content">${enter.manager}</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="button_group">
              <a href="<c:url value="/password?next=delete"/>"><button class="button" type="button" name="button" id="out">회원탈퇴</button></a>
              <a href="<c:url value="/password?next=enter_update"/>"><button class="button" type="button" name="button">정보수정</button></a>
            </div>
            </div>
        </section>
	
<%@ include file="../footer.jsp"%>
</html>