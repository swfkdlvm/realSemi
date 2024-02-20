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
<title>주문목록</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/member/mypage.css" />
<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/delivery.css" />
<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script type="text/javascript" src="<%= ctxPath%>/pys.js/cart/oderlist.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	cartCount();
	
	
	
	
});
function cartCount(){
	

	$.ajax({
		   url:"<%=ctxPath%>/shop/cartCount.bk",
		   type:"post",
		   data:{"userid":"${sessionScope.loginuser.userid}"},
		   dataType: "json",
		   success:function(json){
			   if(Number(json.cnt) > 0){
				   $("#secondtbl > tbody > tr:nth-child(1) > td:nth-child(2)").html(`<span class='badge badge-pill badge-danger'>현재 장바구니 \${json.cnt}개</span>`);
				   $("#secondtbl > tbody > tr:nth-child(2) > td").html(`<span>\${json.pname} 외 \${Number(json.cnt) - 1}개 </span>`);
			   }
		   
			   
		   },
			   
			   
			 error: function(request, status, error){
	      alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	   }
	});
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
						<a class="nav-item" href="<%= ctxPath%>/login/logout.bk">로그아웃</a>
						<a class="nav-item" href="#">MY킹</a>
						<a class="nav-item" href="<%= ctxPath%>/member/adminIndex.bk">관리자 페이지</a>
					</td>
				</tr>
				</c:if>
				
				<c:if test="${sessionScope.loginuser !=null and sessionScope.loginuser.userid !='admin'}">
				<tr>
					<td colspan="2">
						<a class="nav-item" href="<%= ctxPath%>/index.bk">브랜드홈</a>
						<a class="nav-item" href="<%= ctxPath%>/login/logout.bk">로그아웃</a>
						<a class="nav-item" href="#" style="text-decoration:none; color:white;">MY킹</a>
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
								<td>${(sessionScope.loginuser).name}님 안녕하세요</td>
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

	<!-- 상단 메뉴바 시작 -->

	<div id= "rlcontainer">
		<div id= "container" class="container-fluid p-4 text-white" style="background-color: #333332;">
			<div>
				<table id="firsttbl" class="ordcrt">
					<tbody>
						<tr>
							<td rowspan="2"><a class="navbar-brand" href="#"><img alt="deliveryLogo" src="<%= ctxPath%>/image/bike.png"></a></td>
							<td style="font-weight: bold">딜리버리 주문내역</td>
						</tr>
						<tr>
							<td class="smtd">주문내역이 없습니다.</td>
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
							<td style="font-weight: bold">카트</td>
						</tr>
						<tr>
							<td class="smtd">카트에 담은 상품이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: black;">
			  <!-- Links 추가하기 -->
			  <ul id="leftbar" class="navbar-nav mr-auto">
			    <li class="nav-item">
			      <a class="nav-link text-white" href="<%=ctxPath %>/login/delivery.bk">딜리버리</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-white" href="#">>&nbsp;&nbsp;&nbsp;&nbsp;MY킹</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-white" href="<%=ctxPath %>/shop/orderList.bk">>&nbsp;&nbsp;&nbsp;&nbsp;주문내역</a>
			    </li>
			  </ul>
			  <ul id="rightbar" class="navbar-nav ml-auto">  
			    <li class="nav-item">
			      <a class="nav-link disabled text-white" href="#" tabindex="-1" aria-disabled="true">배달지를 선택하세요</a>
			    </li>
			    <li class="nav-item">
			    	<button id="change" type="button" class="btn btn-light">변경</button>
			    </li>
			  </ul>
			</nav>
			
		<!-- 주문내역 본문 시작 -->
		
		<div id="mdcontent" style="width: 100%; background-color: white; padding: 35px 0;">
			<div style="width: 65.5%; margin: auto;">
				<span style="font-size: 26pt; font-weight: bold;"><strong>MY킹</strong> > 주문내역</span>
				<hr style="border: solid 1.8px black;">
				<span style="font-size: 24pt; font-weight: bold; padding-right: 240px;">${(sessionScope.loginuser).name}님! 반갑습니다!</span>
				<a class="mda" href="<%= ctxPath%>/member/infoChange.bk?userid=${(sessionScope.loginuser).userid}"><i class="fa-solid fa-user fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;정보변경</a>
				<a class="mda" href="#"><i class="fa-solid fa-cart-shopping fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;<span style="font-size: 20pt;">MY</span>배달지</a>
				<a class="mda" href="<%=ctxPath %>/shop/orderList.bk"><i class="fa-solid fa-clipboard-list fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;주문이력</a>
			</div>
		</div>
		
		<!-- 본문 콘텐츠 시작 -->
		
		<div id="content">
			<div id="item">
				<span style="font-size: 20pt; font-weight: bold;">주문내역</span>
				
				<img id="logo" src="<%= ctxPath%>/image/logo_brown.png">
				
			</div>
		</div>

	</div>
</body>
</html>