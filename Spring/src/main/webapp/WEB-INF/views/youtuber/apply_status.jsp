<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<style>
#result{
	width:50px;
	background-color:#fff;
	color:#000;
}
</style>
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

	        <section>
            <h2 class="text-center">지원현황</h2>
              <table class="list">
                <tr>
                  <th style="width:30px;"></th>
                  <th>공고명</th>
                  <th>카테고리</th>
                  <th>승인여부</th>
                </tr>
                 <c:set var="i" value="0"/>
                <c:forEach items="${Apply}" varStatus="status">   
                 <c:set var="i" value="${i+1 }"/>
                <tr>
                  <td style="width:30px;"><c:out value="${i}"/></td>
                  <td>
                    ${Post[status.index].title}
                  </td>
                  <td>
                    ${Apply[status.index].category}
                  </td>
                  <td>
                  	<button id='result'><script>showResult(${Apply[status.index].result})</script></button>
                   </td>

                </tr>
                </c:forEach>
              </table>
        </section>
<%@ include file="../footer.jsp"%>
</html>