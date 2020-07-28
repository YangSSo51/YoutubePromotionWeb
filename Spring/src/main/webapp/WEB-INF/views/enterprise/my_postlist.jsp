<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>

   <!-- Main -->
      <div id="page">
            
         <!-- Main -->
         <div id="main" class="container">
         	<table border="1" width="500">
 				<th>제목</th>
 				<th>조회수</th>
 				<th>채용인원</th>
 				<th>신청현황</th>
 				<th>초대현황</th>
 		
 		
          		<c:forEach items="${EnterprisePost}" var="EnterprisePostVO">
          		<tr>
          			<td>
                	<a href="http://localhost:8080/myweb/enterprise/detail?id=${EnterprisePostVO.id}">
                	<c:out value="${EnterprisePostVO.title}"/>
                	</a>
     				</td>
     				<td>
     				<c:out value="${EnterprisePostVO.viewCnt}"/>
     				</td>
     				<td>
     				<c:out value="${count}/${EnterprisePostVO.recuitCnt}"/>
     				</td>
     				<td>
            		<input type="button" name="apply_state" value="신청현황보기" onclick="showApply(${EnterprisePostVO.id});"/>
            		</td>
            		<td>
            		<input type="button" name="invite_state" value="초대현황보기" onclick="showInvite(${EnterprisePostVO.id});" />
            		</td>
		 		</tr>
          		</c:forEach>
 			</table>
         </div>
         <!-- Main -->
      </div>
   <!-- /Main -->

   <!-- Javascript -->   
   <script>
   		function showApply(id){
			location.href="/myweb/enterprise/apply/list?id=" + id;
   	   	}
   		function showInvite(id){
			location.href="/myweb/enterprise/invite/invitelist?id=" + id;
   	   	}
   </script>
   
<%@ include file="../footer.jsp"%>
</body>
</html>