<%@ include file="../navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
#modal {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  top : -300px;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}   
</style>


<body>
<section>
			<h2 class="text-center">초대 대기 목록</h2>
              <table class="list">
                <tr>
                  <th style="width:30px;"></th>
                  <th>공고 제목</th>
                  <th>현황</th>
                </tr>
                <c:set var="i" value="0"/>
				<c:forEach items="${postList}" varStatus="status">
                 <c:set var="i" value="${i+1}"/>
                <tr>
                  <td style="width:30px;"><c:out value="${i}"/></td>
                  <td>
                    <div class="long-text">
               		 <a href="<c:url value="/enterprise/detail?id=${postList[status.index].id}"/>">${postList[status.index].title}</a>
                    </div>
                  </td>
					<td><button value="수락" onclick="accept_invite(${Invite[status.index].id});">수락</button></td>
                  	<td><a href="<c:url value="/invite/reject?inviteid=${Invite[status.index].id}"/>"><button value="거절" onclick="reject_invite();">거절</button></a></td>                                    
                </tr>
               </c:forEach>
              </table>
			<div id="modal">
    				<div class="modal_content">
						<!-- content2 : 초대 수락 시, 연락처 입력  -->
						<div class="content2">
							<form id="accept_form" action="<c:url value="/invite/accept"/>" method="post">
								<input type="text" name="phoneNo" placeholder="연락처를  입력해주세요" />
								<input type="hidden" name="id" id="inviteId"/>
								<input type="submit" name="제출"/>
							</form>
						</div>	
						<button type="button" id="modal_close_btn">닫기</button>				
    				</div>
    				<div class="modal_layer"></div>
				</div>
				
            
</section>
  
	<!-- javascript -->
	<script language="javascript">
		function choiceInvite(id, inviteid){
			var path = "./choice/?id=" + id + "&inviteid=" + inviteid ;
			window.open(path, "choiceInvite", "width=400, height=300, left=100, top=50");
		}
		function accept_invite(x){
			document.getElementById("modal").style.display="block";
			document.getElementById("inviteId").value=x;
		}
		function reject_invite(){
			alert("거절된 초대는 삭제됩니다.");
			// location.href="./reject?inviteid=" + inviteid;
		}

		// Modal 
    	document.getElementById("modal_close_btn").onclick = function() {
        	document.getElementById("modal").style.display="none";
    	}
		   
	</script>

</body>

