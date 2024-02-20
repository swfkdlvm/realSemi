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
<title>관리자 페이지</title>
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/msh.css/admin/productregister.css"/>

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<style type="text/css">
   table#tblProdInput {border: solid gray 1px; 
                       border-collapse: collapse; }
                       
   table#tblProdInput td {border: solid gray 1px; 
                          padding-left: 10px;
                          height: 50px; }
                          
   .prodInputName {background-color: #e6fff2; 
                    font-weight: bold; }                                                 
   
   .error {color: red; font-weight: bold; font-size: 9pt;}

</style>


</head>
<body>
	<nav class="navbar navbar-expand-sm"  style="padding-left:100px;">
		 
		<a class="navbar-brand pl-5" href="#"><img src="<%= ctxPath%>/image/logo.png" /></a>
		  
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
	</nav>
	<div id="horizon">
		 <span><a href="<%= ctxPath%>/member/adminIndex.bk">관리자 페이지</a></span>
	</div>


	<div align="center" style="margin-bottom: 20px;">

   <div style="border: solid green 2px; width: 250px; margin-top: 20px; padding-top: 10px; padding-bottom: 10px; border-left: hidden; border-right: hidden;">       
      <span style="font-size: 24pt;">제품등록에 성공!</span>   
   </div>
   <br/>


</body>
</html>