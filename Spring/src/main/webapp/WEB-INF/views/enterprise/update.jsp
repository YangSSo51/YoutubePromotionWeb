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
                   <!-- date하나 더 추가됨(기간이라) -->
                    <table class="date_table">
                      <td><input class="form-input" type="date" name="date" id="date" value="${EnterprisePost.date} }"></td>
                      <td style="padding: 0 0 18px 20px">~<td>
                      <td><input class="form-input" type="date" name="date" id="date"></td>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div class="form-text">
                   	 이미지
                  </div>
                  </td>
                  <td>
                    <label class="filebtn">
                      Browse File
	                  <input type="file" name="file" value="${EnterprisePost.image}"/>
	                  <input type="text" name="image" value="${EnterprisePost.image}"/>
	                 
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
                    <input class="form-input" type="text" name="category" id="recuitCnt" value="${EnterprisePost.category}">
                  </td>
                </tr>
                <tr>
                  <td>
                    <div class="form-text">
                     	 설명
                    </div>
                  </td>
                  <td>
                    <textarea name="description" rows="15" cols="90" id="web"></textarea>
                    <textarea name="description" rows="10" cols="34" id="mobile"></textarea>
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