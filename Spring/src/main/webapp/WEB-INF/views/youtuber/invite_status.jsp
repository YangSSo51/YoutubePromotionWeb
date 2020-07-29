<%@ include file="../navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">   

<style>
#modal {
  display:none;
  position:relative;
  width:100%;
  height:100%;
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
    <!-- HOME -->
    
    <!-- Main -->
	<div id="page">
		
	<!-- Main -->
	<div id="main" class="container">


	<h3>초대 대기 목록</h3>
	<br>
	<c:forEach items="${postList}" varStatus="status">
		
        <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
        	<div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <a href="http://localhost:8080/myweb/enterprise/detail?id=${postList[status.index].id}">${postList[status.index].title}</a>
                <input type=button value="수락/거절하기" name=choiceInvite onclick="choiceInvite(${postList[status.index].id}, ${Invite[status.index].id});"/>
            	
            	<!-- Modal -->
				<div id="root">
   					<button type="button" id="modal_opne_btn">모달 창 열기</button>
				</div>

				<div id="modal">
    				<div class="modal_content">

        				<button type="button" id="modal_close_btn">모달 창 닫기</button>


						<!-- content1 : 초대 수락  -->
						<div class="content1">
							<form method="post" action="http://localhost:8080/myweb/enterprise/invite/">
									<h2>${EnterprisePost.title}</h2>

									<input type=button value="수락" onclick="accept_invite();"/>
									<input type=button value="거절" onclick="reject_invite();"/>
			
							</form>
						</div>	
						
						<!-- content2 : 초대 수락 시, 연락처 입력  -->
						<div class="content2">
							<form name="accept_form" action="http://localhost:8080/myweb/enterprise/invite/accept?inviteid=${Invite[status.index].id}" method="post">
								<input type="text" name="phoneNo" placeholder="연락처를  입력해주세요" />
								<input type="hidden" name="id" value= "${Invite[status.index].id}"/>
								<input type="submit" name="제출"/>
							</form>
						</div>	
						
						<!-- content3 : 초대 완료  -->
						<div class="content3">
							<p>초대가 완료 되었습니다</p>
						</div>	
						
    				</div>
   
    				<div class="modal_layer"></div>
				</div>
            
            </div>
        </div>
    </c:forEach>

	</div>
</div>


	<!-- javascript -->
	<script language="javascript">
		function choiceInvite(id, inviteid){
			var path = "./choice/?id=" + id + "&inviteid=" + inviteid ;
			window.open(path, "choiceInvite", "width=400, height=300, left=100, top=50");
		}
		function accept_invite(){
			alert("초대 수락");
			// location.href="./accept?inviteid=" + inviteid;
			
		}
		function reject_invite(){
			alert("거절된 초대는 삭제됩니다.");
			// location.href="./reject?inviteid=" + inviteid;
		}

		// Modal 
		document.getElementById("modal_opne_btn").onclick = function() {
        	document.getElementById("modal").style.display="block";
    	}
   
    	document.getElementById("modal_close_btn").onclick = function() {
        	document.getElementById("modal").style.display="none";
    	}
		   
	</script>

</body>

