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
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/kjy.css/login/loginIndex.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script type="text/javascript" src="<%= ctxPath%>/kjy.js/login/loginIndex.js"></script>


<style type="text/css">
#Nonmembers{
	margin-bottom:100px;
	margin-left:450px;
	background:white;
}

#check_search{
	margin-left:450px;
	background-color:#ffffff;
	width:1000px;
	height:150px;
	margin-bottom:100px;
	background:white;
}

#rlcontainer > form > div:nth-child(1),
#rlcontainer > form{
	background-color:#f2ebe6;
}

#Nonmembers > tbody{
	height:150px;
}

#Nonmembers > tbody > tr > td:nth-child(1){
	width:1000px;
}

#rlcontainer > form > div:nth-child(1){
	margin-bottom:120px;
	margin-left:453px;
}

#rlcontainer > form > div:nth-child(1) > a{
	position:relative;
	top:100px;
	
}

#rlcontainer > form > div:nth-child(1) > a:nth-child(1){
	 text-decoration: underline;
	 text-decoration-thickness: 3px;
	 color:red;
	 text-decoration-color: currentColor;
	 cursor: pointer;
}

#rlcontainer > form > div:nth-child(1) > a:nth-child(3){
	 text-decoration: underline;
	 text-decoration-thickness: 3px;
	 color:red;
	 text-decoration-color:currentColor;
	 cursor: pointer;
}

#secondhide{
	color:black;
	cursor: pointer;
}
#secondshow{
	color:black;
	cursor: pointer;
}
#secondshow:hover{
	color:silver;
	cursor: pointer;
}

#rlcontainer > form > div:nth-child(1) > a:nth-child(1):hover{
	color:silver;
	cursor: pointer;
}

#rlcontainer > form > div:nth-child(1) > a:nth-child(2):hover{
	color:silver;
	cursor: pointer;
}

#rlcontainer > form > div:nth-child(1) > a:nth-child(3):hover{
	color:silver;
	cursor: pointer;
}
#refresh,
#ordernum_check,
#non-memberOrder{
	margin-bottom:80px;
	margin-left:780px;
	border-radius:10px;
	font-size:30px;
	width:300px;
	color:white;
	height:70px;
	position:relative;
	bottom:70px;
}

#rlcontainer > form > div:nth-child(3){
	height:50px;
}

#Nonmembers > tbody > tr > td:nth-child(1) > span{
	margin:50px;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
