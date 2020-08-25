<%@ include file="../navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#select{
	background-color:#FF97B6;
	color:#fff;
}
</style>
<body>
<section>
<div class="my-list">
            <ul>
              <li class="mypage">마이페이지</li>
              <li><a href="<c:url value="/youtuber/myprofile"/>">프로필</a></li>
              <li><a href="<c:url value="/apply/youtuber/list"/>">지원현황</a></li>
              <li id="select"><a id="select" href="<c:url value="/invite/youtuber/list"/>">초대현황</a></li>
            </ul>
          </div>
          <div class="right-container">
			<h2 class="text-center">초대 대기 목록</h2>
              <table class="list">
                <tr>
                  <th style="width:30px;"></th>
                  <th>공고 제목</th>
                  <th style="width:80px;">현황</th>
                </tr>
                <c:set var="i" value="0"/>
				<c:forEach items="${postList}" varStatus="status">
                 <c:set var="i" value="${i+1}"/>
                <tr>
                  <td style="width:30px; padding-left:10px;"><c:out value="${i}"/></td>
                  <td>
                    <div class="long-text">
               		 <a href="<c:url value="/enterprise/detail?id=${postList[status.index].id}"/>">${postList[status.index].title}</a>
                    </div>
                  </td>
					<td style="width:80px;">
					<button style="width:60px;" value="수락" onclick="accept_invite(${Invite[status.index].id});">수락</button>
					<a href="<c:url value="/invite/reject?inviteid=${Invite[status.index].id}"/>">
                  	<button style="width:60px;" value="거절" onclick="reject_invite();">거절</button></a>
					</td>                                 
                </tr>
               </c:forEach>
              </table>
				<div id="modal">
                <div class="modal_layer">
                <div class="middle_modal_content">
                  <div class="modal_title">
                   	연락처 제공
                  </div>
               	<form id="accept_form" action="<c:url value="/invite/accept"/>" method="post">
					<input style="margin-bottom:15px;"type="text" name="phoneNo" placeholder="010-1234-5678" />
					<input type="hidden" name="id" id="inviteId"/>
					<br>
					<label style="margin-top:5px;"><span>*업체에 정보제공을 위한</span></label>
					<br>
					<label><span>제3자 정보제공 동의 체크</span></label>
					<input type="checkbox" >
	                  <div class="modal_button" style="width:300px;">
	                    <button type="button" id="modal_close_btn">취소</button>
	                    <button type="submit" id="submit">제출하기</button>
	                  </div>							
	             </form>                
                </div>
              </div><!--modal layer-->
              </div><!--modal-->
				
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

