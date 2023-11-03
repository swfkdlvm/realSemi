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
<title>메뉴정보 상세</title>
    
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
<script type="text/javascript" src=""></script>

<style type="text/css">
@font-face {
    font-family: dabanggu;
    font-weight: 400;
    src: url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff2"),url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff")
}

div#bgDiv {
	width: 100%;
	border: solid 0px blue;
}

div#inner-contents {
	border: solid 0px red;
	padding-top: 110px;
}

table {
	border: solid 0px orange;
	width: 60%;
	margin:auto;
}

table > tbody > tr:first-child > td {
	font-family: dabanggu;
}

body > nav:nth-child(1) > ul {
	position: relative;
	left: 300px;
}

body > nav:nth-child(3) > ul > li.nav-item {
	position: relative;
	left: 300px;
}

body > nav:nth-child(3) > ul > li:nth-child(2) > button {
	width: 310px;
	height: 40px;
	border-radius: 10px;
	font-weight: bold;
	position: relative;
	left: 900px;
}

body > nav:nth-child(3) > ul > li.nav-item > a {
	font-family: dabanggu;
}

body > nav:nth-child(3) > ul > li:nth-child(2) > button {
	font-family: dabanggu;
}

body > nav:nth-child(3) > ul > li:nth-child(2) > button > img {
	padding-bottom: 2.7px;
}


/* modal css */
h4.modal-title {
	font-family: dabanggu;
}

div.modal-body {
	background-color: #F2EBE6;
	padding: 40px;
}

div.modal-body > div:first-child {
	border: solid 0px blue;
	background-color: white;
	padding: 40px;
	border-radius: 10px;
	
	margin-bottom: 20px;
}

div.modal-body > div:nth-child(2) {
	border: solid 0px blue;
	background-color: white;
	padding: 40px;
	border-radius: 10px;
}

div.modal-body h6 {
	font-family: dabanggu;
	color: #490206;
	
}

div.modal-body span {
	font-family: dabanggu;
	color: #490206;
	
}

div.modal-body p {
	font-weight: bold;
	color: #490206;
	
}

div#bgDiv {
	background-image: url("<%= ctxPath%>/image/menuDetailBG.png");
	background-size: cover;
	height: 450px;
}

</style>

<script type="text/javascript">
	$(document).ready(function(){
		 
	}); // end of $(document).ready(function(){
</script>

