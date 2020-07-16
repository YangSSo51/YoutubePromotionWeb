<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>

	<!-- Main -->
		<div id="page">
				
			<!-- Main -->
			<div id="main" class="container">
			<img src="getImage?name=${youtuber.image}" style="width:450px;height:300px;"/>
			
			<h4>이름 ${youtuber.name }</h4>
			<h4>채널링크 ${youtuber.url }</h4>
			
			<a href="<c:url value="/youtuber/update?id=${id}" />" class="button">수정하기</a>
			<a href="<c:url value="/youtuber/delete?id=${id}" />" class="button">회원탈퇴하기</a>
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