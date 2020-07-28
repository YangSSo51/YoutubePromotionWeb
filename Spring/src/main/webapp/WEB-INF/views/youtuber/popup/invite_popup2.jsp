<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invite</title>
</head>
<body>
	<form name="accept_form" action="http://localhost:8080/myweb/enterprise/invite/accept?inviteid=${inviteid}" method="post">
		<input type="text" name="phoneNo" placeholder="연락처를  입력해주세요" />
		<input type="hidden" name="id" value= "${inviteid} "/>
		<input type="submit" name="제출"/>
	</form>
	
</body>
