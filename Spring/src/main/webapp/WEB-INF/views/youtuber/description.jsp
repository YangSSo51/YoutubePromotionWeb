<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
        <section>
            <h3>오늘의 아름다움을 위한 영상 플랫폼</h3>
            <hr>
            <h6>오아영이 여러분과 함께 합니다</h6>
            <div class="description">
              <img src="<c:url value="/resources/images/description.png"/>" alt="">
            </div>
            <div class="button-center">
              <a href="#"><button type="button" name="button">등록하기</button></a>
              <a href="<c:url value="/youtuber/login"/>"><button type="button" name="button">로그인하기</button></a>
            </div>
        </section>
<%@ include file="../footer.jsp"%>
