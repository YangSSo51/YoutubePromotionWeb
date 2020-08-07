<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<% int ID = (Integer)session.getAttribute("ID"); %> 

<style>
#modal,#modal2{
  display:none;
  position:relative;
  width:100%;
  height:100%;
  top : -600px;
  z-index:1;
}

#modal h2 ,#modal2 h2{
  margin:0;   
}

#modal button ,#modal2 button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content ,#modal2 .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer ,#modal2 .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}   

</style>

<%@ include file="../navbar.jsp"%>
      <section>
          <span class="title">${EnterprisePost.title}</span><span class="enterprise">${name}</span>
          <hr class="#FF97B6">
          <table class="detail_table">
            <tr>
              <td>
                <div class="td-title">
                	 모집기간
                </div>
              </td>
              <td>
               <div class="td-content">
			${EnterprisePost.date}               
			</div>
              <td>
                <div class="td-title">
         	         모집인원
                </div>
              </td>
              <td>
              <div class="td-content">
			${EnterprisePost.recuitCnt}              
			</div>
              </td>
            </tr>
            <tr>
              <td>
              <div class="td-title">
               	 카테고리
              </div>
              </td>
              <td>
              <div class="td-content">
                ${EnterprisePost.category}
                </div>
              </td>
              <td>
                <div class="td-title">
               	 위치
                </div>
              </td>
              <td>
                <div class="td-content" id="long-text">
                	산기대
                </div>
              </td>
            </tr>
          </table>

          <div class="detail">
            <img class="detail_img" src="getImage?name=${EnterprisePost.image}" />
              <div class="detail_desc">
          		<c:forEach items="${detail}" var="detail">
                <p><c:out value="${detail}"/></p>
              	</c:forEach>
            </div>
          </div>
          <div class="button_group" style="margin: 0;">          
            <a href="/myweb/enterprise/update?id=${EnterprisePost.id}"><button class="button" type="button" name="button" >수정하기</button></a>
            <a href="/myweb/enterprise/delete?id=${EnterprisePost.id}"><button class="button" type="button" name="button" >삭제하기</button></a>
          </div>
          
				<!-- Modal -->
				<div id="root">
   					<button type="button" id="modal_open_btn">초대하기</button>
				</div>

				<div id="modal">
    				<div class="modal_content">
						<!-- content1 : 유튜버 목록  -->
						<div class="content1">
							<h2>유튜버 리스트</h2>
							<form method="post" action="http://localhost:8080/myweb/enterprise/invite/">
								<c:forEach items="${Youtuber}" var="YoutuberVO">
								<div>
									<label><input type="checkbox" name="youtuberID" value=${YoutuberVO.id}>${YoutuberVO.name}</label>
								</div>
								</c:forEach>
								<div>
									<input name="enterID" type="hidden" class="form-control" value=${EnterprisePost.enterID}>
									<input name="postID" type="hidden" class="form-control" value=${EnterprisePost.id}>
			
									<input type="submit" value="초대하기">
								</div>
							</form>
							<button type="button" id="modal_close_btn">닫기</button>
						</div>	
    				</div>
    				<div class="modal_layer"></div>
				</div>
				<!-- Modal -->
				<div id="root">
   					<button type="button" id="open_btn">신청하기</button>
				</div>

				<div id="modal2">
    				<div class="modal_content">
						<h2>신청하기</h2>
						<div class="content">
							<form method="post" action="<c:url value="/youtuber/apply" />">
							<div>
								<span class="label-input100">category</span>
								<input class="input100" type="text" name="category" placeholder="뷰티">
							</div>
							<div>
								<span class="label-input100">date</span>
								<input class="input100" type="text" name="date" placeholder="2020-09-01">
							</div>
							<div>
								<span class="label-input100">location</span>
								<input class="input100" type="text" name="location" placeholder="위치">
							</div>
							<div>
								<span class="label-input100">comment</span>
								<input class="input100" type="text" name="comment" placeholder="안녕하세요">
							</div>
							<div>
							<input name="youtuberID" type="hidden" class="form-control" value=<%=ID%>>
							<input name="postID" type="hidden" class="form-control" value=${id}>
					
							<input type="submit" value="Submit">
							</div>
						</form>
						   <button type="button" id="close_btn">닫기</button>
						</div>	
    				</div>
    				<div class="modal_layer"></div>
				</div>
        </section>
		<script language="javascript">
		// Modal 
		document.getElementById("modal_open_btn").onclick = function() {
        	document.getElementById("modal").style.display="block";
    	}

    	document.getElementById("modal_close_btn").onclick = function() {
        	document.getElementById("modal").style.display="none";
    	}

		document.getElementById("open_btn").onclick = function() {
	        	document.getElementById("modal2").style.display="block";
	    }
    	document.getElementById("close_btn").onclick = function() {
	        	document.getElementById("modal2").style.display="none";
	   }
</script>
	

</body>
</html>