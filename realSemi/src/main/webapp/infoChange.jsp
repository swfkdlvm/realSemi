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
<title>정보변경</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/cart/infoChange.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("button#mobileChange").bind("click", function(e){
            $("div#mobile").toggle();

            var buttonText = $(e.target).text();

            if(buttonText === '변경') {
                $(e.target).text('취소');
            }
            else {
                $(e.target).text('변경');
            }
        });
		
	});
	
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
				<span style="font-size: 24pt; font-weight: bold; padding-right: 240px;">김진영 님! 반갑습니다!</span>
				<a class="mda" href="#"><i class="fa-solid fa-user fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;정보변경</a>
				<a class="mda" href="#"><i class="fa-solid fa-cart-shopping fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;<span style="font-size: 20pt;">MY</span>배달지</a>
				<a class="mda" href="#"><i class="fa-solid fa-clipboard-list fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;주문이력</a>
			</div>
		</div>
			
		<!-- 본문 콘텐츠 시작 -->
		
		<div id="content">
			<div id="item">
				<div style="font-size: 29pt; font-weight: bold; margin: 20px 0;">회원 정보 변경</div>
				<form>
				
					<div style="font-size: 15pt; font-weight: bold;"><i class="fa-solid fa-user fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;기본정보</div>
					<table id="defaultInfo" style="margin-bottom: 0;">
						<tr>
							<td>이메일</td>
							<td>chambit94@naver.com</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>김진영</td>
						</tr>
						<tr>
							<td>핸드폰</td>
							<td>01020552084
								<button class="ml-3" id="mobileChange" type="button" style="border: none; border-radius: 5px; width: 80px; height: 40px; background-color: rgb(81, 35, 20); color: white; font-weight: bold;">변경</button>
							</td>
						</tr>
					</table>
						<div id="mobile" style="display: none; height:80px; width: 100%; border: none; background-color: white; margin: 0 0 20px 0;">
							<input style="border-style: none; margin: 20px 0 0 170px; font-size: 16pt;" type="text" size="30" placeholder="휴대폰 번호를 입력해주세요" />&nbsp;&nbsp;&nbsp;
							<button style="border: none; border-radius: 5px; width: 120px; height: 50px; background-color: rgb(81, 35, 20); color: white; font-weight: bold;" type="button">인증번호 발송</button>
						</div>
						
					
					<div style="font-size: 15pt; font-weight: bold;" class="mt-4"><i class="fa-solid fa-check fa-lg"></i>&nbsp;&nbsp;선택정보</div>
					<table id="optionalInfo">
						<tr>
							<td>성별</td>
							<td>
								<input class="mr-3" id="male" name="gender" type="radio" /><label class="mr-4" for="male">남</label>
								<input class="mr-3" id="female" name="gender" type="radio" /><label class="mr-4" for="female">여</label>
							</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td>
								<select class="mr-3" style="width: 120px;">
									<option>선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
									<c:forEach var="i" begin="0" end="${2023-1908}">
										<c:set var="yearOption" value="${2023-i}" />
										<option value="${yearOption}">${yearOption}년</option>
									</c:forEach>
								</select>
								
								<select class="mr-3" style="width: 120px;">
									<option>선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
									<c:forEach var="i" begin="1" end="12">
										<c:set var="monthOption" value="${i}" />
										<option value="${monthOption}">${monthOption}월</option>
									</c:forEach>
								</select>
								
								<select class="mr-3" style="width: 120px;">
									<option>선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
									<c:forEach var="i" begin="1" end="31">
										<c:set var="dateOption" value="${i}" />
										<option value="${dateOption}">${dateOption}월</option>
									</c:forEach>
								</select>
								
							</td>
						</tr>
					</table>
					
					<div style="font-size: 15pt; font-weight: bold;"><i class="fa-solid fa-check fa-lg"></i>&nbsp;&nbsp;마케팅 정보 수신동의</div>
					<table id="marketing">
						<tr>
							<td><input class="mr-4" id="mktEmail" type="checkbox" checked="checked" /><label for="mktEmail">이메일을 통한 이벤트/ 주문 정보의 수신에 동의합니다.</label></td>
						</tr>
						<tr>
							<td><input class="mr-4" id="mktSms" type="checkbox" checked="checked" /><label for="mktSms">SMS를 통한 이벤트/ 주문 정보의 수신에 동의합니다.</label></td>
						</tr>
					</table>
					
					<div id="btndiv">
						<button type="reset">취소</button>
						<button type="button">변경</button>
					</div>
					
				</form>
				<div style="float: right; font-size: 14pt; font-weight: bold; margin-top: 40px;"><a href="#" style="text-decoration: none; color: black;">회원탈퇴&nbsp;&nbsp;<img style="padding-bottom: 5px;" alt="deliveryLogo" src="<%= ctxPath%>/image/out.png"></a></div>
			</div>
		</div>

	</div>
</body>
</html>