/////////////////////////////////////////////////
	  // === 로그인을 하지 않은 상태일 때 
	  //     로컬스토리지(localStorage)에 저장된 key가 'saveid' 인 userid 값을 불러와서 
	  //     input 태그 userid 에 넣어주기 ===
		 nonmemberselecthide(); 
		  
		 if(${empty sessionScope.loginuser}) {
			
			 const loginUserid = localStorage.getItem('saveid');
			 
			 if(loginUserid != null) {
				 $("input#loginUserid").val(loginUserid);
				 $("input:checkbox[id='saveid']").prop("checked", true);
			 }
			
		 }
		 
		 $("#non-memberOrder").click(function(){
			 window.location.href ="<%= ctxPath%>/NonMemberOrder/Nonmember_Authentication.bk";
		});
		 
		 $("#refresh").click(function(){
			 window.location.href ="<%= ctxPath%>/login/loginIndex.bk";
		}); 
		 
		 
		//비회원 조회하기를 클릭했을때 
			$("#ordernum_check").click(function(){

				let ordernum = $("#ordernum").val().trim();
				
				if(ordernum == ""){
					alert("주문번호를 입력해주세요!");
					return;
				}
				
				let pwd = $("#pwd").val().trim();
				
				if(pwd == ""){
					alert("비밀번호를 입력해주세요!");
					return;
				}
				
				
				$.ajax({
			        url: "<%= ctxPath%>/NonMemberOrder/NonMember_orderListCheck.bk",
			        type: "post",
			        data: {"ordernum": ordernum, "pwd":pwd }, 
			        dataType: "json",
			        success: function(json) {
			        	console.log(json);
							$("#check_search").show();
							$("#Nonmembers").hide();
							$("#ordernum_check").hide();
							$("#refresh").show();
							
							let v_html = "";
							
							 v_html += " <tr style='color:red; text-align:center;'><td> "+ "이름" + "</td>"+"<td>"+"제품명"+"</td>"
				                + "<td>"+"수량"+"</td>"+ "<td>"+"배달완료시간"+"</td><td>" + "배달여부" + "</td></tr>";
				            $.each(json, function (index, item) {
				            	
				            	 let statusText = "";
				            	 let deliverDate = "";
				                 // status에 따라 텍스트 설정
				                 switch (item.status) {
				                     case "0":
				                         statusText = "주문완료";
				                         break;
				                     case "1":
				                         statusText = "배달 중";
				                         break;
				                     case "2":
				                         statusText = "배달완료";
				                         break;
				                     default:
				                         statusText = "문의바람";
				                 }
				            	
				                 if(item.deliverdate == null) {
					             	deliverDate = "배달완료 전";
				                 }
				                 else{ 
					             	deliverDate = item.deliverdate;
				                 }
				                v_html += " <tr style='text-align:center;'><td> "+ item.name + "</td>"+"<td>"+item.pname+"</td>"
				                + "<td>"+item.oqty+"</td>"+ "<td>"+deliverDate+"</td><td>" + statusText + "</td></tr>";
				            });
				      

						   $("#check_search").html(v_html);
					     
					},
					
					error: function(request, status, error){
			         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			      }      

				
			});
		});	
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
		window.location.href ="<%= ctxPath%>/member/memberRegister.bk";
	}
	
	function nonmemberselecthide(){
		$("#Nonmembers").show();
		$("#Nonmemberstext").show();
		$("#non-memberOrder").show();
		$("#Nonmembernum").hide();
		$("#Nonmemberpwd").hide();
		$("#ordernum").hide();
		$("#pwd").hide();
		$("#secondhide").hide();
		$("#rlcontainer > form > div:nth-child(1) > a:nth-child(1)").show();
		$("#rlcontainer > form > div:nth-child(1) > a:nth-child(3)").hide();
		$("#secondshow").show();
		$("#non-memberOrder").show();
		$("#ordernum_check").hide();
		$("#check_search").hide();
		$("#refresh").hide();
	}
	
	function nonmemberselectshow(){
		$("#Nonmemberstext").hide();
		$("#non-memberOrder").hide();
		$("#Nonmembernum").show();
		$("#Nonmemberpwd").show();
		$("#ordernum").show();
		$("#pwd").show();
		$("#secondhide").show();
		$("#rlcontainer > form > div:nth-child(1) > a:nth-child(1)").hide();
		$("#rlcontainer > form > div:nth-child(1) > a:nth-child(3)").show();
		$("#secondshow").hide();
		$("#ordernum_check").show();
		$("#non-memberOrder").hide();
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
						<a class="nav-item" href="<%= ctxPath%>/login/login.bk">로그인</a>
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
							<td>
								<a class="find" style="cursor: pointer;" href="<%= ctxPath%>/login/idSearch.bk">아이디찾기</a>&nbsp;&nbsp;
								<a class="find" style="cursor: pointer;" href="<%= ctxPath%>/login/pwdSearch.bk">비밀번호찾기</a>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			
			</div>

			

		</div>
	<form id="Nonmemberorderfrm">
		<div style="font-size: 14pt;"><a onclick="nonmemberselecthide()">비회원 주문</a><a id="secondhide"onclick="nonmemberselecthide()">비회원 주문</a>&nbsp;&nbsp;
									<a onclick="nonmemberselectshow()">비회원 주문내역</a><a id="secondshow" onclick="nonmemberselectshow()"> 비회원 주문내역</a>
									</div>
		
					<table id="Nonmembers">
						<tr>
							<td>
								<span id="Nonmemberstext">회원가입 없이 비회원으로 주문이 가능합니다.</span>
								<span id="Nonmembernum">주문번호</span><input id="ordernum"></input>
								<span id="Nonmemberpwd">비밀번호</span><input id="pwd" type="password"></input>
							</td>
							<td id="productPrice">
								
							</td>
						</tr>
						
					</table>
				
					<table id="check_search">
						
						
					</table>
				
				<div style="width:100%;">
						<button id="non-memberOrder" class="non-memberOrder" style="background-color: rgb(81,35,20); border: solid 1px;" type="button">
							비회원 주문
						</button>
						<button id="ordernum_check" class="ordernum_check" style="background-color: rgb(81,35,20); border: solid 1px;" type="button">
							조회하기
						</button>
						<button id="refresh" class="refresh" style="background-color: rgb(81,35,20); border: solid 1px;" type="button">
							새로고침
						</button>
			</div>
	</form>
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