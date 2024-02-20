<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 주문</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/kjy.css/member/memberRegister.css"/>

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">


<style>
body > form > div > h1{
	margin-left:740px;
	font-size:40px;
	font-family: dabanggu;
}

body > form > div > button{
	position:relative;
	top:70px;
	right:320px;
}



body > form {
	height:270px;
}

#footer,
body > div.main_bottom_container{
	position:relative;
	top:400px;
}


body > form > div{
	height:100px;
}
</style>

<script type="text/javascript">


//Function Declaration
//"가입하기" 버튼 클릭시 호출되는 함수
function goOrder() {

	const frm = document.registerFrm;
	frm.action = "NonMember_deliverycart.bk";
	frm.method = "post";
	frm.submit();
	
}// end of function goRegister()----------------------

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
	               </td>
	            </tr>
	            <tr>
	               <td><img alt="deliveryLogo" src="<%= ctxPath%>/image/deliverylogo.png"> 버거킹</td>
	               <td>
	                  <table style="margin-left: auto;">
	                     <tr>
	                        <td><button type="button" class="register_btn">회원가입</button></td>
	                     </tr>
	                     <tr>
	                        
	                     </tr>
	                  </table>
	               </td>
	            </tr>
         	</tbody>
      	</table>
   </nav>
   
   
   <%-- 헤더끝 --%>
   <div class="label">
       <span>HOME&nbsp;></span>
       <span>딜리버리&nbsp;></span>
       <span>로그인&nbsp;></span>
       <span>비회원 주문&nbsp;</span>
   </div>
   	
   
   	
   	
   	<form name="registerFrm">
	   	<div class="register">
			<h1 style="height:100px;">인증이 완료되었습니다!</h1>
			<br> 
			<input type="hidden" name="ordernum" id="ordernum" value="${nvo.ordernum}" style='width: 10%; font-size: small;' />
			<input type="hidden" name="address" id="address" value="${nvo.address}" style='width: 10%; font-size: small;' />
			<input type="hidden" name="detailaddress" id="detailaddress" value="${nvo.detailaddress}" style='width: 10%; font-size: small;' />
			<input type="hidden" name="extraaddress" id="extraaddress" value="${nvo.extraaddress}" style='width: 10%; font-size: small;' />
			<button type="button" class="register_btn" onclick="goOrder()" style="width:200px; height:100px; font-size:25px;">다음단계로 이동</button>
		</div>
	</form>
   	
<jsp:include page="../footer.jsp" /> 