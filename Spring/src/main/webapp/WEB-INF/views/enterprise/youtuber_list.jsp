<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
        <section>
            <h2 class="text-center">유튜버 목록</h2>
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
                  <td><a href="<c:url value="/delete?id=${user[i-1].id}"/>"><button id="contact" type="button" name="button">삭제하기</button></a></td>
                </tr>                
               </c:forEach>
              </table>
        </section>
<%@ include file="../footer.jsp"%>
</body>
</html>