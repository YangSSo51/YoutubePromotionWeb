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
	<input type=button value="거절" onclick="reject_invite();"/>
	
	
	<!-- javascript -->
	<script language="javascript">
		function accept_invite(){
			alert("초대 수락");
			location.href="../accept?inviteid=${inviteid}";
			
		}
		function reject_invite(){
			alert("거절된 초대는 삭제됩니다.");
			location.href="../reject?inviteid=${inviteid}";
		}
	</script>
	
</body>
</html>