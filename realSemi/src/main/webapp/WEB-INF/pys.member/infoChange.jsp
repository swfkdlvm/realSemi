<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /tempSemi
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보변경</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 
<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/delivery.css" />
<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/member/infoChange.css" />


<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/member/infoChange.js"></script>



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
			      <a class="nav-link text-white" href="#">딜리버리</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-white" href="#">>&nbsp;&nbsp;&nbsp;&nbsp;MY킹</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-white" href="#">>&nbsp;&nbsp;&nbsp;&nbsp;회원 정보 변경</a>
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
				<span style="font-size: 24pt; font-weight: bold; padding-right: 240px;">${sessionScope.loginuser.name}님! 반갑습니다!</span>
				<a class="mda" href="#"><i class="fa-solid fa-user fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;정보변경</a>
				<a class="mda" href="#"><i class="fa-solid fa-cart-shopping fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;<span style="font-size: 20pt;">MY</span>배달지</a>
				<a class="mda" href="<%=ctxPath %>/shop/orderList.bk"><i class="fa-solid fa-clipboard-list fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;주문이력</a>
			</div>
		</div>
			
		<!-- 본문 콘텐츠 시작 -->
		
		<div id="content">
			<div id="item">
				<div style="font-size: 29pt; font-weight: bold; margin: 20px 0;">회원 정보 변경</div>
				<form name="editFrm">
				
					<div style="font-size: 15pt; font-weight: bold;"><i class="fa-solid fa-user fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;기본정보</div>
					<div style="padding-bottom: 50px;">
					<table id="defaultInfo" style="margin-bottom: 0;">
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" id="email" maxlength="60" class="requiredInfo"  value="${sessionScope.loginuser.email }"/>
	                       <span class="error">이메일 형식에 맞지 않습니다.</span>
	                       <%-- 이메일중복체크 --%>
	                       <span id="emailcheck">이메일중복확인</span>
	                       <span id="emailCheckResult"></span>
	                       </td>
	                       
	                       
						</tr>
						<tr>
							<td>이름</td>
							
							<td>
							<input type="hidden" name="userid" value="${sessionScope.loginuser.userid}"/>
							<input type="text" name="name" id="name" maxlength="30" class="requiredInfo" value="${sessionScope.loginuser.name}" />
	                        <span class="error">성명은 필수입력 사항입니다.</span></td>
						</tr>
						<tr>
							<td>핸드폰</td>
							<td> 
							<input type="text" name="hp1" id="hp1" size="6" maxlength="3" value="010" readonly />&nbsp;-&nbsp; 
	                       	<input type="text" name="hp2" id="hp2" size="6" maxlength="4" value="${fn:substring(sessionScope.loginuser.mobile,3,7)}" />&nbsp;-&nbsp;
	                       	<input type="text" name="hp3" id="hp3" size="6" maxlength="4" value="${fn:substring(sessionScope.loginuser.mobile,7,11)}"/> 
							</td>
						</tr>
						
						<tr>
	                    <td>우편번호</td>
	                    <td>
	                       <input type="text" name="postcode" id="postcode" size="6" maxlength="5" value="${sessionScope.loginuser.postcode}" />&nbsp;&nbsp;
	                       <%-- 우편번호 찾기 --%>
	                       <img src="<%= ctxPath%>/image/b_zipcode.gif" id="zipcodeSearch" />
	                       <span class="error">우편번호 형식에 맞지 않습니다.</span>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td>주소</td>
	                    <td>
	                       <input type="text" name="address" id="address" size="40" maxlength="200" placeholder="주소" value="${sessionScope.loginuser.address}"/><br>
	                       <input type="text" name="detailaddress" id="detailAddress" size="40" maxlength="200" placeholder="상세주소" value="${sessionScope.loginuser.detailaddress}"/>&nbsp;<input type="text" name="extraaddress" id="extraAddress" size="40" maxlength="200" placeholder="참고항목" value="${sessionScope.loginuser.extraaddress}"/>            
	                       <span class="error">주소를 입력하세요.</span>
	                    </td>
	                </tr>
					</table>
					</div>
						
						
					
					
					
					
					
					
					<div id="btndiv">
						<button type="reset" onclick="javascript:history.back()">취소</button>
						<button type="button" onclick="goEdit()">변경</button>
					</div>
					
				</form>
				<div style="float: right; font-size: 14pt; font-weight: bold; margin-top: 40px;"><a href="#" style="text-decoration: none; color: black;">회원탈퇴&nbsp;&nbsp;<img style="padding-bottom: 5px;" alt="deliveryLogo" src="<%= ctxPath%>/image/out.png"></a></div>
			</div>
		</div>

	</div>
</body>
</html>