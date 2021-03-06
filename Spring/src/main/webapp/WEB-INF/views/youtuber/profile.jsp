<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<style>
#select{
	background-color:#FF97B6;
	color:#fff;
}
</style>
        <section>
         <sec:authorize access="hasRole('ROLE_YOUTUBER')">
         <div class="my-list">
            <ul>
              <li class="mypage">마이페이지</li>
              <li id="select"><a id="select" href="<c:url value="/youtuber/myprofile"/>">프로필</a></li>
              <li><a href="<c:url value="/apply/youtuber/list"/>">지원현황</a></li>
              <li><a href="<c:url value="/invite/youtuber/list"/>">초대현황</a></li>
            </ul>
          </div>
         </sec:authorize>
         
          <div class="right-container">
            <h3>프로필</h3>
            <hr>
            <h6>내정보</h6>
            <div class="box">
              <div class="image">
                <img src="${youtuber.image}" alt=""> <!-- "getImage?name=${youtuber.image}" -->
                <h3 class="chanel">${channelTitle}</h3>
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
                    <td class="content">${publishedDate}</td>
                  </tr>
                   <tr>
                    <td class="title">구독자 수</td>
                    <td class="content">${subscriber}</td>
                  </tr>
                  <tr>
                    <td class="title">채널링크</td>
                    <td class="content"><a href=${channelUrl}>${youtuber.name}의 채널</a></td>
                  </tr>
                </table>
              </div>
            </div>
            
            <sec:authorize access="hasRole('ROLE_YOUTUBER')">
	            <div class="button_group">
	              <a href="<c:url value="/password?next=delete"/>"><button class="button" type="button" name="button" id="out">회원탈퇴</button></a>
	              <a href="<c:url value="/password?next=update"/>"><button class="button" type="button" name="button">정보수정</button></a>
	            </div>
            </sec:authorize>
            </div>
        </section>
	
<%@ include file="../footer.jsp"%>
</html>