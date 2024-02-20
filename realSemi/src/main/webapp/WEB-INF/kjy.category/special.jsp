<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴정보 목록</title>
    
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/header.css"/>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/kjy.css/footer.css"/>

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>



<%-- 직접만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/index.js"></script>

<script type="text/javascript">

function redirectToOtherPage() {
	
    window.location.href = "http://localhost:9090/tempSemifinal/login/loginIndex.bk"; // "목표페이지의URL"을 실제 페이지의 URL로 바꿔주세요.
}
</script>

<style type="text/css">
@font-face {
    font-family: dabanggu;
    font-weight: 400;
    src: url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff2"),url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff")
}
body{

font-family: dabanggu;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	// index 메뉴 리스트에 input 태그(타입 히든)으로 카테고리 할당 값을 둠
	// 메뉴 리스트에서 클릭을 했을 때 input 태그의 값을 let 변수에 저장, 페이지가 로딩되었을때
	// let 에 저장된 값의 카테고리가 뜨게끔
	
	let cnum = Number("${requestScope.cnum}");
	
	console.log(cnum);
	console.log(typeof cnum);
	
	menufunction(cnum);
	
	$.ajax({
      url:"menuCategoryListJSON.bk",
      dataType:"json",
      success:function(json){
          let v_html = ``;
          
          if(json.length == 0) {
            v_html = `현재 카테고리 준비중 입니다...`;
            $("div#categoryList").html(v_html);
         }
         
         else if(json.length > 0) {
            // 데이터가 존재하는 경우
            
         /*   
            // 자바스크립트 사용하는 경우
            json.forEach(function(item, index, array){
               
            });
            
            // jQuery 를 사용하는 경우
            $.each(json, function(index, item){
               
            });
         */    
	//	console.log("~~~확인용 json =>",JSON.stringify(json));
         /*
            ~~~ 확인용 json => [{"code":"100000","cname":"전자제품","cnum":1}
                              ,{"code":"200000","cname":"의류","cnum":2}
                              ,{"code":"300000","cname":"도서","cnum":3}]    
         */ 
		
		
                          
            $.each(json, function(index, item){
               
                 v_html += `<a href="javascript:menufunction(\${item.cnum})">\${item.cname}</a>&nbsp;&nbsp;`;  
                           
            });// end of $.each(json, function(index, item)-----
            
              
			// 카테고리 출력하기
			$("div#categoryList").html(v_html);
            
             
         }// end of else if(json.length > 0)----------------
                  
      },
      error: function(request, status, error){
         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }      
   });
                          	 
                          	 
});// end of $(document).ready(function(){}----------------

//function declaration

function menufunction(cnum) {
    // 'cnum' 값을 사용하여 원하는 작업을 수행

    // 예: cnum 값을 사용하여 추가적인 AJAX 요청 수행
    $.ajax({
        url: "indexMenuListJSON.bk",
        data: { "cnum": cnum },
        dataType: "json",
        success: function(json) {
        	
          let v_html = ``;
          
          if(json.length == 0) {
            v_html = `현재 카테고리 준비중 입니다...`;
            $("div#menuList").html(v_html);
         }
         
         else if(json.length > 0) {
            // 데이터가 존재하는 경우
            
         /*   
            // 자바스크립트 사용하는 경우
            json.forEach(function(item, index, array){
               
            });
            
            // jQuery 를 사용하는 경우
            $.each(json, function(index, item){
               
            });
         */    
	//	console.log("~~~확인용 json =>",JSON.stringify(json));
         /*
            ~~~ 확인용 json => [{"code":"100000","cname":"전자제품","cnum":1}
                              ,{"code":"200000","cname":"의류","cnum":2}
                              ,{"code":"300000","cname":"도서","cnum":3}]    
         */ 
		
			v_html += `<div class="row text-center">`;
                          
            $.each(json, function(index, item){
                 v_html += `<div class='col-lg-3'>
		                     <div class="card mb-3">
		                        <img src='<%= ctxPath%>/image/\${item.pimage}' class='card-img-top' style='width: 100%'/>
		                        <div class='card-body' style='padding: 0; font-size: 9pt;'>
		                          <ul class='list-unstyled mt-2 text-center'> 
		                               <li>\${item.pname}</li> 
		                               <li class='text-center'><a href='/tempSemifinal/category/prodDetail.bk?pnum=\${item.pnum}' class='stretched-link' role='button'></a></li> 
		                          </ul>
		                        </div>
		                      </div>
		                    </div>`;  
                           
            });// end of $.each(json, function(index, item)-----
            	
            	v_html += `</div>`;
              
			// 카테고리 출력하기
			$("div#menuList").html(v_html);
            
             
         }// end of else if(json.length > 0)----------------
            
        },
        error: function(request, status, error){
         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }
            
    });
    
}// end of function menufunction(cnum)-------------------------

