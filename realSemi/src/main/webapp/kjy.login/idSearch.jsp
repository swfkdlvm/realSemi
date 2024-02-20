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
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/kjy.css/login/idSearch.css" />

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
	

	if(method =="POST") {
		$("input:text[name='name']").val("${requestScope.name}");
		$("input:text[name='mobile']").val("${requestScope.mobile}");
	}
	
	$("input:text[name='mobile']").bind("keyup", function(e){
		
		if(e.keyCode == 13) {
			goFind();
		}
		
	});

});

//Function Declaration
function goFind() {
	
	const name = $("input:text[name='name']").val().trim();
	const mobile = $("input:text[name='mobile']").val().trim();
	
	if(name == "") {
		alert("성명을 입력하세요!!");
	}
	
	if(mobile == "") {
		alert("핸드폰 번호를 입력하세요!!");
		return; // 종료
	}
	
	else {
		const frm = document.idFindFrm;
		frm.action = "<%= ctxPath%>/login/idSearch.bk";
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
				<form name="idFindFrm">
					<a class="py-2" href="#" style="font-size: 16pt; font-weight: bold; color: rgb(226, 34, 25); border-bottom: solid 2px rgb(226, 34, 25); text-decoration: none;">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
					<a class="py-2" href="<%= ctxPath%>/login/pwdSearch.bk" style="font-size: 16pt; font-weight: bold; color: silver; text-decoration: none;">비밀번호 찾기</a>
					<table class="mt-4" id="pwtbl">
						<tr>
							<td class="pl-5" colspan="2">가입시 회원정보로 등록한 이름과 휴대폰 번호를 입력해 주세요.</td>
						</tr>
						<tr>
							<td class="pl-5">
								이름
							</td>
							<td>
								<input id="name" name="name" type="text" placeholder="이름" autocomplete="off" style="border: none;" />
							</td>
						</tr>
						<tr>
							<td class="pl-5">
								휴대폰 번호
							</td>
							<td>
								<input id="mobile" name="mobile" type="text" placeholder="휴대폰 번호" autocomplete="off" style="border: none;" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<ul class="pl-5">
									<%-- <li style="font-size: 12pt;">가입 시 입력한 이름과 휴대폰번호로 아이디 정보를 찾을 수 있습니다.</li> --%>
									<c:if test="${requestScope.userid != null}">
										<div id="resultDiv">${requestScope.userid}</div>
									</c:if>
								</ul>
							</td>
						</tr>
					</table>
					<div id="btndiv">
						<button id="findID" type="button" onclick="goFind()">아이디 찾기</button>
					</div>
				</form>
		</div>
	</div>

</body>
</html>