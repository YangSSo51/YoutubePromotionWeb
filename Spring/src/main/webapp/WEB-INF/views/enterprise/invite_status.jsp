<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<style>
#result{
	width:50px;
	background-color:#fff;
	color:#000;
}
</style>
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
			document.getElementById("result").value = str;
		}
   </script>
   	        <section>
            <h2 class="text-center">초대현황</h2>
              <table class="list">
                <tr>
                  <th style="width:30px;"></th>
                  <th>채널명</th>
                  <th>카테고리</th>
                  <th>초대결과</th>
                  <th>연락처</th>
                </tr>
                <c:set var="i" value="0"/>
         		<c:forEach items="${Youtuber}" varStatus="status">   
                 <c:set var="i" value="${i+1 }"/>
                <tr>
                  <td style="width:30px;"><c:out value="${i}"/></td>
                  <td>
                    <div class="long-text">
                      	<a href="<c:url value="/youtuber/profile?id=${Youtuber[status.index].id}"/>">${Youtuber[status.index].name}</a>
                    </div>
                  </td>
                  <td>
                    ${Youtuber[status.index].category}
                  </td>
                  <td>	
						<button id='result'><script>showResult(${Invite[status.index].result})</script></button>
                  </td>
                  <td>
                  	${Invite[status.index].phoneNo }
                  </td>
                  
                </tr>
                </c:forEach>
              </table>
        </section>
  
<%@ include file="../footer.jsp"%>
</html>