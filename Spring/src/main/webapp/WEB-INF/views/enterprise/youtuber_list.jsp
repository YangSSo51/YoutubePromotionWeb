<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
        <section>
            <h2 class="text-center">유튜버 목록</h2>
              <table class="list">
                <tr>
                  <th style="width:30px;"></th>
                  <th>채널명</th>
                  <th>프로필보러가기</th>
                </tr>
                <c:set var="i" value="0"/>
                 <c:forEach items="${youtuber}" var="status">
                 <c:set var="i" value="${i+1}"/>
                <tr>
                  <td style="width:30px;"><c:out value="${i}"/></td>
                  <td>
                    <div>
	                	<c:out value="${youtuber[i-1].name}"/>
                    </div>
                  </td>
                  <td>
                    <c:out value="${youtuber[i-1].category}"/>
                  </td>                  
                  <td><a href="<c:url value="/youtuber/profile?id=${user[i-1].id}"/>"><button id="contact" type="button" name="button">프로필보기</button></a></td>
                </tr>                
               </c:forEach>
              </table>
        </section>
<%@ include file="../footer.jsp"%>
</body>
</html>