<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.button.fit{
		display:block;
		margin: 0 0 1em 0;
		width:100%;
	}

</style>
<body>
     <!-- HOME -->
    <!-- <section class="home-section section-hero overlay bg-image" style="background-image: url('http://localhost:8080/myweb/post/getImage?name=home.jpg');" id="home-section">
	-->
	<section>
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12">
            <div class="mb-5 text-center">
              <h1 class="text-white font-weight-bold">My Post</h1>
              <p>Masitneun bab muggo sheepda...</p>
            </div>
           <form class="search-jobs-form" name=form1 action="http://localhost:8080/myweb/enterprise/search" method="post">
              <div class="row mb-5">
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                  <input name="title" type="text" class="form-control form-control-lg" placeholder="제목을 입력하세요">
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
                  <button type="submit" class="btn btn-primary btn-lg btn-block text-white btn-search"><span class="icon-search icon mr-2"></span>Search Recipe</button>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 popular-keywords">
                  <h3>Trending Keywords:</h3>
                  <ul class="keywords list-unstyled m-0 p-0">
                    <li><a href="#" class="">뷰티</a></li>
                    <li><a href="#" class="">헬스</a></li>
                    <li><a href="#" class="">필라테스</a></li>
                  </ul>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>

      <a href="#next" class="scroll-button smoothscroll">
        <span class=" icon-keyboard_arrow_down"></span>
      </a>
    </section>

    
    <section class="site-section" id="next">
      <div class="container">

        <div class="row mb-5 justify-content-center">
          <div class="col-md-7 text-center">
            <h2 class="section-title mb-2"><c:out value="${list}"/> Posts</h2>
          </div>
        </div>
        
 		<table border="1" width="500">
 		<th>제목</th>
 		<th>조회수</th>
 		<th>채용인원</th>
 		<th>신청현황</th>
 		<th>초대현황</th>
 		
 		
          <c:forEach items="${EnterprisePost}" var="EnterprisePostVO">
          <tr>
            <div class="job-listing-logo">
              <!--   <img src="http://localhost:8080/myweb/post/getImage?name=${EnterprisePostVO.image}" class="img-fluid"style="width:150px;height:80px;"/>
            	-->
            </div>
          		<td>
                <a href="http://localhost:8080/myweb/enterprise/detail?id=${EnterprisePostVO.id}">
                	<c:out value="${EnterprisePostVO.title}"/>
                </a>
     			</td>
     			<td>
     				<c:out value="${EnterprisePostVO.viewCnt}"/>
     			</td>
     			<td>
     				<c:out value="${count}/${EnterprisePostVO.recuitCnt}"/>
     			</td>
     			<td>
            		<input type="button" name="apply_state" value="신청현황보기"/>
            	</td>
            	<td>
            		<input type="button" name="invite_state" value="초대현황보기"/>
            	</td>
		  </tr>
          </c:forEach>
 		</table>
        

      </div>
    </section>

	<%@ include file="../footer.jsp"%>
	
</body>
</html>