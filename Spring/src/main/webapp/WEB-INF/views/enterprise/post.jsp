<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<% int ID = (Integer)session.getAttribute("ID"); %> 

<body>

	   <section>
            <h2 class="text-center">공고 등록하기</h2>
            <form class="post-form" action="http://localhost:8080/myweb/enterprise/post/" method="post" enctype="multipart/form-data">
              <table>
                <tr>
 				<input name="enterID" type="hidden" value=<%=ID%> >

                  <td>
                    <div class="form-text">
                      	제목
                    </div>
                  </td>
                  <td>
                    <input class="form-input" type="text" name="title" placeholder="제목" autofocus>
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
                      <td><input class="form-input" type="date" name="date" id="date"></td>
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
	                  <input type="file" name="file" hidden/>
	                  <input type="text" name="image" hidden />
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
                    <input class="form-input" type="text" name="recuitCnt" placeholder="모집인원" id="recuitCnt" >
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
	                <textarea name="description" rows="15" cols="90" id="web"></textarea>
                    <textarea name="description" rows="10" cols="34" id="mobile"></textarea>
                  </td>
                </tr>
              </table>
              <div class="button_group">
                <a href="#"><button class="button" type="submit" name="button" id="write" >제출하기</button></a>
              </div>
             </form>
        </section>
</body>
<%@ include file="../footer.jsp"%>
