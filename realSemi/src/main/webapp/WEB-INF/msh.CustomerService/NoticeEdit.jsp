<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath=request.getContextPath(); %>

<style>

.dropBox {
	background-color: #eee;
	min-height: 50px;
	min-height: 50px;
	overflow:auto;
	font-size: small;
	text-align: center;
	vertical-align: middle;
}

.dropBox.active {
	background-color: #E3F2FD;
}

button {
	border-style: none;
}

#submitBtn, #getSavedPostBtn {
	color: white;
	background-color: #086BDE;
}

#noticeFrm > h5{
	font-family: dabanggu;
	font-size:25px;
}

#noticeFrm > div > h5{
	font-family: dabanggu;
	font-size:25px;
}

#submitBtn{
	font-family:dabanggu;
	font-size:25px;
}
#cancelBtn{
	font-family:dabanggu;
	font-size:25px;
}

</style>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/index.css"/>

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<script type="text/javascript" src="<%=ctxPath %>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script>

	//전역변수
	let obj = [];

	$(document).ready(function(){ // =========================================================
		
		<%-- 스마트에디터 구현 --%>
	       
		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: obj,
			elPlaceHolder: "content",
			sSkinURI: "<%= ctxPath%>/smarteditor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,            
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,    
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});	
		
		// 글쓰기 버튼
		$("button#submitBtn").click(function(){
			<%-- === 스마트 에디터 구현 시작 === --%>
			// id가 content인 textarea에 에디터에서 대입
			obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			<%-- === 스마트 에디터 구현 끝 === --%>

			// 글제목 유효성 검사
			const subject = $("#subject").val().trim();
			if(subject == "") {
				alert("글제목을 입력하세요!!");
				return;
			}

			<%-- === 글내용 유효성 검사(스마트 에디터 사용 할 경우) 시작 === --%>
			let contentval = $("textarea#content").val();
			contentval = contentval.replace(/&nbsp;/gi, "");
			contentval = contentval.substring(contentval.indexOf("<p>")+3);
            contentval = contentval.substring(0, contentval.indexOf("</p>"));
            
            if(contentval.trim().length == 0) {
	        	alert("글내용을 입력하세요!!");
	        	return;
	        }		

			<%-- === 글내용 유효성 검사(스마트 에디터 사용 할 경우) 끝 === --%>
			const formData = $("form[name='noticeFrm']").serialize();
		    	
		    	 $.ajax({
		    	     url : "<%=ctxPath%>/CustomerService/NoticeEditEnd.bk",
		    	     data : formData,
		    	     type:'POST',
		    	     dataType:'json',
		    	     cache:false,
		    	     success:function(json){
		    	     		alert("수정 성공!");
					    	location.href = "<%=ctxPath%>/CustomerService/NoticeList.bk";
		    	     },
		    	     error: function(request, status, error){
		    			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    		}
		    	 });
			 
		}); //end of $("button#submitBtn").click(function(){------------
		
	}); // end of $(document).ready() ======================================================
	
	function redirectToOtherPage() {
		
	    window.location.href = "<%= ctxPath%>/login/loginIndex.bk"; // "목표페이지의URL"을 실제 페이지의 URL로 바꿔주세요.
	}


</script>

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


<div class='container'>
	<div class='my-4'>
		<h4>공지사항</h4>
	</div>

	<form id="noticeFrm" name="noticeFrm">
		<input type="hidden" name="seq" value="${noticevo.seq}"/>
		<h5 class='text-left mb-3' style="margin-top: 80px">제목</h5>

	    <input type="text" name="subject" id="subject" value="${noticevo.subject}" style='width: 100%; font-size: small;' />
			
		<div class='mb-3' style='margin-top: 30px'>
			<h5 style='display: inline-block;'>내용</h5>	
		</div>
		
		<textarea style="width: 100%; height: 612px;" name="content" id="content">
			${noticevo.content}
		</textarea>

	</form>
	
	<div style="margin: 20px; text-align: center;">
		<button type="button" id='cancelBtn' class='btn btn-secondary rounded' onclick="javascript:history.back()">취소</button>
		<button type="submit" class='btn rounded ml-2' id="submitBtn">확인</button>
	</div>
	
</div>

