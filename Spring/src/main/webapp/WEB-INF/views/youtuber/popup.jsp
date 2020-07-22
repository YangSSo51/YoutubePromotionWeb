<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int id = (Integer)session.getAttribute("id"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>신청하기</h1>
	<form method="post" acition="http://localhost:8080/myweb/youtuber/apply/post">
		<div>
			<span class="label-input100">category</span>
			<input class="input100" type="text" name="category" placeholder="뷰티">
		</div>
		<div>
			<span class="label-input100">date</span>
			<input class="input100" type="text" name="date" placeholder="2020-09-01">
		</div>
		<div>
			<span class="label-input100">location</span>
			<input class="input100" type="text" name="location" placeholder="위치">
		</div>
		<div>
			<span class="label-input100">comment</span>
			<input class="input100" type="text" name="comment" placeholder="안녕하세요">
		</div>
		<div>
		<input name="youtuberID" type="hidden" class="form-control" value=<%=id%>>
		<input name="postID" type="hidden" class="form-control" value=${id}>

		<input type="submit" value="Submit">
		</div>
	</form>
</body>
</html>