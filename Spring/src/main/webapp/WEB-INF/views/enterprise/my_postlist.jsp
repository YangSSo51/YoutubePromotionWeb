<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<style>
#select{
	background-color:#FF97B6;
	color:#fff;
}
.list{
	width:800px;
}
</style>
        <section>
         <div class="my-list">
            <ul>
              <li class="mypage">마이페이지</li>
              <li id="select"><a id="select" href="<c:url value="/apply/youtuber/list"/>">내 공고 리스트</a></li>
              <li><a href="<c:url value="/youtuber/profile"/>">유튜버 목록</a></li>
            </ul>
          </div>
          <div class="right-container">
            <h2 class="text-center">내 공고 목록</h2>
              <table class="list">
                <tr>
                  <th style="width:30px;"></th>
                  <th>제목</th>
                  <th>조회수</th>
                  <th>신청 현황</th>
                  <th>초대 현황</th>
                </tr>
                <c:set var="i" value="0"/>
                 <c:forEach items="${EnterprisePost}" var="EnterprisePostVO">
                 <c:set var="i" value="${i+1 }"/>
                <tr>
                  <td style="width:30px; padding-left:20px;"><c:out value="${i}"/></td>
                  <td>
                    <div class="long-text">
	                	<a href="http://localhost:8080/myweb/enterprise/detail?id=${EnterprisePostVO.id}">
	                	<c:out value="${EnterprisePostVO.title}"/>
                	</a>
                    </div>
                  </td>
                  <td>
                    <c:out value="${EnterprisePostVO.viewCnt}"/>
                  </td>                  
                  <td><a href="<c:url value="/enterprise/apply/list?id=${EnterprisePostVO.id}"/>">
                  <button id="contact" type="button" name="button">지원자 보기</button>
                  </a></td>
                  <td><a href="<c:url value="/invite/enterprise/list?id=${EnterprisePostVO.id}"/>"><button id="contact" type="button" name="button">초대하기</button></a></td>
                </tr>
               </c:forEach>
              </table>
              </div>
        </section>
<%@ include file="../footer.jsp"%>
</body>
</html>