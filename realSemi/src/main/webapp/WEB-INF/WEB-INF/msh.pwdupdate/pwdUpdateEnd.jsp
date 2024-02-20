<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
      
    // 뒤로가기 버튼을 누르면 세션을 삭제한다.
    if (request.getHeader("Referer").equals("/login/loginIndex.bk")) {
        session.invalidate();
        response.sendRedirect("/login/loginIndex.bk");
    }
    
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

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/kjy.css/login/idSearch.css" />


<script type="text/javascript">

$(document).ready(function(){
	
	const method = "${requestScope.method}";
	

	if(method =="POST") {
		$("input:text[name='name']").val("${requestScope.name}");
		$("input:text[name='mobile']").val("${requestScope.mobile}");
	}
	
	$("input:text[name='mobile']").bind("keyup", function(e){
		
		if(e.keyCode == 13) {
			goFind();
		}
		
	});

	$("button.btn-success").click(function() {
		
	
		
	});// end of $("button.btn-success").click()---------------------

});

//Function Declaration
function goFind() {
	
	const pwd  = $("input:password[name='pwd']").val();
	const pwd2 = $("input:password[id='pwd2']").val();
	
	if(pwd != pwd2) {
		alert("암호가 일치하지 않습니다.");
		$("input:password[name='pwd']").val("");
		$("input:password[id='pwd2']").val("");
		return; // 종료
	}
	else {
		
		const regExp_pwd = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
	 	//숫자/문자/특수문자 포함 형태의 8~15자리 이내의 암호 정규표현식 객체 생성
	 	
	 	const bool = regExp_pwd.test(pwd);
		
		if(!bool) {
			//암호가 정규표현식에 위배된 경우
			alert("암호는 8글자 이상 15글자 이하의 영문자, 숫자, 특수기호가 혼합되어야 합니다.");
			$("input:password[name='pwd']").val("");
			$("input:password[id='pwd2']").val("");
			return; // 종료
		}
		else {
			//암호가 정규표현식에 맞는 경우
			const frm = document.idFindFrm;
			frm.action = "<%= ctxPath%>/login/restpasswd.bk";
			frm.method = "post";
			frm.submit();
		}
		
	}
	

}// end of function goFind()-------------------------- 
	
	
	
</script>
<style>

#pwtbl > tbody > tr:nth-child(1) > td{
	padding-right:1px;
	white-space:nowrap;
	background-color:white;
}

</style>



</head>
<body>
	<ul class="navbar-nav">
	    <li class="nav-item pl-5">
	        <a class="nav-link" href="<%= ctxPath%>/index.bk">HOME</a>
	    </li>
	    <li class="nav-item pl-5">
	        <a class="nav-link" href="<%= ctxPath%>/category/special.bk?cnum=1">MENU</a>
	    </li>
	    <li class="nav-item pl-5">
	        <a class="nav-link" href="<%= ctxPath%>/member/memberList.bk">회원목록</a>
	    </li>
	    <li class="nav-item pl-5">
	        <a class="nav-link" href="<%= ctxPath%>/productregister.bk">제품등록</a>
	    </li>
	    <li class="nav-item pl-5">
	        <a class="nav-link" href="<%= ctxPath%>/shop/orderList.bk">회원주문조회</a>
	    </li>
	    <li class="nav-item pl-5">
	    	<a class="nav-link" href="<%= ctxPath%>/NonMemberOrder/NonMemberOrder_orderList.bk">비회원 전체주문조회</a>
	    </li>
	</ul>
	
		
	<!-- 본문 콘텐츠 시작 -->
	
	<div id="content">
		<div id="item">
			<div class="my-4" style="font-size: 29pt; font-weight: bold; margin: 20px 0;">휴면 해제 및 비밀번호 변경</div>
				<form name="idFindFrm">
					<table id="pwtbl">
					
						<tr>
							<td>
								비밀번호
							</td>
							<td>
								<input id="comeuserid" name="comeuserid" type="hidden" value="${requestScope.userid}" />
							</td>
							<td>
								새암호 &nbsp;&nbsp;&nbsp;&nbsp; <input id="pwd" name="pwd" type="password"  />
								<br><br><br>
								암호확인 &nbsp;&nbsp;<input id="pwd2" name="pwd2" type="password"  />
							</td>

						</tr>
						
					</table>
					<div id="btndiv">
						<button id="findID" type="button" onclick="goFind()" style="height:90px;">비밀번호 변경 및 휴면해제</button>
					</div>
				</form>
		</div>
	</div>
</body>
</html>