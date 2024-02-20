<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
    
<%
    String ctxPath = request.getContextPath();
    //    /tempSemi
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>딜리버리</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script type="text/javascript" src="<%= ctxPath%>/msh.js/delivery.js"></script>

<style>
#navtbl > tbody > tr > td:nth-child(1){
	position:relative;
	right:300px;
}
@font-face {
    font-family: dabanggu;
    font-weight: 400;
    src: url(../font/Typo_DabangguB.ttf) format("woff2"),url(../font/Typo_DabangguB.ttf) format("woff")
}

body{
	font-family: dabanggu;
}

div#rlcontainer {
	
    background-position: center;
}

div#container {
	display: flex;
}

div#container div {
	text-align: center;
	width: auto;
	margin: auto;
}

table.ordcrt {
	width: 400px;
	height: 100px;
	font-size: 16pt;
}


ul#leftbar {
	margin-left:16.5%;
}

ul#rightbar {
	margin-right: 16.5%;
}

table.ordcrt > tbody > tr > td {
	font-size: 16pt;
	text-align: left;
}

table.ordcrt > tbody > tr > td.smtd {
	font-size: 13pt;
}

table#firsttbl {
	margin-left: 11.5%;
	
}

table#secondtbl {
	margin: 0 -40%;
	
}

div#content {
	width: 65%;
	margin: 20px auto; 
}



div#item > ul > li {
	display: inline;
}





div#caution div {
	display: inline-block;
}

div#caution > div:first-child {
	margin-right: 65%;
	font-size: 17pt;
	font-weight: bold;
}

div#caution > div:nth-child(2) {
	font-size: 13pt;
	font-weight: bold;
	cursor: pointer;
}

div#caution > ul {
	border: solid 0px orange;
	padding-left: 2%;
}

a.nav-item {
	font-size: 11pt;
	text-decoration: none;
	margin-left: 15px;
	color: white;
}

table#navtbl {
	margin: 10px auto;
	width: 66.5%;
	color: white;
}

table#navtbl > tbody > tr:first-child > td {
	text-align: right;
	padding-bottom: 20px;
	font-size: 11pt;
}

table#navtbl > tbody > tr:nth-child(2) > td:first-child {
	font-size: 25pt;
	font-weight: bolder;
} 

div#container {
	padding-top: 200px !important;
}

div#footer {
	margin-top: 45px;
	width: 100%;
	height: 230px;
	background-color: rgb(43, 2, 0);
}

div#ftcontent {
	color: white;
	width: 65%;
	padding-top: 20px;
	margin: auto;
	position: relative;
}

p.lastp {
	margin: 0;
}

a.lasta {
	text-decoration: none;
	color: white;
}

.logout {
	border:none;
	color:white;
	background-color: rgb(226,34,25);
}

#menu_container {
	font-family: dabanggu;
}

</style>


<script type="text/javascript">

$(document).ready(function(){

	cartCount()
	
	
});//end of $(document).ready(function(){

function cartListAdd(pnum){
	
	$.ajax({
        url: "<%= ctxPath%>/NonMemberOrder/Nonmember_cartListAdd.bk",
        type: "post",
        data: {"pnum": pnum, "ordernum":${nvo.ordernum} }, 
        dataType: "json",
        success: function(json) {
			
			if(json.n == 1) {
					
				redirectToCartList();
			 
		 	}
			
		},
		
		error: function(request, status, error){
        	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        }      
      
	});
}	
	
function redirectToCartList() {
    var form = $('<form action="<%= ctxPath%>/NonMemberOrder/Nonmember_cartList.bk" method="post"></form>');

    form.append('<input type="hidden" name="ordernum" value="' + '${nvo.ordernum}' + '">');
    
    $('body').append(form);
    form.submit();
}	
	

