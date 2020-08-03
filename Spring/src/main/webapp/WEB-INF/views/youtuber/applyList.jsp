<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
        <section>
            <h2 class="text-center">내 지원 목록</h2>
              <table class="list">
                <tr>
                  <th style="width:30px;"></th>
                  <th>제목</th>
                  <th>지원현황</th>
                  <th>선정여부</th>
                  <th>후기 작성</th>
                </tr>
                <tr>
                  <td style="width:30px;">1</td>
                  <td>
                    <div class="long-text">
                      <a href="#">
                     	 네이처 쿠션
                      </a>
                    </div>
                  </td>
                  <td>
                    <a href="#" title="지원자 보러가기">15/20명</a>
                  </td>
                  <td>선정완료</td>
                  <td><a href="#"><button id="review" type="button" name="button">후기 작성</button></a></td>
                </tr>
              </table>
        </section>
	<!-- Main -->
		<div id="page">
				
			<!-- Main -->
			<div id="main" class="container">
			<c:forEach items="${Apply}" var="Apply">
				<h3><c:out value="${Apply.result}"/></h3>				
			</c:forEach>
			</div>
			<!-- Main -->
		</div>
	<!-- /Main -->
<%@ include file="../footer.jsp"%>
