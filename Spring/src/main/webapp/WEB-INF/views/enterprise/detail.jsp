<%@ include file="../navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">   

<body>
    <!-- HOME -->
    	<!-- Main -->
<div id="page">
		
	<!-- Main -->
	<div id="main" class="container">
    <section class="section-hero overlay inner-page bg-image" style="background-image: url('http://localhost:8080/myweb/post/getImage?name=home.jpg');" id="home-section">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="text-white font-weight-bold">Product Designer</h1>
            <div class="custom-breadcrumbs">
              <a href="/myweb/">Home</a> <span class="mx-2 slash">/</span>
              <a href="/myweb/post/list/">Recipes</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>${EnterprisePost.title }</strong></span>
            </div>
          </div>
        </div>
      </div>
    </section>

    
    <section class="site-section">
      <div class="container">
        <div class="row align-items-center mb-5">
            <div class="d-flex align-items-center">
              <div class="border p-2 d-inline-block mr-3 rounded">
                <img src="getImage?name=${EnterprisePost.image}" style="width:450px;height:300px;"/>
              </div>
              <div>
              </div>
            </div>
        </div>
        <div class="row">
          <div class="col-lg-8">
          	<div class="mb-5">
          	<h2>${EnterprisePost.title }</h2>
          	<!--  
          	<a href="javascript:;" id="kakao-link-btn"> 
			<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
			</a>
			-->
          	</div>
          	
            <div class="mb-5">
              <h3 class="h5 d-flex align-items-center mb-4 text-primary"></h3>
     		  <p>${EnterprisePost.recuitCnt}</p>
            </div>
            <div class="mb-5">
              <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span></h3>
              <ul class="list-unstyled m-0 p-0">  
          		<c:forEach items="${detail}" var="detail">
                <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span><c:out value="${detail}"/></span></li>
              	</c:forEach>
              </ul>
            </div>
            
            
            
            <div class="row mb-5">
              <div class="col-6">
                <a href="/myweb/enterprise/update?id=${EnterprisePost.id}" class="btn btn-block btn-light btn-md"></span>Update</a>
              </div>
              <div class="col-6">
                <a href="/myweb/enterprise/delete?id=${EnterprisePost.id}" class="btn btn-block btn-primary btn-md">Delete</a>
              </div>
              <div class="col-6">

				<input type="button" value="초대하기" onclick="showYoutuber();"/>
				<input type="button" value="신청하기" onclick="showApply();"/>

			
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>


    <section class="bg-light pt-5 testimony-full">
        
        <div class="owl-carousel single-carousel">

        
          <div class="container">
            <div class="row">
              <div class="col-lg-6 align-self-center text-center text-lg-left">
                <blockquote>
                  <p>&ldquo;Soluta quasi cum delectus eum facilis recusandae nesciunt molestias accusantium libero dolores repellat id in dolorem laborum ad modi qui at quas dolorum voluptatem voluptatum repudiandae.&rdquo;</p>
                  <p><cite> &mdash; Corey Woods, @Dribbble</cite></p>
                </blockquote>
              </div>
              <div class="col-lg-6 align-self-end text-center text-lg-right">
                <img src="images/person_transparent_2.png" alt="Image" class="img-fluid mb-0">
              </div>
            </div>
          </div>

          <div class="container">
            <div class="row">
              <div class="col-lg-6 align-self-center text-center text-lg-left">
                <blockquote>
                  <p>&ldquo;Soluta quasi cum delectus eum facilis recusandae nesciunt molestias accusantium libero dolores repellat id in dolorem laborum ad modi qui at quas dolorum voluptatem voluptatum repudiandae.&rdquo;</p>
                  <p><cite> &mdash; Chris Peters, @Google</cite></p>
                </blockquote>
              </div>
              <div class="col-lg-6 align-self-end text-center text-lg-right">
                <img src="images/person_transparent.png" alt="Image" class="img-fluid mb-0">
              </div>
            </div>
          </div>

      </div>

    </section>
</div>
</div>


	<script language="javascript">
		function showYoutuber(){
			window.open("./invite/?id=${EnterprisePost.id}", "showYoutuber", "width=400, height=300, left=100, top=50");
		}
	</script>
		<script language="javascript">
		function showApply(){
			window.open("../youtuber/apply/?id=${EnterprisePost.id}", "showApply", "width=400, height=800, left=100, top=50");
		}
	</script>
	
<script type="text/javascript">
  //<![CDATA[
    // // ì¬ì©í  ì±ì JavaScript í¤ë¥¼ ì¤ì í´ ì£¼ì¸ì.
    Kakao.init('da6041ce783f51ed6ff2481a1fa4210c');
    // // ì¹´ì¹´ì¤ë§í¬ ë²í¼ì ìì±í©ëë¤. ì²ì íë²ë§ í¸ì¶íë©´ ë©ëë¤.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: 'ì ëª©',
        description: 'ë´ì©, ì£¼ë¡ í´ìíê·¸',
        imageUrl: 'http://localhost:8080/myweb/post/getImage?name=p123-01.jpg',
        link: {
          webUrl:'http://localhost:8080',
          mobileWebUrl: 'http://localhost:8080'
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: 'Open!',
          link: {
            mobileWebUrl: 'http://localhost:8080',
            webUrl:'http://localhost:8080'
          }
        }  
      ]
    });
  //]]>
</script>
</body>
</html>