</script>

</head>
<body>
<%--헤더 시작 --%>

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
                <li><a href="#">매장소개</a>
                     <ul class="sub">
                        <li><a href="<%=ctxPath%>/shop/storeLocation.bk">매장찾기</a></li>
                       
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
                
            </ul>
            <button type="button" onclick="redirectToOtherPage()">딜리버리 주문</button>
            </nav>
        </div>
        <div class="hd_bg"></div>
    </header>
    
 <%--헤더 끝 --%>    

	<%-- 상단 메뉴바 1 --%>
	<nav class="navbar navbar-expand-sm" style="margin-top:100px; background-color:black;">
	  <ul class="navbar-nav pl-5" style=" margin-left:300px;">
	    <li class="nav-item">
	      <a class="nav-link text-white font-weight-bold" href="<%= ctxPath%>/index.bk" >HOME</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white" href="#">></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white font-weight-bold" href="#">메뉴소개</a>
	    </li>
	  </ul>
	</nav>
	
	<%-- 상단 메뉴바 2 --%>
	<div class="container pt-3" id="menu_container">
		<span style="font-size: 27pt; font-weight: bold;">메뉴소개</span>
		
	<%-- 카테고리 json 쏴주는 부분 --%>
	<div id="categoryList" style="display:inline-block; margin-left:100px; padding-bottom:50px;"></div>
	<%-- 카테고리 json 쏴주는 부분 --%>
	
	<%-- 메뉴 json 쏴주는 부분 시작 --%>
	<div id="menuList" class="container" style="width:100%">

	</div>	
	<%-- 메뉴 json 쏴주는 부분 끝 --%>
</div>	

<div class="main_bottom_container">
      <ul class="main_bottom">
          <li><a href="#"><span class="main_bottom_main">메뉴</span></a>
              <ul class="main_bottom_sub">
                  <li><a href="<%= ctxPath%>/category/special.bk?cnum=1">스페셜&amp;할인팩</a></li>
                  <li><a href="<%= ctxPath%>/category/special.bk?cnum=2">신제품(NEW)</a></li>
                  <li><a href="<%= ctxPath%>/category/special.bk?cnum=3">프리미엄</a></li>
                  <li><a href="<%= ctxPath%>/category/special.bk?cnum=4">와퍼&amp;주니어</a></li>
                  <li><a href="<%= ctxPath%>/category/special.bk?cnum=5">치킨&amp;슈림프버거</a></li>
                  <li><a href="<%= ctxPath%>/category/special.bk?cnum=6">올데이킹&amp;킹모닝</a></li>
                  <li><a href="<%= ctxPath%>/category/special.bk?cnum=7">사이드</a></li>
                  <li><a href="<%= ctxPath%>/category/special.bk?cnum=8">음료&amp;디저트</a></li>
              </ul>
          </li>
          <li><a href="#"><span class="main_bottom_main">매장</span></a>
               <ul class="main_bottom_sub">
                  <li><a href="#">매장찾기</a></li>
                 
              </ul>
          </li>
          <li><a href="#"><span class="main_bottom_main">이벤트</span></a>
               <ul class="main_bottom_sub">
                  <li><a href="">이벤트</a></li>
                  
              </ul>
          </li>
          <li><a href="#"><span class="main_bottom_main">브랜드스토리</span></a>
               <ul class="main_bottom_sub">
                  <li><a href="#">BRAND</a></li>
				  <li><a href="#">WHOPPER</a></li>
				  <li><a href="#">COMM.</a></li>
              </ul>
          </li>
          <li><a href="#"><span class="main_bottom_main">고객센터</span></a>
               <ul class="main_bottom_sub">
                  <li><a href="#">공지사항</a></li>
				  <li><a href="#">FAQ</a></li>
				  <li><a href="#">문의</a></li>
              </ul>
          </li>
          
      </ul>
</div>
 <%--밑에 메뉴 끝 --%>
  
  <%--푸터 시작--%>
  <div id="footer">
         <hr style="width: 65%; background-color: rgb(187,163,141);">
         <div id="ftcontent">
            <img id="bgk" src="<%= ctxPath%>/image/bgk.png">
            <p class="lastp" style="padding-top: 20px;">서울 종로구 삼봉로 71 G 타워 4F,5F 주식회사 비케이알  전화주문 1599-0505</p>
            <p class="lastp">사업자 등록번호 101-86-76277  (주)BKR 대표이사 이동형</p>
            <p class="lastp">Copyright 2019 BKR Co., Ltd. All right Reserved</p>
            <div style="position: absolute; bottom: 70%; left: 70%;">
               <a href="#" class="lasta">이용약관</a>&nbsp;&nbsp;
               <a href="#" class="lasta">개인정보처리방침</a>&nbsp;&nbsp;
               <a href="#" class="lasta">법적고지</a>
            </div>
         </div>
      </div>


	
