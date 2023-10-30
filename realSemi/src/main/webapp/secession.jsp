<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /tempSemi
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/cart/secession.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script type="text/javascript">
	
	
</script>

</head>
<body>

	<!-- 상단 메뉴바 시작 -->

	<div id= "rlcontainer">
		<div id= "container" class="container-fluid p-4 text-white" style="background-color: #333332;">
			<div>
				<table id="firsttbl" class="ordcrt">
					<tbody>
						<tr>
							<td rowspan="2"><a class="navbar-brand" href="#"><img alt="" src="<%= ctxPath%>/image/bike.png"></a></td>
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
							<td rowspan="2"><img alt="" src="<%= ctxPath%>/image/cart.png"></td>
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
			    <li class="nav-item">
			      <a class="nav-link text-white">>&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴</a>
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
			
		<!-- 본문 콘텐츠 시작 -->
		
		<div id="content">
			<div id="item">
				<div style="font-size: 29pt; font-weight: bold; margin: 20px 0;">회원탈퇴</div>
				<form>
				
					<div style="font-size: 15pt; font-weight: bold;"><img alt="" src="<%= ctxPath%>/image/bell.png">&nbsp;&nbsp;회원 탈퇴시 유의사항</div>
					<table id="defaultInfo" style="margin-bottom: 0;">
						<tr style="background-color: gray">
							<td>아래의 유의사항을 반드시 확인하세요.</td>
						</tr>
						<tr>
							<td>
								<ul>
									<li>회원 탈퇴한 날로부터 90일 이후 회원가입이 가능합니다.</li>
									<li>탈퇴 시 고객님의 정보는 전자상거래 상에서의 소비자 보호 법률에 의거한 버거킹의 개인정보보호정책에 따라 관리됩니다.</li>
									<li>탈퇴 시 고객님의 개인정보 및 쿠폰 정보는 모두 삭제되어 더 이상 혜택을 받을 수 없으며, 재가입 이후에도 복구가 불가합니다.</li>
									<li>탈퇴 후 어떠한 방법으로도 기존의 개인정보를 복원할 수 없습니다.(단 결제 내역은 5년까지 보관)</li>
									<li>삭제되는 기록은 다음과 같습니다.<br>- 휴대폰번호, MY배달지, 멤버십, 쿠폰, 주문이력</li>
								</ul>
							</td>
						</tr>
					</table>
						
					
					<div style="font-size: 15pt; font-weight: bold;" class="mt-4"><img alt="" src="<%= ctxPath%>/image/minusprofile.png">&nbsp;&nbsp;선택정보</div>
					<table id="optionalInfo">
						<tr>
							<td style="text-align: center;">
								<select style="width: 700px;">
									<option>개인정보보호</option>
									<option>사이트이용불만</option>
								</select>
							</td>
						</tr>
					</table>
					
					<div style="font-size: 15pt; font-weight: bold;"><i class="fa-solid fa-user fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;계정확인</div>
					<table id="marketing">
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>chambit94@naver.com</td>
						</tr>
					</table>
					
					<div style="float: right;">
						<input class="mr-4" id="mktEmail" type="checkbox" /><label for="mktEmail">위 내용을 확인하였으며, 버거킹 탈퇴를 합니다.</label>
					</div>
					<div id="btndiv">
						<button type="reset">취소</button>
						<button type="button">변경</button>
					</div>
					
				</form>
			</div>
		</div>

	</div>
</body>
</html>