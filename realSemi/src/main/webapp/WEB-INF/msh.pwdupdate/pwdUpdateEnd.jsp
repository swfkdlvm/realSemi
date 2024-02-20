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
	<header id="header" class="fixed-top">
        <div class="header-container">
            <h1 class="logo">
                <a href="<%= ctxPath%>/index.bk"><img src="<%= ctxPath%>/image/logo.png"/></a>
            </h1>
            
            <nav class="nav">
            <ul class="gnb">
                <li><a href="#">메뉴소개</a>
                    <ul class="sub">
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=1">스페셜팩</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=2">신제품</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=3">프리미엄</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=4">와퍼</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=5">치킨버거</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=6">사이드</a></li>
                        <li><a href="<%= ctxPath%>/category/special.bk?cnum=7">음료</a></li>
                    </ul>
                </li>
                
                <li><a href="#">이벤트</a>
                     <ul class="sub">
                        <li><a href="<%=ctxPath%>/eventmain.bk">이벤트</a></li>
                        
                    </ul>
                </li>
                <li><a href="#">브랜드스토리</a>
                     <ul class="sub">
                        <li><a href="<%=ctxPath%>/brand/brandstory1.bk">BRAND</a></li>
						<li><a href="<%=ctxPath%>/brand/brandstory2.bk">WHOPPER</a></li>
						<li><a href="<%=ctxPath%>/brand/brandstory3.bk">COMM.</a></li>
                    </ul>
                </li>
                
                <li><a href="#">고객센터</a>
                     <ul class="sub">
                        <li><a href="<%=ctxPath%>/shop/storeLocation.bk">매장찾기</a></li>
                        <li><a href="<%=ctxPath%>/CustomerService/NoticeList.bk">게시판</a></li>
                       
                    </ul>
                </li>
            </ul>
            <button type="button" onclick="redirectToOtherPage()">딜리버리 주문</button>
            </nav>
        </div>
        <div class="hd_bg"></div>
    </header>
	
		
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