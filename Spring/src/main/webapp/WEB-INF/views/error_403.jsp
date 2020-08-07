<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp"%>
<html>
<body>
      <section>
      	<div class="home-container">
      		  <p>권한이 없습니다. 관리자에게 문의하세요.</p>
      		  <a href="<c:url value="/"/>">홈으로 돌아가기</a>
      	</div>
      </section>

 <%@ include file="footer.jsp"%>

  </body>
</html>