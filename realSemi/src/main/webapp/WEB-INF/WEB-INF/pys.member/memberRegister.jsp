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
<title>회원가입</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/member/memberRegister.css"/>

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<%-- 직접만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/member/memberRegister.js"></script>
</head>
<body>
	<%-- 헤더시작 --%>
   <nav class="navbar navbar-expand-sm navbar-dark fixed-top" style="background-color: rgb(226, 34, 25); height: 180px;">
      
      <table id="navtbl">
         <tbody>
            <tr>
               <td colspan="2">
                  <a class="nav-item" href="<%= ctxPath%>/index.bk">브랜드홈</a>
                  <a class="nav-item" href="#">고객센터</a>
               </td>
            </tr>
            <tr>
               <td><img alt="deliveryLogo" src="<%= ctxPath%>/image/deliverylogo.png"> 버거킹</td>
               <td>
                  <table style="margin-left: auto;">
                     <tr>
                        <td></td>
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
   	<span>로그인&nbsp;></span>
   	<span>회원가입&nbsp;></span>
   	<span>상세&nbsp;</span>
   	</div>
   	
   
   	
   	
   	<form name="registerFrm">
   	<div class="register">
	   	<table id="tblMemberRegister">
		   	<thead>
		   		<tr>
		   			<th colspan="2">회원가입</th>
		   		</tr>
		   	</thead>
		   	
		   	<tbody>
		   		<tr>
		   			<td colspan="2"><i class="fa-solid fa-user"></i>기본정보</td>
		   		</tr>
		   		<tr>
		   			<td>성명&nbsp;<span class="star">*</span></td>
                    <td>
                       <input type="text" name="name" id="name" maxlength="30" class="requiredInfo background" autocomplete="off" />
                       <span class="error">성명은 필수입력 사항입니다.</span>
                    </td>
		   		</tr>
		   		
		   		<tr>
                    <td>아이디&nbsp;<span class="star">*</span></td>
                    <td>
                       <input type="text" name="userid" id="userid" maxlength="40" class="requiredInfo background" autocomplete="off" />&nbsp;&nbsp;  
                       <%-- 아이디중복체크 --%>
                       <button type="button" id="idcheck">아이디중복확인</button>
                       <span id="idcheckResult"></span>
                       <span class="error">아이디는 필수입력 사항입니다.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>비밀번호&nbsp;<span class="star">*</span></td>
                    <td>
                       <input type="password" name="pwd" id="pwd" maxlength="15" class="requiredInfo background" />
                       <span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>비밀번호확인&nbsp;<span class="star">*</span></td>
                    <td>
                       <input type="password" id="pwdcheck" maxlength="15" class="requiredInfo background" />
                       <span class="error">암호가 일치하지 않습니다.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>이메일&nbsp;<span class="star">*</span></td>
                    <td>
                       <input type="text" name="email" id="email" maxlength="60" class="requiredInfo background" autocomplete="off" />
                       <span class="error">이메일 형식에 맞지 않습니다.</span>
                       <%-- 이메일중복체크 --%>
                       <button type="button" id="emailcheck">이메일중복확인</button>
                       <span id="emailCheckResult"></span>
                    </td>
                </tr>
                
                <tr>
                    <td>연락처&nbsp;</td>
                    <td>
                       <input type="text" name="hp1" id="hp1" size="6" maxlength="3" value="010" readonly class="background" />&nbsp;-&nbsp; 
                       <input type="text" name="hp2" id="hp2" size="6" maxlength="4" class="background" />&nbsp;-&nbsp;
                       <input type="text" name="hp3" id="hp3" size="6" maxlength="4" class="background" />    
                       <span class="error">휴대폰 형식이 아닙니다.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>우편번호</td>
                    <td>
                       <input type="text" name="postcode" id="postcode" size="6" maxlength="5" class="background" />&nbsp;&nbsp;
                       <%-- 우편번호 찾기 --%>
                       <img src="<%= ctxPath%>/image/b_zipcode.gif" id="zipcodeSearch" />
                       <span class="error">우편번호 형식에 맞지 않습니다.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>주소</td>
                    <td>
                       <input type="text" name="address" id="address" size="40" maxlength="200" placeholder="주소" class="background" /><br>
                       <input type="text" name="detailaddress" id="detailAddress" size="40" maxlength="200" placeholder="상세주소" class="background" />&nbsp;<input type="text" name="extraaddress" id="extraAddress" size="40" maxlength="200" placeholder="참고항목" class="background" />            
                       <span class="error">주소를 입력하세요.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>성별</td>
                    <td>
                       <input type="radio" name="gender" value="1" id="male" /><label for="male" style="margin-left: 1.5%;">남자</label>
                       <input type="radio" name="gender" value="2" id="female" style="margin-left: 10%;" /><label for="female" style="margin-left: 1.5%;">여자</label>
                    </td>
                </tr>
                
                <tr>
                    <td>생년월일</td>
                    <td>
                       <input type="text" name="birthday" id="datepicker" maxlength="10" autocomplete="off" class="background" />
                       <span class="error">생년월일은 마우스로만 클릭하세요.</span>
                    </td>
                </tr>
                
                 <tr>
                    <td colspan="2">
                       <label for="agree">이용약관에 동의합니다</label>&nbsp;&nbsp;<input type="checkbox" id="agree" />
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2">
                       <iframe src="<%= ctxPath%>/iframe_agree/agree.html" width="100%" height="150px" style="border: solid 1px navy;"></iframe>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" class="text-center">
                       <input type="button" class="register_btn" value="가입하기" onclick="goRegister()" />
                       <input type="reset"  class="cancel_btn" value="취소하기" onclick="goReset()" />
                    </td>
                </tr>
		   	</tbody>
	   	</table>
	   	</div>
	   	</form>
   	
<jsp:include page="../footer.jsp" /> 