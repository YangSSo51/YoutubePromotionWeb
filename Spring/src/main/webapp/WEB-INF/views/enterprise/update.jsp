<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>  

<body>
      <section>
            <h2 class="text-center">공고 수정하기</h2>
            <form class="post-form" action="<c:url value="/enterprise/update/"/>" method="post" enctype="multipart/form-data">
              <table>
                <tr>
               <input name="id" type="hidden" value="${EnterprisePost.id}">
                  <td>
                    <div class="form-text">
                      	제목
                    </div>
                  </td>
                  <td>
                    <input class="form-input" type="text" name="title" placeholder="제목" autofocus value="${EnterprisePost.title}">
                  </td>
                </tr>
                <tr>
                  <td>
                    <div class="form-text">
                    	  모집기간
                    </div>
                  </td>
                  <td>
	 			  	<input class="form-input" type="date" name="date" id="date" value="${EnterprisePost.date}">
	 			  </td>
                </tr>
                <tr>
                  <td>
                    <div class="form-text">
                   	 이미지
                  </div>
                  </td>
                  <td>
                    <label class="filebtn" style="display:inline-block; ">
                    <div style="text-align:center; padding-top:10px;">
                      Browse File
                    </div>
	                  <input type="file" name="file" value="${EnterprisePost.image}" hidden/>
	                  <input type="text" name="image" value="${EnterprisePost.image}" hidden/>
	                 
                    </label>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div class="form-text">
                    	 모집인원
                    </div>
                  </td>
                  <td>
                    <input class="form-input" type="text" name="recuitCnt" id="recuitCnt" value="${EnterprisePost.recuitCnt}">
                    	명
                  </td>
                </tr>
                <tr>
                  <td>
                    <div class="form-text">
                    	 카테고리
                    </div>
                  </td>
                  <td>
                  	<select name="category">
                  		<option value="네일">네일</option>
                  		<option value="헤어">헤어</option>
                  		<option value="바디">바디</option>
                  		<option value="헬스">헬스</option>
						<option value="뷰티">뷰티</option>
                  		<option value="메이크업">메이크업</option>                  		
                  	</select>                  
                  	</td>
                </tr>
                <tr>
                  <td>
                    <div class="form-text">
                     	 설명
                    </div>
                  </td>
                  <td>
                  	<textarea name="description">${EnterprisePost.description}</textarea>    
                  </td>
                </tr>
              </table>
              <div class="button_group">
                <a href="#"><button class="button" type="submit" name="button" id="write">수정하기</button></a>
              </div>
             </form>
        </section>
	<%@ include file="../footer.jsp"%>
	
</body>
</html>