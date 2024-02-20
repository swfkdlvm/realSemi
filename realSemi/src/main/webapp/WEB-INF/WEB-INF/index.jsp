<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /tempSemi
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세미 프로젝트</title>
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/index.css"/>

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<%-- 직접만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/index.js"></script>

<script type="text/javascript">

function redirectToOtherPage() {
	
    window.location.href = "http://localhost:9090/tempSemifinal/login/loginIndex.bk"; // "목표페이지의URL"을 실제 페이지의 URL로 바꿔주세요.
}
</script>

</head>
<body>

<%--헤더 시작 --%>

<header id="header" class="fixed-top">
        <div class="header-container">
            <h1 class="logo">
                <a href="<%= ctxPath%>/index.bk"><img src="<%= ctxPath%>/image/logo.png"/></a>
            </h1>
            
            <nav class="nav">
            <ul class="gnb">
                <li><a href="#">메뉴소개</a>
                    <ul class="sub">
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=1">스페셜팩</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=2">신제품</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=3">프리미엄</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=4">와퍼</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=5">치킨버거</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=6">사이드</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=7">음료</a></li>
                    </ul>
                </li>
                
                <li><a href="#">이벤트</a>
                     <ul class="sub">
                        <li><a href="<%=ctxPath%>/eventmain.bk">이벤트</a></li>
                        
                    </ul>
                </li>
                <li><a href="#">브랜드스토리</a>
                     <ul class="sub">
                        <li><a href="<%=ctxPath%>/brand/brandstory1.bk">BRAND</a></li>
						<li><a href="<%=ctxPath%>/brand/brandstory2.bk">WHOPPER</a></li>
						<li><a href="<%=ctxPath%>/brand/brandstory3.bk">COMM.</a></li>
                    </ul>
                </li>
                
                <li><a href="#">고객센터</a>
                     <ul class="sub">
                        <li><a href="<%=ctxPath%>/shop/storeLocation.bk">매장찾기</a></li>
                        <li><a href="<%=ctxPath%>/CustomerService/NoticeList.bk">게시판</a></li>
                       
                    </ul>
                </li>
            </ul>
            <button type="button" onclick="redirectToOtherPage()">딜리버리 주문</button>
            </nav>
        </div>
        <div class="hd_bg"></div>
    </header>
    
 <%--헤더 끝 --%>   
 <%--캐러셀 시작 --%>
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  
  
  
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%= ctxPath%>/image/배너1.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
    <div class="carousel-item">
      <img src="<%= ctxPath%>/image/배너2.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
    <div class="carousel-item">
      <img src="<%= ctxPath%>/image/배너3.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
  </div>
  
  
  
  
  <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
  <%--캐러셀 끝 --%>
  
  <%--유튜브 시작 --%>
