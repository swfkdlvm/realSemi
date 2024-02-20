<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%
   String ctxPath = request.getContextPath();
    //     /MyMVC     
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/msh.css/event/event.css"/>
<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/header.css"/>
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
	$(document).ready(function(){
   
    $("body > div:nth-child(6) > button").click(function() {
    	const URL = 'eventmain.bk';
    	// 페이지 리다이렉션을 수행합니다.
    	window.location.href = URL;
    	// 여기에 추가 작업을 수행할 수 있습니다.
    	});

    });
	
	function redirectToOtherPage() {
	    window.location.href = "<%= ctxPath%>/login/loginIndex.bk"; // "목표페이지의URL"을 실제 페이지의 URL로 바꿔주세요.
	}	
	
   </script>



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
 
 <%--헤더 밑 라벨 시작 --%>
 <div class="black_label">
 	<div class="event_label">
 		<a href="#"><span>HOME</span></a> 
 		<span> >&nbsp;이벤트</span>
 		<span> >&nbsp;전체</span>
 	</div>
 </div>
 
 
 <div class="event_head">
 	<span>이벤트</span>
 </div>
 
 <button type="button"><p>${pvo.eventitle}</p> <p style="font-size:16pt; color:silver; ">${pvo.eventdate}</p></button>



<body>
	<div>
 		<img src="<%= ctxPath%>/image/${requestScope.pvo.eventimgdetail}" />
    </div>

	
	<div style="margin-top:300px;">
		<hr style="border: solid 1px black;">
		<button> 목록보기 </button>
	</div>
	
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
