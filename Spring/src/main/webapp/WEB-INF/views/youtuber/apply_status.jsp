<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<style>
#result{
	width:50px;
	background-color:#fff;
	color:#000;
}
#select{
	background-color:#FF97B6;
	color:#fff;
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
         <div class="my-list">
            <ul>
              <li class="mypage">마이페이지</li>
              <li><a href="<c:url value="/youtuber/myprofile"/>">프로필</a></li>
              <li id="select"><a id="select" href="<c:url value="/apply/youtuber/list"/>">지원현황</a></li>
              <li><a href="<c:url value="/invite/youtuber/list"/>">초대현황</a></li>
            </ul>
          </div>
          <div class="right-container">
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
                  <td style="width:30px; padding-left:10px;" ><c:out value="${i}"/></td>
                  <td>
                   <a href="<c:url value="/enterprise/detail?id=${Post[status.index].id}"/>">${Post[status.index].title}</a>
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
              </div>
        </section>
<%@ include file="../footer.jsp"%>
</html>