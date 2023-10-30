<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /tempSemi
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호확인</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/cart/pwConfirm.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script type="text/javascript">
	
	function toggleImage() {
	    var image1 = document.getElementById('image1');
	    var image2 = document.getElementById('image2');
	    var pwd = $("input#pwd");
	    
	    if (image2.style.display === 'none') {
	        image2.style.display = 'block';
	        image1.style.display = 'none';
	        pwd.attr("type", "text");
	    } else {
	        image2.style.display = 'none';
	        image1.style.display = 'block';
	        pwd.attr("type", "password");
	    }
	}
	
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
							<td rowspan="2"><img  alt="deliveryLogo" src="<%= ctxPath%>/image/cart.png"></td>
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
			
		<!-- 본문 콘텐츠 시작 -->
		
		<div id="content">
			<div id="item">
				<div style="font-size: 29pt; font-weight: bold; margin: 20px 0;">회원 정보 변경</div>
					<form>
						<div style="font-size: 15pt; font-weight: bold;"><i class="fa-solid fa-user fa-lg" style="color: #000000;"></i>&nbsp;&nbsp;기본정보</div>
						<table id="pwtbl">
							<tr>
								<td colspan="2">안전한 개인정보 보호를 위해 버거킹 회원 비밀번호를 한 번 더 입력해 주세요.</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>chambit94@naver.com</td>
							</tr>
							<tr>
								<td>현재 비밀번호</td>
								<td>
									<input style="font-weight: bold; border: none;" id="pwd" type="password" placeholder="현재 비밀번호" size="40px" />
									<div style="position:relative; top:7%; display: inline-block;">
        								<img id="image1" src="<%= ctxPath%>/image/invisible.png" onclick="toggleImage()" style="display: block;">
        								<img id="image2" src="<%= ctxPath%>/image/visible.png" onclick="toggleImage()" style="display: none;">
    								</div>
								</td>
							</tr>
						</table>
						<div id="btndiv">
							<button type="reset">취소</button>
							<button type="button">완료</button>
						</div>
					</form>
			</div>
		</div>

	</div>
</body>
</html>