<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int enterID = (Integer)session.getAttribute("enterID"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>팝업창 입니다</h1>
	<form method="post" acition="http://localhost:8080/myweb/enterprise/invite/post">
		<div>
		<label><input type="checkbox" name="youtuberID" value=1>Youtuber1</label>
		</div>
		<div>
		<label><input type="checkbox" name="youtuberID" value=2>Youtuber2</label>
		</div>
		<div>
		<input name="enterID" type="hidden" class="form-control" value=<%=enterID%>>
		<input name="postID" type="hidden" class="form-control" value=${postID}>

		<input type="submit" value="Submit">
		</div>
	</form>
</body>
</html>