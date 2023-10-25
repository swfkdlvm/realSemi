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
<title>세미 프로젝트</title>
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/header.css"/>

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<%-- 직접만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/header.js"></script>


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

  
</body>
</html>