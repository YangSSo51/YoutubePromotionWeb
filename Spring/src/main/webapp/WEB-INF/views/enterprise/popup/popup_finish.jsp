<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
        <div class="row align-items-center justify-content-center">
        	<p>초대가 완료되었습니다!</p>
        	<input type="button" value="close" onclick="finish();"/>
        </div>
    </div>
    
    
<!-- javascript  -->
<script language="javascript">
	alert(${result});
	function finish(){
		window.close();
	}
</script>
	
</body>
</html>