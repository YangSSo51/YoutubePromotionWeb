<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="javascript">
	alert("${result}");
	history.back();
</script>
</head>
<body>
	<div class="container">
        <div class="row align-items-center justify-content-center">
        	<p>이미 진행중인 초대입니다</p>
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