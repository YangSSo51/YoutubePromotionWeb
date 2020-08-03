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
		var result = document.getElementById('result');
	  	
		function accept_apply(id){
			alert("홍보 요청 수락");
			location.href="./accept?id=" + id;
		}
		function reject_apply(id){
			alert("홍보 요청 거부");
			location.href="./reject?id=" + id;
		}

	</script>
	        <section>
            <h2 class="text-center">지원현황</h2>
              <table class="list">
                <tr>
                  <th style="width:30px;"></th>
                  <th>체널명</th>
                  <th>카테고리</th>
                  <th>홍보요청</th>
                  <th>승인여부</th>
                </tr>
                <c:forEach items="${Youtuber}" varStatus="status">   
                <tr>
                  <td style="width:30px;">1</td>
                  <td>
                    <div class="long-text">
                      	<a href="<c:url value="/youtuber/profile"/>">${Youtuber[status.index].name}</a>
                    </div>
                  </td>
                  <td>
                    ${Youtuber[status.index].category}
                  </td>
                  <td>
                  	${Apply[status.index].result}
                  </td>
                  <td>
             
	              <button id='accept' value="수락" onclick="accept_apply(${Apply[status.index].id});">수락</button>
	              <button id='reject' value="거절" onclick="reject_apply(${Apply[status.index].id});">거절</button>
	              <button id='result'></button>
                
                  <script>
						var accept = document.getElementById('accept');
						var reject = document.getElementById('reject');
						var value = ${Apply[status.index].result};
						
						if(value != 0){
							accept.style.display='none';
							reject.style.display='none';
							
							if(value == 1)
								document.write("수락");
							else
								document.write("거절");
						}
										
					</script>
                  </td>
                </tr>
                </c:forEach>
              </table>
        </section>
<%@ include file="../footer.jsp"%>
</html>