</script>
</head>
<body>
	
	<%-- 헤더시작 --%>
	
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top" style="background-color: rgb(226, 34, 25); height: 180px;">
		
		<table id="navtbl">
			<tbody>
			<c:if test="${sessionScope.loginuser !=null and sessionScope.loginuser.userid =='admin'}"> <%--admin 으로 로그인 했으면 --%>
				<tr>
					<td colspan="2">
						<a class="nav-item" href="<%= ctxPath%>/index.bk">브랜드홈</a>
						<a class="nav-item" href="<%= ctxPath%>/member/adminIndex.bk">관리자 페이지</a>
					</td>
				</tr>
				</c:if>
				
				<c:if test="${sessionScope.loginuser !=null and sessionScope.loginuser.userid !='admin'}">
				<tr>
					<td colspan="2">
						<a class="nav-item" href="<%= ctxPath%>/index.bk">브랜드홈</a>
						<a class="nav-item" href="#">고객센터</a>
					</td>
				</tr>
				</c:if>
				
				<tr>
					<td><img alt="deliveryLogo" src="<%= ctxPath%>/image/deliverylogo.png"> 딜리버리</td>
					<td>
						<table style="margin-left: auto;">
							<tr>
								<td rowspan="2"><img alt="man" src="<%= ctxPath%>/image/man.png" style="padding-right: 10px;"></td>
								<td>주문번호 ${nvo.ordernum}</td>
							</tr>
							<tr>
								<td><a href="<%= ctxPath%>/member/mypage.bk?userid=${(sessionScope.loginuser).userid}" style="text-decoration:none; color:white;">MY킹 바로가기  ></a></td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</nav>
	<%-- 헤더끝 --%>
	
	<div id= "rlcontainer">
	
		<div id= "container" class="container-fluid p-4 text-white" style="background-color: #333332;">
			<div>
				<table id="firsttbl" class="ordcrt">
					<tbody>
						<tr>
							<td rowspan="2"><a class="navbar-brand" href="#"><img alt="deliveryLogo" src="<%= ctxPath%>/image/bike.png"></a></td>
							<td style="font-weight: bold">배달비용</td>
						</tr>
						<tr>
							<td class="smtd">배달비용은 3000원이 추가됩니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<span style="border-left: solid 1px white;"></span>
			<div>
				<table id="secondtbl" class="ordcrt">
					<tbody>
						<tr>
							<td rowspan="2"><img alt="deliveryLogo" src="<%= ctxPath%>/image/cart.png"></td>
							<td style="font-weight: bold">비회원 딜리버리 서비스!</td>
						</tr>
						<tr>
							<td class="smtd">카트에 담은 메뉴를 금방 배달 해드립니다</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: black;">
			  <ul id="leftbar" class="navbar-nav mr-auto">
			      <li class="nav-item">
			          <a class="nav-link text-white" href="#">딜리버리</a>
			      </li>
			      <li class="nav-item">
			          <a class="nav-link text-white" href="#">>&nbsp;&nbsp;&nbsp;&nbsp;메뉴</a>
			      </li>
			  </ul>
			  <ul id="rightbar" class="navbar-nav ml-auto">  
			      <li class="nav-item">
			          <a class="nav-link disabled text-white" href="#" tabindex="-1" aria-disabled="true">기본주소 : ${nvo.address} ${nvo.detailaddress} ${nvo.extraaddress}</a>
			      </li>
			  </ul>
		</nav>
		
		<%-- 본문 콘텐츠 시작 --%>
		
		<div class="container pt-3" id="menu_container">
		<span style="font-size: 27pt; font-weight: bold; margin-left:20%;">메뉴</span>
		
		<%-- 카테고리 json 쏴주는 부분 --%>
		<div id="categoryList" style="display:inline-block; margin-left:100px; padding-bottom:50px;"></div>
		<%-- 지운부분 --%>
		</div>	


		<div id="menuList" class="container" style="width:100%">
		</div>	

			
		<div id="caution">
			<div style="font-weight: bold;">유의사항</div>
				<div style="font-weight: bold;"><i class="fa-solid fa-circle-info"></i>&nbsp;&nbsp;원산지, 영양성분, 알레르기 유발성분 ></div>
					<hr style="border: solid 1.5px black;">
					<ul>
						<li>매장별 주문금액이 상이하니, 반드시 최소금액을 확인하기 바랍니다.</li>
						<li>배달 소요시간은 기상조건이나 매장 사정상 지연 또는 제한될 수 있습니다.</li>
						<li>고객님과 수 차례 연락을 시도한 후 연락이 되지 않는 경우 배달음식이 변질되거나 부패될 우려로 식품위생법상 위반될 여지가 있어 별도로 보관 하지 않으며, <span style="font-weight: bold;">재배달 또는 환불처리가 어려울 수 있습니다.</span></li>
						<li>딜리버리 서비스 메뉴의 가격은 매장 가격과 상이하며, 딜리버리 시 타쿠폰을 사용하실 수 없습니다. (일부품목 배달 제외)</li>
						<li>배달 제품은 매장 행사(할인가격)에서 제외됩니다.</li>
						<li>제품 가격 및 메뉴 구성은 본사 사정상 변경될 수 있습니다.</li>
						<li>대량 주문의 경우 콜센터(1599-0505)주문으로만 가능합니다.</li>
						<li>주문 완료 후 변경 및 취소는 콜센터(1599-0505)에서만 가능합니다.</li>
					</ul>
			</div>
		</div>
	
		<div id="footer">
			<hr style="width: 65%; background-color: white;">
			<div id="ftcontent">
				<img id="bgk" src="<%= ctxPath%>/image/bgk.png">
				<p class="lastp" style="padding-top: 20px;">서울 종로구 삼봉로 71 G 타워 4F,5F 주식회사 비케이알  전화주문 1599-0505</p>
				<p class="lastp">사업자 등록번호 101-86-76277  (주)BKR 대표이사 이동형</p>
				<p class="lastp">Copyright 2019 BKR Co., Ltd. All right Reserved</p>
				<div style="position: absolute; bottom: 70%; left: 76%;">
					<a href="#" class="lasta">이용약관</a>&nbsp;&nbsp;
					<a href="#" class="lasta">개인정보처리방침</a>&nbsp;&nbsp;
					<a href="#" class="lasta">법적고지</a>
				</div>
			</div>
		</div>
	
</body>
</html>