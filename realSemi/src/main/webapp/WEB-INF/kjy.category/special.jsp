<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴정보 목록</title>
    
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/kjy.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/kjy.js/category/special.js"></script>

<style type="text/css">

@font-face {
    font-family: dabanggu;
    font-weight: 400;
    src: url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff2"),url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff");
} 

body > nav:nth-child(2) > ul {
	border: solid 0px blue;
	margin: 2% auto;
}

body > nav:nth-child(2) > ul > li:first-child > a {
	font-size: 38px;
	color: black;
	font-weight: bold;
	font-family: dabanggu;
}

body > nav:nth-child(2) > ul > li > a {
	border: solid 0px red;
	margin: 8px;
	color: lightgrey;
	font-family: dabanggu;
}

body > nav:nth-child(2) > ul > li > a:hover {
	color: black;
}

body > div > div > div > p > a {
	border: solid 0px red;
	font-size: 20px;
	color: black;
	font-family: dabanggu;
}

body > div > div > div > p > a:hover {
	border: solid 0px red;
	font-size: 20px;
	color: black;
	text-decoration: none;
}

#categoryList > a {
	font-size: 15pt;
	text-decoration: none;
	margin-right: 10px;
	color: black;
	font-weight: bold;
}

</style>

</head>
<body>

	<%-- 상단 메뉴바 1 --%>
	<nav class="navbar navbar-expand-sm bg-dark">
	  <ul class="navbar-nav pl-5">
	    <li class="nav-item">
	      <a class="nav-link text-white font-weight-bold" href="<%= ctxPath%>/index.bk">HOME</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white" href="#">></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white font-weight-bold" href="#">메뉴소개</a>
	    </li>
	  </ul>
	</nav>
	
	<%-- 상단 메뉴바 2 --%>
	<div class="container pt-3" id="menu_container">
		<span style="font-size: 27pt; font-weight: bold;">메뉴소개</span>
		
	<%-- 카테고리 json 쏴주는 부분 --%>
	<div id="categoryList" style="display:inline-block; margin-left:100px; padding-bottom:50px;"></div>
	<%-- 카테고리 json 쏴주는 부분 --%>
	
	<%-- 메뉴 json 쏴주는 부분 시작 --%>
	<div id="menuList" class="container" style="width:100%">

	</div>	
	<%-- 메뉴 json 쏴주는 부분 끝 --%>
	
		
</div>	

<jsp:include page="../footer.jsp" />
	
