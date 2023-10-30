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
<title>메뉴정보 목록</title>
    
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/template/template.js"></script>

<style type="text/css">

@font-face {
    font-family: dabanggu;
    font-weight: 400;
    src: url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff2"),url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff")
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
	<nav class="navbar navbar-expand-sm">
  		<ul class="nav justify-content-center">
    		<li class="nav-item">
      			<a class="nav-link disabled" href="#">메뉴소개</a>
    		</li>
    		<li class="nav-item pt-3">
      			<a class="nav-link" href="<%= ctxPath%>/category/special.bk">스페셜팩</a>
    		</li>
    		<li class="nav-item pt-3">
      			<a class="nav-link" href="<%= ctxPath%>/category/new.bk">신제품</a>
    		</li>
    		<li class="nav-item pt-3">
      			<a class="nav-link" href="#" style="color: #E3242B; text-decoration: underline 3px;">프리미엄</a>
    		</li>
    		<li class="nav-item pt-3">
      			<a class="nav-link" href="<%= ctxPath%>/category/whopper.bk">와퍼</a>
    		</li>
    		<li class="nav-item pt-3">
      			<a class="nav-link" href="<%= ctxPath%>/category/chickenbugger.bk">치킨버거</a>
    		</li>

    		<li class="nav-item pt-3">
      			<a class="nav-link" href="<%= ctxPath%>/category/side.bk">사이드</a>
    		</li>
    		<li class="nav-item pt-3">
      			<a class="nav-link" href="<%= ctxPath%>/category/drink.bk">음료</a>
    		</li>
  		</ul>
	</nav>
		
	<div class="container text-center">
	  <div class="row">
	    <div class="col-sm-3">
	      <div class="image-frame p-3">
	        <a href="#"><img height="150px" src="<%= ctxPath%>/image/premium/오리지널스 페퍼잭 더블.png"></a>
	      </div>
	      <p><a href="#">오리지널스 페퍼잭 더블</a></p>
	    </div>
	    <div class="col-sm-3">
	      <div class="image-frame p-3">
	        <a href="#"><img height="150px" src="<%= ctxPath%>/image/premium/오리지널스 페퍼잭 싱글.png"></a>
	      </div>
	      <p><a href="#">오리지널스 페퍼잭 싱글</a></p>
	    </div>
	    <div class="col-sm-3">
	      <div class="image-frame p-3">
	        <a href="#"><img height="150px" src="<%= ctxPath%>/image/premium/블랙바비큐콰트로치즈와퍼.png"></a>
	      </div>
	      <p><a href="#">블랙바비큐콰트로치즈와퍼</a></p>
	    </div>
	    <div class="col-sm-3">
	      <div class="image-frame p-3">
	        <a href="#"><img height="150px" src="<%= ctxPath%>/image/premium/블랙바비큐와퍼.png"></a>
	      </div>
	      <p><a href="#">블랙바비큐와퍼</a></p>
	    </div>
	    <div class="col-sm-3">
	      <div class="image-frame p-3">
	        <a href="#"><img height="150px" src="<%= ctxPath%>/image/premium/몬스터와퍼.png"></a>
	      </div>
	      <p><a href="#">몬스터와퍼</a></p>
	    </div>
	    <div class="col-sm-3">
	      <div class="image-frame p-3">
	        <a href="#"><img height="150px" src="<%= ctxPath%>/image/premium/몬스터X.png"></a>
	      </div>
	      <p><a href="#">몬스터X</a></p>
	    </div>
	    <div class="col-sm-3">
	      <div class="image-frame p-3">
	        <a href="#"><img height="150px" src="<%= ctxPath%>/image/premium/통새우와퍼.png"></a>
	      </div>
	      <p><a href="#">통새우와퍼</a></p>
	    </div>
	  </div>
	</div>
	
	<div class="bottom-margin" style="background-color:white; height:100px;"></div>
	
<jsp:include page="../footer.jsp" />
