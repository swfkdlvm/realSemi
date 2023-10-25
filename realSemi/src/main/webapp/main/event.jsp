<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지</title>
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/event.css"/>

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<%-- 직접만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/event.js"></script>
</head>
<body>

<%--헤더 시작 --%>

<header id="header" class="fixed-top">
        <div class="header-container">
            <h1 class="logo">
                <a href="#"><img src="<%= ctxPath%>/image/logo.png"/></a>
            </h1>
            
            <nav class="nav">
            <ul class="gnb">
                <li><a href="#">메뉴소개</a>
                    <ul class="sub">
                        <li><a href="#">스페셜&amp;할인팩</a></li>
                        <li><a href="#">신제품(NEW)</a></li>
                        <li><a href="#">프리미엄</a></li>
                        <li><a href="#">와퍼&amp;주니어</a></li>
                        <li><a href="#">치킨&amp;슈림프버거</a></li>
                        <li><a href="#">올데이킹&amp;킹모닝</a></li>
                        <li><a href="#">사이드</a></li>
                        <li><a href="#">음료&amp;디저트</a></li>
                    </ul>
                </li>
                <li><a href="#">매장소개</a>
                     <ul class="sub">
                        <li><a href="#">매장찾기</a></li>
                       
                    </ul>
                </li>
                <li><a href="#">이벤트</a>
                     <ul class="sub">
                        <li><a href="">이벤트</a></li>
                        
                    </ul>
                </li>
                <li><a href="#">브랜드스토리</a>
                     <ul class="sub">
                        <li><a href="#">BRAND</a></li>
						<li><a href="#">WHOPPER</a></li>
						<li><a href="#">COMM.</a></li>
                    </ul>
                </li>
                
            </ul>
            <button>딜리버리 주문</button>
            </nav>
        </div>
        <div class="hd_bg"></div>
    </header>
    
 <%--헤더 끝 --%>   
 
 <%--헤더 밑 라벨 시작 --%>
 <div class="black_label">
 	<div class="event_label">
 		<a href="#"><span>HOME</span></a> 
 		<span> >&nbsp;이벤트</span>
 	
 	</div>
 </div>
 <%--헤더 밑 라벨 끝 --%>
 
 
 <div class="event_head">
 	<span>이벤트</span>
 </div>
 
 <%--이벤트 바디부분 --%>
 <div class="event">
 	<div class="event_banner">
	 	<img src="<%= ctxPath%>/image/이벤트배너1.png"/>
	 	<img src="<%= ctxPath%>/image/이벤트배너2.png"/>
	 	<img src="<%= ctxPath%>/image/이벤트배너3.png"/>
	 	<img src="<%= ctxPath%>/image/이벤트배너4.png"/>
	 	<img src="<%= ctxPath%>/image/이벤트배너5.png"/>
	 	<img src="<%= ctxPath%>/image/이벤트배너6.png"/>
	 	
	 	
 	</div>
 </div>
 
  <%--밑에 메뉴 시작 --%>
 <div class="main_bottom_container">
      <ul class="main_bottom">
          <li><a href="#"><span class="main_bottom_main">메뉴</span></a>
              <ul class="main_bottom_sub">
                  <li><a href="#">스페셜&amp;할인팩</a></li>
                  <li><a href="#">신제품(NEW)</a></li>
                  <li><a href="#">프리미엄</a></li>
                  <li><a href="#">와퍼&amp;주니어</a></li>
                  <li><a href="#">치킨&amp;슈림프버거</a></li>
                  <li><a href="#">올데이킹&amp;킹모닝</a></li>
                  <li><a href="#">사이드</a></li>
                  <li><a href="#">음료&amp;디저트</a></li>
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