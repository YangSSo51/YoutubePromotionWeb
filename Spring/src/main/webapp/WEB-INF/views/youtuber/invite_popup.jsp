<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invite</title>
</head>
<body>
	<h2>${EnterprisePost.title}</h2>

	<input type=button value="수락" onclick="accept_invite();"/>
	<input type=button value="거절" onclick="reject();"/>
	
	
	<!-- javascript -->
	<script language="javascript">
		function accept_invite(){
			alert("초대를 수락하였습니다!");
			
		}
		function reject(){
			alert("거절된 초대는 삭제됩니다.");
	 		window.close();
		}
	</script>
	
</body>
</html>