<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/kjy.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- CSS --%>
<style type="text/css">
   /* div.div_pwd {
      width: 70%;
      height: 15%;
      margin-bottom: 5%;
      margin-left: 10%;
   } */

div.div_pwd {
   width: 70%;
   height: 15%;
   margin-bottom: 5%;
   margin-left: 10%;
}

@font-face {
    font-family: dabanggu;
    font-weight: 400;
    src: url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff2"),url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff")
}

body {
    background-color: rgb(242, 235, 230);
}

ul#leftbar {
   margin-left:16.5%;
}

div#content {
   /*border: solid 1px red;*/
   width: 40%;
   margin: 20px auto; 
}

div#item {
   /*border: solid 1px gray;*/
   width: 100%;
   height: 550px;
}

div#item > div {
   font-family: dabanggu;
   letter-spacing: 2px;
}


div#item > ul > li {
   display: inline;
}

table#pwtbl {
   background-color: white;
   width: 100%;
   height: 400px;
   margin: 20px 0;
   font-weight: bold;
   border: none;
}

#pwtbl > tbody > tr:first-child {
   background-color: rgb(248, 248, 248);
}

#pwtbl > tbody > tr > td {
   font-size: 14pt;
   /*border: solid 1px blue;*/
   padding: 0 20px;
}

#pwtbl > tbody > tr:nth-child(2) > td,
#pwtbl > tbody > tr:nth-child(3) > td {
   font-family: dabanggu;
   letter-spacing: 1.5px;
}

#pwtbl > tbody > tr:nth-child(2) > td:first-child,
#pwtbl > tbody > tr:nth-child(3) > td:first-child {
   width: 25%;
   font-size: 15pt;
}


input:focus {
   outline:none;
}

#item > form > div#btndiv {
   text-align: center;
}

#item > form > div#btndiv button {
   border: solid 0.5px rgb(81, 35, 20);
   border-radius: 10px;
   font-size: 17pt;
   font-family: dabanggu;
   width: 220px;
   height: 70px;
   background-color: rgb(81, 35, 20);
   color:  rgb(242, 235, 230);
}

</style>

<script type="text/javascript">
   $(document).ready(function(){
      
      $("button.btn-success").click(function() {
         
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
               const frm = document.pwdUpdateEndFrm;
               frm.action = "<%= ctxPath%>/login/pwdUpdateEnd.bk";
               frm.method = "post";
               frm.submit();
            }
            
         }
         
      });// end of $("button.btn-success").click()---------------------
      
   });// end of $(document).ready(function(){})-------------------------
   
   
   // Function Declaration

   
</script>


<c:if test="${requestScope.method eq 'GET'}">
   <div id="content">
      <div id="item">
         <div class="my-4" style="font-size: 29pt; margin: 20px 0;">비밀번호 변경</div>
         <form name="pwdUpdateEndFrm">
            <table class="mt-4" id="pwtbl">
               <tr>
                  <td class="pl-5" colspan="2">회원님의 비밀번호를 새로운 비밀번호로 설정합니다.</td>
               </tr>
               <tr>
                  <td class="pl-5">새암호</td>
                  <td>
                     <input id="pwd" name="pwd" type="password" size="25" style="border: none;" />
                  </td>
               </tr>
               <tr>
                  <td class="pl-5">새암호 확인</td>
                  <td>
                     <input id="pwd2" name="pwd2" type="password" size="25" style="border: none;" />
                  </td>
               </tr>
            </table>
            
            <input type="hidden" name="userid" value="${requestScope.userid}" />
                        
            <div id="btndiv" style="text-align: center;">
                  <button type="button" class="btn btn-success">암호변경하기</button>
             </div>
         </form>
      </div>
   </div>
</c:if>


<c:if test="${requestScope.method eq 'POST'}">
   
   <div id="content">
      <div id="item">
         <div class="my-4" style="font-size: 29pt; margin: 20px 0;">비밀번호 변경 성공</div>
         
            <table class="mt-4" id="pwtbl">
               <tr>
                  <td class="pl-5">
                     <c:if test="${requestScope.n eq 1}">
                        사용자 ID ${requestScope.userid}님의 비밀번호가 새로이 변경되었습니다.
                     </c:if>
                     <c:if test="${requestScope.n eq 0}">
                        SQL구문 오류가 발생되어 비밀번호 변경에 실패했습니다.
                     </c:if>
                  </td>
               </tr>
            </table>
                        
            <div id="btndiv" style="text-align: center;">
                  <button type="button" onclick="location.href='<%= ctxPath%>/login/loginIndex.bk'">로그인페이지로 이동하기</button>
             </div>
         
      </div>
      
   </div>
      
</c:if>


