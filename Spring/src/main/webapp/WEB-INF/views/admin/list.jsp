<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>

<style>
	.button-center #login{
	   background-color: inherit;
	   border: 2px solid #FF97B6;
	   color: #000;
	   width: 120px;
	}
</style>
        <section>
            <h2 class="text-center">가입자 목록</h2>
              <table class="list">
                <tr>
                  <th style="width:30px;"></th>
                  <th>ID(사업자번호,유튜브주소)</th>
                  <th>권한</th>
                  <th>삭제</th>
                </tr>
                <c:set var="i" value="0"/>
                 <c:forEach items="${user}" var="status">
                 <c:set var="i" value="${i+1}"/>
                <tr>
                  <td style="width:30px;"><c:out value="${i}"/></td>
                  <td>
                    <div>
	                	<c:out value="${user[i-1].username}"/>
                    </div>
                  </td>
                  <td>
                    <c:out value="${auth[i-1]}"/>
                  </td>                  
                  <td><a href="<c:url value="/deleteUser?id=${user[i-1].id}"/>"><button id="contact" type="button" name="button">삭제하기</button></a></td>
                </tr>                
               </c:forEach>
              </table>
              
          <div class="button-center" style="margin-top : 30px;">
          	<a href="<c:url value="/register/enterprise"/>"><button type="button" name="button" style="width:120px;">기업 등록</button></a>
            <a href="<c:url value="/register/youtuber"/>"><button type="button" name="button" id="login">유튜버 등록</button></a>
          </div>
        </section>
<%@ include file="../footer.jsp"%>
</body>
</html>