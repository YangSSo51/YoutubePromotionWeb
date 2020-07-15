<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>

	<!-- Main -->
		<div id="page">
				
			<!-- Main -->
			<div id="main" class="container">
				
				<header>
					<h2 style="font-weight: bold;">광고비 없이 유튜브 홍보가 필요하세요?</h2><br>
					<span class="byline">제품 홍보&리뷰를 위한 유튜버 매칭</span>
				</header>
                  		<img src="<c:url value="/resources/images/description.png"/>" width="600px" alt="" style="max-width: 50%; margin-left: auto; margin-right:auto; display: block;">
			<a href="#" class="button">등록하기</a>
			<a href="<c:url value="/youtuber/login" />" class="button">로그인하기</a>
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