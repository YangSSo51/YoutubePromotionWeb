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
		// Modal 
		function modal_open(){
			document.getElementById("modal").style.display="block";
		}
		function modal_close(){
			document.getElementById("modal").style.display="none";
		}
	</script>
	        <section>
            <h2 class="text-center">지원현황</h2>
              <table class="list">
                <tr>
                  <th style="width:30px;"></th>
                  <th>채널명</th>
                  <th>카테고리</th>
                  <th>신청내용</th>
                  <th>승인여부</th>
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
                  	<div class="apply_button">
                  		<button type="button" id="apply_btn" onclick="modal_open()">확인</button>
                  	</div>
                  
                  <div id="modal">
	              <div class="modal_layer">
	              <div class="middle_modal_content">
                  <div class="modal_title">
                   	신청내용
                  </div>
                  	<div class="apply">
                 		<span class="form-text">카테고리</span>
                 		<hr>
                 		${Apply[status.index].category}
                 	</div>
                 	<div class="apply">
                 		<span class="form-text">날짜</span>
                 		<hr>
                 		${Apply[status.index].date}
                 	</div>
                 	<div class="apply">
                 		<span class="form-text">지역</span>
                 		<hr>
                 		${Apply[status.index].location}
                 	</div>
                 	<div class="apply">
                 		<span class="form-text">신청글</span>
                 		<hr>
                 		<div class="apply_comment">
                 			${Apply[status.index].comment}
                 		</div>
                 		
                 	</div>
                  <button type="button" class="close" onclick="modal_close()">닫기</button>
                  </div>
	              </div><!--modal layer-->
	              </div><!--modal-->
                  </td>
                  
                  <td>
             
	              <button name="accept" id='accept' value="수락" onclick="accept_apply(${Apply[status.index].id});">수락</button>
	              <button name="reject" id='reject' value="거절" onclick="reject_apply(${Apply[status.index].id});">거절</button>                
                  <script>
						var accept = document.getElementsByName('accept');
						var reject = document.getElementsByName('reject');
						var value = ${Apply[status.index].result};
						
						if(value != 0){
							for(i=0;i<accept.length;i++){
								accept[i].style.display='none';
							}
							for(i=0;i<reject.length;i++){
								reject[i].style.display='none';
							}
							if(value == 1)
								document.write("수락");
							else
								document.write("거절");
						}
					</script>
					<button id='result'></button>
                  </td>
                </tr>
                </c:forEach>
              </table>
        </section>
        
<%@ include file="../footer.jsp"%>
</html>