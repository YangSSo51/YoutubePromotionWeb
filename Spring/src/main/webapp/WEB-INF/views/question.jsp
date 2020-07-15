<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<body>
<div id="page">
	<div class="container">
	<h2>고객문의</h2>
	<h3>QR코드</h3>
	<a href='http://m.site.naver.com/0Cmwa'><img src='https://qrcodethumb-phinf.pstatic.net/20200715_237/1594796812025dshC5_PNG/0Cmwa.png'/></a>
	<h3>홈 URL : https://pf.kakao.com/_AxoUxmxb</h3>
	<!--  
    <a href="javascript:;" id="kakao-link-btn"> 
		<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
	</a>
	-->
	
	</div>    
</div>
</body>
<script type="text/javascript">
  //<![CDATA[
    // // ì¬ì©í  ì±ì JavaScript í¤ë¥¼ ì¤ì í´ ì£¼ì¸ì.
    Kakao.init('da6041ce783f51ed6ff2481a1fa4210c');
    // // ì¹´ì¹´ì¤ë§í¬ ë²í¼ì ìì±í©ëë¤. ì²ì íë²ë§ í¸ì¶íë©´ ë©ëë¤.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: '카카오톡 문의하기',
        description: '오아영에게 질문하세요',
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
<%@ include file="footer.jsp"%>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.16.0/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
</html>