</head>
<body>

	<%-- 상단 메뉴바 1 --%>
	<nav class="navbar navbar-expand-sm" style="background-color: black;">
	  <ul class="navbar-nav pl-5">
	    <li class="nav-item">
	      <a class="nav-link text-white font-weight-bold" href="#">HOME</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white" href="#">></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white font-weight-bold" href="#">메뉴소개</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white" href="#">></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white font-weight-bold" href="#">${requestScope.pvo.categvo.cname}</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white" href="#">></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white font-weight-bold" href="#">${requestScope.pvo.pname}</a>
	    </li>
	  </ul>
	</nav>
	<%-- 상단 메뉴바 1 끝--%>
	
		
	<div id="bgDiv">
		<div id="inner-contents">
			<table>
				<tr>
					<td valign="bottom"><p style="margin-top:50px; text-align: left; font-size: 50px; color: white;">${requestScope.pvo.pname}<p></td>
					<td rowspan="2"><img height="300px" src="<%= ctxPath%>/image/${requestScope.pvo.pimage}"></td>
				</tr>
				<tr>
					<td><p style="margin-bottom:50px; text-align: left; font-size: 22px; color: white; font-weight: bold;">${requestScope.pvo.pcontent}<p></td>
				</tr>
			</table>
		</div>
	</div>
	
		<%-- 하단바 --%>
	<nav class="navbar navbar-expand-sm bg-dark">
	  <ul class="navbar-nav pl-5">
	    <li class="nav-item">
	      <a class="nav-link text-white" href="#" onclick="javascript:history.back()"> &lt;&nbsp;&nbsp;&nbsp;메뉴목록으로 돌아가기</a>
	    </li>
	    <li>
	    	<button type="button" data-toggle="modal" data-target="#exampleModal_scrolling_2" style="margin-left: auto;">원산지, 영양성분, 알레르기 유발성분&nbsp;<img height="20px" src="<%= ctxPath%>/image/bangpae.png"></button>
	    	<div class="modal fade" id="exampleModal_scrolling_2">
			  <div class="modal-dialog modal-dialog-scrollable modal-lg">
			  <!-- .modal-dialog-scrollable을 .modal-dialog에 추가하여 페이지 자체가 아닌 모달 내부에서만 스크롤할 수 있습니다. -->
			    <div class="modal-content">
			      
			      <!-- Modal header -->
			      <div class="modal-header">
			        <h4 class="modal-title">원산지, 영양성분, 알레르기 유발성분</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			      
			      <!-- Modal body -->
			      	<div class="modal-body">
		                <div>
		                	<h6>원산지</h6>
		                	<p>
			                	<img height="50px" src="<%= ctxPath%>/image/cow.png">
			                	<span>쇠고기</span><br>
			                	• 호주산과 뉴질랜드산 섞음 : 와퍼/버거패티 (주니어포함)<br>
			                	• 호주산과 뉴질랜드산 섞음 : 몬스터X<br>
			                	• 국내산(한우) : 오리지널스페퍼잭싱글, 오리지널스페퍼잭더블
			                	<br><br>
			                	<img height="50px" src="<%= ctxPath%>/image/pig.png">
			                	<span>돼지고기</span><br>
			                	• 미국산 : 베이컨
			                	<br><br>
			                	<img height="50px" src="<%= ctxPath%>/image/chicken.png">
			                	<span>닭고기</span><br>
			                	• 국내산 : 너겟킹<br>
			                	• 태국산과 국내산 섞음 : 롱치킨버거<br>
			                	• 국내산과 태국산 섞음 : 몬스터X, 몬스터와퍼, (바비큐)치킨버거<br>
			                	• 외국산 : 치킨킹, 치킨킹BLT, 바삭킹
		                	</p>
		                </div>
		                <div>
		                	<h6>안내사항</h6>
		                	<p>
		                	1.&nbsp;각 제품은 원재료의 수급 상황에 따라 구성성분이 다소 변경될 수도 있습니다.<br><br>
							2.&nbsp;표시된 영양성분표는 매장에서 판매되고 있는 모든 제품의 영양성분을 포함하지 못할 수도 있습니다.(신제품/ 특정계절 한시판매 제품/ 일부 매장 특별 판매 제품)<br><br>
							3.&nbsp;표시된 영양 구성성분은 실험방법 등에 따라 차이가 있을 수도 있습니다.<br><br>
							4.&nbsp;영양표 속의 모든 제품은 표준 용량이며, 실제 제공시 다소 차이가 있을 수 있습니다.<br><br>
							5.&nbsp;괄호안 %는 1일 영양소 기준치에 대한 비율입니다.<br><br>
							6.&nbsp;아이스 아메리카노, 아메리카노는 고카페인 함유 음료로 어린이, 임산부, 카페인 민감자는 섭취에 주의해 주시기 바랍니다.<br><br>
							7.&nbsp;판매되는 일부 메뉴는 밀, 대두, 우유, 돼지고기, 토마토, 닭고기, 쇠고기, 조개류, 난류, 게, 새우, 땅콩, 복숭아, 아황산류, 호두, 오징어, 잣 알레르기 유발 가능성이 있음을 안내드립니다.
		                	</p>
				        </div>
	            	</div>
			    </div>
			  </div>
			</div>
	    </li>
	  </ul>
	</nav>
	
	<!-- 하단 메뉴상세 -->
	<div class="container" style="border: solid 0px orange; width: 100%; height: 500px">
	  	<div style="padding-top: 80px; text-align: center; border: solid 0px lime;"><img height="200px" src="<%= ctxPath%>/image/${requestScope.pvo.pimage}"></div>
		<div style="padding-top: 20px; margin-top: 15px; border: solid 0px red;"><p style="text-align: center; font-size: 30px;">${requestScope.pvo.pname}<p></div>
		<div style="margin-top: 15px; border: solid 0px red;"><p style="text-align: center; font-size: 20px; font-weight: bold;">${requestScope.pvo.pdetail}<p></div>
	</div>
	
<jsp:include page="../footer.jsp" />