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
<title>로그인</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/login/loginIndex.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script type="text/javascript" src="<%= ctxPath%>/pys.js/login/loginIndex.js"></script>
<script type="text/javascript">
$(document).ready(function(){
/////////////////////////////////////////////////
	  // === 로그인을 하지 않은 상태일 때 
	  //     로컬스토리지(localStorage)에 저장된 key가 'saveid' 인 userid 값을 불러와서 
	  //     input 태그 userid 에 넣어주기 ===
		 if(${empty sessionScope.loginuser}) {
			// alert("헤헤헤~~~");
			
			 const loginUserid = localStorage.getItem('saveid');
			 
			 if(loginUserid != null) {
				 $("input#loginUserid").val(loginUserid);
				 $("input:checkbox[id='saveid']").prop("checked", true);
			 }
			
		 }
		
	
	
});// end of $(document).ready(function(){})------------------

function toggleImage() {
	    var image1 = document.getElementById('image1');
	    var image2 = document.getElementById('image2');
	    var pwd = $("input#loginPwd");
	    
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
	
	
	
	function memberRegister() {
		window.location.href ="http://localhost:9090/tempSemi/member/memberRegister.bk";
	}
	
	
	
</script>

</head>
<body>
	
	<%-- 헤더시작 --%>
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top" style="background-color: rgb(226, 34, 25); height: 180px;">
		
		<table id="navtbl">
			<tbody>
				<tr>
					<td colspan="2">
						<a class="nav-item" href="<%= ctxPath%>/index.bk">브랜드홈</a>
						<a class="nav-item" href="#">로그인</a>
						<a class="nav-item" href="#">고객센터</a>
					</td>
				</tr>
				<tr>
					<td><img alt="deliveryLogo" src="<%= ctxPath%>/image/deliverylogo.png"> 버거킹</td>
					<td style="text-align: right;">
						<div style="padding-right: 20px;">
							<button type="button" style="width: 160px; height: 50px; border-radius: 30px; background-color: rgb(81, 35, 20); border: none; color: white; font-size: 15pt; font-weight: bold;" onclick="memberRegister()">회원가입</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</nav>
	<%-- 헤더끝 --%>
	
	<div id= "rlcontainer">
		
		<nav id="navpd" class="navbar navbar-expand-sm navbar-dark" style="background-color: black; padding-top: 190px !important;">
			  <!-- Links 추가하기 -->
			  <ul id="leftbar" class="navbar-nav mr-auto">
			    <li class="nav-item">
			      <a class="nav-link text-white" href="#">HOME</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-white" href="#">>&nbsp;&nbsp;&nbsp;&nbsp;로그인</a>
			    </li>
			  </ul>
			</nav>
		
		<!-- 본문 콘텐츠 시작 -->
		
		<div id="content" style="padding-left: 200px;">
			<div id="item">
				<div style="color: rgb(215, 35, 0); font-size: 29pt; font-weight: bold; line-height: 120px;">YOUR WAY</div>
				<div style="font-size: 29pt; font-weight: bold;">어서오세요! 버거킹입니다.</div>
			
			<form name="loginFrm" action="<%= ctxPath%>/login/login.bk" method="post">
				<table id="loginTbl">
					<tbody>
						<tr>
							<td><img alt="" src="<%= ctxPath%>/image/key.png"></td>
							<td><strong>로그인</strong></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text" name="userid" id="loginUserid" size="30" placeholder="아이디" style="border: none;" autocomplete="off" /></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input type="password" name="pwd" id="loginPwd" size="30" placeholder="비밀번호" style="border: none;" />
								<div style="position:relative; top:7%; display: inline-block;">
       								<img id="image1" src="<%= ctxPath%>/image/invisible.png" onclick="toggleImage()" style="display: block;">
       								<img id="image2" src="<%= ctxPath%>/image/visible.png" onclick="toggleImage()" style="display: none;">
   								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input type="checkbox" id="saveid" />&nbsp;<label class="checkbox" for="saveid">아이디저장</label>
								<input type="checkbox" id="autoLogin" />&nbsp;<label class="checkbox" for="autoLogin">자동 로그인</label>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><button type="button" id="btnSubmit" style="background-color: rgb(215, 35, 0);">로그인</button>
								<button type="button" id="btnRegister" style="background-color: rgb(81, 35, 20);" onclick="memberRegister()">회원가입</button>
							</td>
						</tr>
						<%-- ==== 아이디 찾기, 비밀번호 찾기 --%>
						<tr>
							<td></td>
							<td><a class="find" style="cursor: pointer;">아이디찾기</a>&nbsp;&nbsp;<a class="find" style="cursor: pointer;">비밀번호찾기</a></td>
						</tr>
					</tbody>
				</table>
			</form>
			
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
	
	</div>
</body>
</html>