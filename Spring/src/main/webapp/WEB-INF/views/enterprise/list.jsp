<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<style>
	.button.fit{
		display:block;
		margin: 0 0 1em 0;
		width:100%;
	}
	a{
		color:#2524FF;
	}

</style>
        <section>
            <span><h3>지원업체</h3></span>
            <hr>
            <div>
            <div >
            	<a href="<c:url value="/enterprise/search?category=헬스"/>">헬스</a>
            	<a href="<c:url value="/enterprise/search?category=뷰티"/>">뷰티</a>
            	<a href="<c:url value="/enterprise/search?category=메이크업"/>">메이크업</a>
            	<a href="<c:url value="/enterprise/search?category=바디"/>">바디</a>
            	<a href="<c:url value="/enterprise/search?category=네일"/>">네일</a>
            	<a href="<c:url value="/enterprise/search?category=헤어"/>">헤어</a>

            </div>
            <form class="right_form" action="<c:url value="/enterprise/search"/>" method="post">
              <input type="search" name="title" value="">
              <button type="submit" name="button">검색</button>
            </form>
            </div>
            <ul class="list">
              <c:forEach items="${EnterprisePost}" varStatus="status">
              <li>
 				<a href="<c:url value="/enterprise/detail?id=${EnterprisePost[status.index].id}"/>" class="inner">
 				<div class="thumb">
 					<img src="getImage?name=${EnterprisePost[status.index].image}" alt="썸네일이미지">
 				</div>
                <div class="desc">
                 	<div class="title">
                 	 <c:out value="${EnterprisePost[status.index].title} - ${enterprise[status.index].name}"/>
                 	</div>
                 	<div class="date">
                     <c:out value="${EnterprisePost[status.index].description}"/>
                 	</div>
                 	<div class="date">
                     <c:out value="${EnterprisePost[status.index].applyCnt}/${EnterprisePost[status.index].recuitCnt}"/>
                 	</div>
                 </div>
    			</a>
    		</li>
    		</c:forEach>
            </ul>
            <sec:authorize access="hasRole('ROLE_ENTERPRISE')">
	            <div class="button_group">
	              <a href="<c:url value="/enterprise/post"/>"><button class="button" type="button" name="button" id="write" >작성하기</button></a>
	            </div>
            </sec:authorize>
        </section>
