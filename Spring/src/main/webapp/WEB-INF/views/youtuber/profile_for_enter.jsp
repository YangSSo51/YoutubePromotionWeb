<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<style>
#select{
	background-color:#FF97B6;
	color:#fff;
}
</style>
        <section>
              
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
                   
            </div>
        </section>
	
<%@ include file="../footer.jsp"%>
</html>