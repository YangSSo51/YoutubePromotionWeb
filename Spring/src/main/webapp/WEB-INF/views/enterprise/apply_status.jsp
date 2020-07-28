<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>

   <!-- javascript -->
	<script language="javascript">
		function accept_apply(id){
			alert("홍보 요청 수락");
			location.href="./accept?id=" + id;
			
		}
		function reject_apply(id){
			alert("홍보 요청 거부");
			location.href="./reject?id=" + id;
		}
		function checkResult(result){
			if(result == 0)
				return true;
			else
				return false;
		}
		function showResult(result){
			var str;
			if(result == 1)
				str = "수락";
			else if(result == 2)
				str = "거절";
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
         			<th>홍보요청</th> 
         		</tr>
         		
         		<c:forEach items="${Youtuber}" varStatus="status">   
         		<tr>
         			<!-- 링크 부분 수정 -->
         			<td><a href="myweb/youtuber/profile">${Youtuber[status.index].name}</a></td> 
         			<td>${Youtuber[status.index].category}</td>
         			<td>${Apply[status.index].result}</td>
         			<td>
					<input type="button" id='accept' value="수락" onclick="accept_apply(${Apply[status.index].id});"/>
       				<input type="button" id='reject' value="거절" onclick="reject_apply(${Apply[status.index].id});"/>	
			        <script>
						var accept = document.getElementById('accept');
						var reject = document.getElementById('reject');

     					if(checkResult(${Apply[status.index].result})==false){
     						showResult(${Apply[status.index].result});
							accept.style.display='none';
							reject.style.display='none';
						}
     			
						
         			</script>
         			</td>
         		</tr>	
         		</c:forEach>
         	</table>
         	
         </div>
         <!-- Main -->
      </div>
   <!-- /Main -->

<%@ include file="../footer.jsp"%>
</html>