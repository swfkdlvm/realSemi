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
<title>아이디찾기</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/login/pwdSearch.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script type="text/javascript">
	$(document).ready(function(){
		
		const method = "${requestScope.method}";
		//	console.log("확인용 method :", method);
		/*
			확인용 mthod : GET
			확인용 mthod : POST
		*/
		
		if(method == "GET") {
			$("div#div_findResult").hide();
		}
		
		else if(method =="POST") {
			$("input:text[name='userid']").val("${requestScope.userid}");
			$("input:text[name='email']").val("${requestScope.email}");
		}
		
		$("button#findPWD").click(function(){
			goFind();
		});// end of $("button.btn-success").click(function(){})---------
		
		
		$("input:text[name='email']").bind("keyup", function(e){
			
			if(e.keyCode == 13) {
				goFind();
			}
			
		});
		
		// === 인증하기 버튼 클릭 시 이벤트 처리해주기 === //
		$("button.btn-info").click(function() {
			
			const input_confirmCode = $("input:text[name='input_confirmCode']").val().trim();
			
			if(input_confirmCode == "") {
				alert("인증코드를 입력하세요!!");
				return; // 종료
			}
			
			const frm = document.verifyCertificationFrm;
			frm.userCertificationCode.value = input_confirmCode;
			frm.userid.value = $("input:text[name='userid']").val();
			
			frm.action = "<%= ctxPath%>/login/verifyCertification.bk";
			frm.method = "post";
			frm.submit();
		});
		
	});// end of $(document).ready(function(){})-------------------------
	
	
	// Function Declaration
	function goFind() {
		
		const userid = $("input:text[name='userid']").val().trim();
		const email = $("input:text[name='email']").val().trim();
		
		if(userid == "" || email == "") {
			alert("아이디와 이메일 모두 입력하세요!!");
			return; // 종료
		}
		else {
			const frm = document.pwdFindFrm;
			frm.action = "<%= ctxPath%>/login/pwdSearch.bk";
			frm.method = "post";
			frm.submit();
		}
		
	}// end of function goFind()-------------------------- 
	
</script>

</head>
<body>

	<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: black;">
		  <!-- Links 추가하기 -->
		  <ul id="leftbar" class="navbar-nav mr-auto">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="#">딜리버리</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="#">>&nbsp;&nbsp;&nbsp;&nbsp;로그인</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="#">>&nbsp;&nbsp;&nbsp;&nbsp;아이디/비밀번호 찾기</a>
		    </li>
		  </ul>
		</nav>
		
	<!-- 본문 콘텐츠 시작 -->
	
	<div id="content">
		<div id="item">
			<div class="my-4" style="font-size: 29pt; font-weight: bold; margin: 20px 0;">아이디/비밀번호 찾기</div>
			<form name="pwdFindFrm">
				<a class="py-2" href="<%= ctxPath%>/login/idSearch.bk" style="font-size: 16pt; font-weight: bold; color: silver; text-decoration: none;">
					아이디 찾기
				</a>&nbsp;&nbsp;&nbsp; 
				<a class="py-2" href="#" style="font-size: 16pt; font-weight: bold; color: rgb(226, 34, 25); border-bottom: solid 2px rgb(226, 34, 25); text-decoration: none;">
					비밀번호 찾기
				</a>
				<table class="mt-4" id="pwtbl">
					<tr>
						<td class="pl-5" colspan="2">회원님의 정보(이메일)로 비밀번호 재설정을 위한 경로를 보내드립니다.</td>
					</tr>
					<tr>
						<td class="pl-5">아이디</td>
						<td>
							<input id="userid" name="userid" type="text" placeholder="아이디" autocomplete="off" style="border: none;" />
						</td>
					</tr>
					<tr>
						<td class="pl-5">이메일 주소</td>
						<td>
							<input id="email" name="email" type="text" placeholder="이메일 주소" autocomplete="off" style="border: none;" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="my-3 text-center" id="div_findResult">
								<c:if test="${requestScope.isUserExist eq false}">
									<span style="color: red;">사용자 정보가 없습니다.</span>
								</c:if>

								<c:if
									test="${requestScope.isUserExist eq true && requestScope.sendMailSuccess eq true}">
									<%-- 유저정보가 일치하고 메일도 보내졌다면, --%>
									<span style="font-size: 10;"> 인증코드가
										${requestScope.email}로 발송되었습니다.<br> 인증코드를 입력해주세요.
									</span>
									<br>
									<input type="text" name="input_confirmCode" />
									<br>
									<br>
									<button type="button" class="btn btn-info">인증하기</button>
								</c:if>

								<c:if
									test="${requestScope.isUserExist eq true && requestScope.sendMailSuccess eq false}">
									<%-- 유저정보는 일치하지만 메일이 발송되지 않았다면 --%>
									<span style="color: red;">메일발송이 실패했습니다.</span>
								</c:if>
							</div>
						</td>
					</tr>
				</table>
				<div id="btndiv">
					<button id="findPWD" type="button" onclick="goFind()">
						비밀번호 찾기
					</button>
				</div>
			</form>

			<%-- 인증하기 form --%>
			<form name="verifyCertificationFrm">
				<input type="hidden" name="userCertificationCode" /> <input
					type="hidden" name="userid" />
			</form>

		</div>
	</div>

</body>
</html>