</div>
	<iframe width="100%" height="500" src="https://www.youtube.com/embed/RGCXBjVG8ug?si=wLQcD0CcWTCWeUTP" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
  <%--유튜브 끝 --%>
  
  <%--배너 2개 시작 --%>
  <div class="banner">
  	<div>
	  <a href="<%=ctxPath %>/csc/app.bk"><img src="<%= ctxPath%>/image/배너5.png" style="background-color:rgb(199,161,134);"/></a><a href="#"><img src="<%= ctxPath%>/image/배너6.png" style="background-color:rgb(176,137,114);"/></a>
  	</div>
  </div>
  <%--배너 2개 끝 --%>
  
  <%--탑 버튼 시작 --%>
  <a href="#" class="btn_top" style="opacity: 1; display: inline;">Top</a>
  <%--탑 버튼 끝 --%>
  
  <%--매장 찾기 시작 --%>
  <div class="find_shop">
  	<div class="find_shop_write1">
  		<span>매장찾기</span>
  	</div>
  	
  	<div class="find_shop_write2">
  		<span>고객님 주변에 있는 버거킹을 찾아보세요!</span>
  	</div>
  
  	<div class="find_shop_write3">
  		<button type="button" class="find_shop_button" onclick="location.href='<%=ctxPath%>/shop/storeLocation.bk'">매장찾기</button>
  	</div>
  	
  	<div class="find_shop_write4">
			<ul class="find_shop_write4_ul">
				<li><img src="<%= ctxPath%>/image/딜리버리.gif"/>
					<span>집에서 편안하게</span>
					<span>받을 수 있는</span>
					<span>딜리버리</span>
				</li>
				
				<li><img src="<%= ctxPath%>/image/킹오더.gif"/>
					<span>미리 주문하고</span>
					<span>픽업가능한</span>
					<span>킹오더</span>
				</li>
				
				<li><img src="<%= ctxPath%>/image/드라이브스루.gif"/>
					<span>차안에서 빠르게</span>
					<span>이용할 수 있는</span>
					<span>드라이브 스루</span>
				</li>
				
				<li><img src="<%= ctxPath%>/image/24시간.gif"/>
					<span>24시간 언제든</span>
					<span>함께할 수 있는</span>
					<span>24시간</span>
				</li>
				
				<li><img src="<%= ctxPath%>/image/아침메뉴.gif"/>
					<span>든든한</span>
					<span>아침을 도와줄</span>
					<span>아침메뉴</span>
				</li>
				
				<li><img src="<%= ctxPath%>/image/주차.gif"/>
					<span>내 차와 함께</span>
					<span>올 수 있는</span>
					<span>주차공간</span>
				</li>
			
			</ul>

		</div>
  
  </div>
  
  
  
  
  
  
  
  
  
  <%--유튜브 페이스북 인스타 시작 --%>
  <div class="yfi">
  	<div class="yfi_logo">
  		<div class="yfi_logo_sub"  onclick="window.open('https://www.youtube.com/channel/UCEKRI0fipK4LEgV98nI2CQA/featured')">
	  	<img src="<%= ctxPath%>/image/유튜브로고.png"/>
			<ul>
			  	<li>YOUTUBE</li>
			  	<li><img src="<%= ctxPath%>/image/유튜브구독표시.png"/>구독 4.9만</li>
			</ul>
		</div>
		
		<div class="yfi_logo_sub" onclick="window.open('https://www.facebook.com/burgerkingkorea')">	
	  	<img src="<%= ctxPath%>/image/페이스북로고.png"/>
		  	<ul>
			  	<li>FACEBOOK</li>
			  	<li><img src="<%= ctxPath%>/image/페이스북좋아요표시.png"/>좋아요 47.8만</li>
			</ul>
		</div>	
		
		<div class="yfi_logo_sub" onclick="window.open('https://www.instagram.com/burgerkingkorea/')" >
		<img src="<%= ctxPath%>/image/인스타로고.png"/>
			<ul>
			  	<li>INSTAGRAM</li>
			  	<li><img src="<%= ctxPath%>/image/인스타팔로우표시.png"/>팔로워74.9K</li>
			</ul>
		</div>	
		
  	 </div>
  </div>
  <%--유튜브 페이스북 인스타 끝 --%>
  
  
  
  
  
  <%--밑에 메뉴 시작 --%>
 <div class="main_bottom_container">
      <ul class="main_bottom">
          <li><a href="#"><span class="main_bottom_main">메뉴</span></a>
              <ul class="main_bottom_sub">
                  <li><a href="<%= ctxPath%>/category/special.bk">스페셜팩</a></li>
                  <li><a href="<%= ctxPath%>/category/new.bk">신제품</a></li>
                  <li><a href="<%= ctxPath%>/category/premium.bk">프리미엄</a></li>
                  <li><a href="<%= ctxPath%>/category/whopper.bk">와퍼</a></li>
                  <li><a href="<%= ctxPath%>/category/chickenbugger.bk">치킨버거</a></li>
                  <li><a href="<%= ctxPath%>/category/side.bk">사이드</a></li>
                  <li><a href="<%= ctxPath%>/category/drink.bk">음료</a></li>
              </ul>
          </li>
          <li><a href="#"><span class="main_bottom_main">매장</span></a>
               <ul class="main_bottom_sub">
                  <li><a href="#">매장찾기</a></li>
                 
              </ul>
          </li>
          <li><a href="#"><span class="main_bottom_main">이벤트</span></a>
               <ul class="main_bottom_sub">
                  <li><a href="">이벤트</a></li>
                  
              </ul>
          </li>
          <li><a href="#"><span class="main_bottom_main">브랜드스토리</span></a>
               <ul class="main_bottom_sub">
                  <li><a href="#">BRAND</a></li>
				  <li><a href="#">WHOPPER</a></li>
				  <li><a href="#">COMM.</a></li>
              </ul>
          </li>
          <li><a href="#"><span class="main_bottom_main">고객센터</span></a>
               <ul class="main_bottom_sub">
                  <li><a href="#">공지사항</a></li>
				  <li><a href="#">FAQ</a></li>
				  <li><a href="#">문의</a></li>
              </ul>
          </li>
          
      </ul>
</div>
 <%--밑에 메뉴 끝 --%>
  
  <%--푸터 시작--%>
  <div id="footer">
         <hr style="width: 65%; background-color: rgb(187,163,141);">
         <div id="ftcontent">
            <img id="bgk" src="<%= ctxPath%>/image/bgk.png">
            <p class="lastp" style="padding-top: 20px;">서울 종로구 삼봉로 71 G 타워 4F,5F 주식회사 비케이알  전화주문 1599-0505</p>
            <p class="lastp">사업자 등록번호 101-86-76277  (주)BKR 대표이사 이동형</p>
            <p class="lastp">Copyright 2019 BKR Co., Ltd. All right Reserved</p>
            <div style="position: absolute; bottom: 70%; left: 70%;">
               <a href="#" class="lasta">이용약관</a>&nbsp;&nbsp;
               <a href="#" class="lasta">개인정보처리방침</a>&nbsp;&nbsp;
               <a href="#" class="lasta">법적고지</a>
            </div>
         </div>
      </div>
  
  
  
  
</body>
</html>