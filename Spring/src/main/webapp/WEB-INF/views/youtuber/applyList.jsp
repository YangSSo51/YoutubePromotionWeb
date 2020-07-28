<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>

	<!-- Main -->
		<div id="page">
				
			<!-- Main -->
			<div id="main" class="container">
			<c:forEach items="${Apply}" var="Apply">
				<h3><c:out value="${Apply.result}"/></h3>				
			</c:forEach>
			</div>
			<!-- Main -->
		</div>
	<!-- /Main -->
<%@ include file="../footer.jsp"%>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.16.0/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
</html>