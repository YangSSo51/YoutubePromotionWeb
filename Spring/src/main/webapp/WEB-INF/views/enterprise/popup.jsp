<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% int enterID = (Integer)session.getAttribute("enterID"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>유튜버 리스트</h1>
	<form method="post" acition="http://localhost:8080/myweb/enterprise/invite/post">
		<c:forEach items="${Youtuber}" var="YoutuberVO">
		<div>
		<label><input type="checkbox" name="youtuberID" value=${YoutuberVO.id}>${YoutuberVO.name}</label>
		</div>
		</c:forEach>
		<div>
		<input name="enterID" type="hidden" class="form-control" value=<%=enterID%>>
		<input name="postID" type="hidden" class="form-control" value=${postID}>
		
		<input type="submit" value="Submit">
		</div>
		
	</form>
</body>
</html>