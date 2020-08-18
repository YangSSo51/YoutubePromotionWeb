<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<style>
	.button.fit{
		display:block;
		margin: 0 0 1em 0;
		width:100%;
	}

</style>
        <section>
            <span><h3>지원업체</h3></span>
            <hr>
            <h6>선정완료</h6>
            <div>
            <form class="right_form" action="<c:url value="/enterprise/search"/>" method="post">
              <input type="search" name="title" value="">
              <button type="submit" name="button">검색</button>
            </form>
            </div>
            <ul class="list">
              <c:forEach items="${EnterprisePost}" var="EnterprisePostVO">
              <li>
 				<a href="<c:url value="/enterprise/detail?id=${EnterprisePostVO.id}"/>" class="inner">
 				<div class="thumb">
 					<img src="getImage?name=${EnterprisePostVO.image}" alt="썸네일이미지">
 				</div>
                <div class="desc">
                 	<div class="title">
                 	 <c:out value="${EnterprisePostVO.title}(${EnterprisePostVO.viewCnt})"/>
                 	</div>
                 	<div class="date">
                     <c:out value="${EnterprisePostVO.description}"/>
                 	</div>
                 	<div class="date">
                     <c:out value="${EnterprisePostVO.applyCnt}/${EnterprisePostVO.recuitCnt}"/>
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
