<%@ include file="../navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">   

<style>
#modal {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}   
</style>


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
              <span class="text-white"><strong>${EnterprisePost.title}</strong></span>
              <h3>작성자 : ${name}</h3>
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
				
				<!-- Modal -->
				<div id="root">
   					<button type="button" id="modal_opne_btn">모달 창 열기</button>
				</div>

				<div id="modal">
    				<div class="modal_content">

        				<button type="button" id="modal_close_btn">모달 창 닫기</button>


						<!-- content1 : 유튜버 목록  -->
						<div class="content1">
							<form method="post" action="http://localhost:8080/myweb/enterprise/invite/">
								<c:forEach items="${Youtuber}" var="YoutuberVO">
								<div>
									<label><input type="checkbox" name="youtuberID" value=${YoutuberVO.id}>${YoutuberVO.name}</label>
								</div>
								</c:forEach>
								<div>
									<input name="enterID" type="hidden" class="form-control" value=${EnterprisePost.id}>
									<input name="postID" type="hidden" class="form-control" value=${EnterprisePost.id}>
			
									<input type="submit" value="Submit">
								</div>
			
							</form>
						</div>	
						
						<!-- content2 : 초대 성공  -->
						<div class="content2">
							<p>초대가 완료되었습니다</p>
						</div>	
						
						<!-- content3 : 초대 실패  -->
						<div class="content3">
							<p>이미 진행중인 초대입니다</p>
						</div>	
						
    				</div>
   
    				<div class="modal_layer"></div>
				</div>

				
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>
</div>
</div>

	<script language="javascript">
	
		// Popup
		function showYoutuber(){
			window.open("./invite/?id=${EnterprisePost.id}", "showYoutuber", "width=400, height=300, left=100, top=50");
		}
		function showApply(){
			window.open("../youtuber/apply/?id=${EnterprisePost.id}", "showApply", "width=400, height=800, left=100, top=50");
		}

		// Modal 
		document.getElementById("modal_opne_btn").onclick = function() {
        	document.getElementById("modal").style.display="block";
    	}
   
    	document.getElementById("modal_close_btn").onclick = function() {
        	document.getElementById("modal").style.display="none";
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