<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>

	<!-- Main -->
		<div id="page">
				
			<!-- Main -->
			<div id="main" class="container">
			<img src="getImage?name=${youtuber.image}" style="width:450px;height:300px;"/>
			
			<h4>이름 ${youtuber.name }</h4>
			<h4>채널링크 ${youtuber.url }</h4>
			<h4>채널링크 ${youtuber.category }</h4>
			
			<a href="<c:url value="/youtuber/update?id=${id}" />" class="button">수정하기</a>
			<a href="<c:url value="/youtuber/delete?id=${id}" />" class="button">회원탈퇴하기</a>
			</div>
			<!-- Main -->
		</div>
	<!-- /Main -->
<%@ include file="../footer.jsp"%>
</html>