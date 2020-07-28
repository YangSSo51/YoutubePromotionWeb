<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>

   <!-- javascript -->
   <script language="javascript">	
		function showResult(result){
			var str;
			if(result == 1)
				str = "수락";
			else if(result == 2)
				str = "거절";
			else
				str = "대기중";
			document.write(str);
		}
   </script>
   
   <!-- Main -->
      <div id="page">   
         <!-- Main -->
         <div id="main" class="container">
         
         	<table border="1" width=500 >
         		<tr>
         			<th>채널명</th>
         			<th>카테고리</th>
         			<th>초대결과</th> 
         		</tr>
         		
         		<c:forEach items="${Youtuber}" varStatus="status">   
         		<tr>
         			<td>${Youtuber[status.index].name}</td>
         			<td>${Youtuber[status.index].category}</td>
		   			<td><script>showResult(${Invite[status.index].result})</script></td>
         		</tr>	
         		</c:forEach>
         	</table>
         	
         </div>
         <!-- Main -->
      </div>
   <!-- /Main -->

<%@ include file="../footer.jsp"%>
</html>