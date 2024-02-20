<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctxPath = request.getContextPath(); %>

<style>
	img#profile {
		border-radius: 50%;
		width: 35px;
	}
	
	body > div{
		margin-top:150px;
	}
	
	button { border-style: none;}
	
	textarea {
	    height: 30px;
	    overflow-y: hidden;
	    resize: none;
	}
	
	a{ color:black;	}
	
	body > div.black_label > div{
		position:relative;
		bottom:67px;
	
	}

	body > div.black_label{
		height:1px;
		position:relative;
		bottom:80px;
	}
	
	body > div.container > div.event_head > span{
		width:166px;
		margin-left:1px;
	}

	body > div.container > div.event_head{
		position:relative;
		bottom:260px;
	}
	
	body > div.container > div.text-left{
		border-top:solid 2px;
		position:relative;
		bottom:340px;
		background-color:#FAFAFA;
		height:100px;
		border-bottom:solid 1px silver;
	}
	#content_div{
		position:relative;
		bottom:330px;
	}
	#showList{
		position:relative;
		bottom:17px;
	}
	
</style>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/index.css"/>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/msh.css/event/event.css"/>

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<%-- 직접만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/index.js"></script>

<script>

	$(document).ready(function(){
		  
	});

	function redirectToOtherPage() {
	    window.location.href = "<%= ctxPath%>/login/loginIndex.bk"; // "목표페이지의URL"을 실제 페이지의 URL로 바꿔주세요.
	}	
	
	function editPost(){
		var isConfirmed = confirm("수정하시겠습니까?");
		if (isConfirmed) {
			location.href="<%=ctxPath%>/CustomerService/NoticeEdit.bk?seq=${noticevo.seq}";
		}
	}
	
	function deletePost(){
		// 확인 창 띄우기
		var isConfirmed = confirm("삭제하시겠습니까?");

	    // 사용자가 확인 버튼을 누른 경우
	    if (isConfirmed) {
				$.ajax({
					url:"<%=ctxPath%>/CustomerService/NoticeDelete.bk",
					data : {"seq":"${noticevo.seq}"},
					dataType : "json",
					method: "post",
					success : function(json) {
							location.href="<%=ctxPath%>/CustomerService/NoticeList.bk";
					},
					error : function(request, status, error) {
						alert("code: " + request.status + "\n" + "message: "
						+ request.responseText + "\n" + "error: " + error);
					}
					
	    		});	
	    	}//end of if (isConfirmed) {-------------	
			
	}//end of function deletePost(){-------------

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

<div class="black_label">
 	<div class="event_label">
 		<a href="#"><span>HOME</span></a> 
	 		<span> >&nbsp;&nbsp;&nbsp;고객센터</span>
	 		<span> >&nbsp;&nbsp;&nbsp;공지사항</span>
 	</div>
 </div>
 
<div class='container'>
	<div class="event_head">
 		<span>공지사항</span> 
 	</div>
	<c:choose>
		<c:when test="${not empty noticevo}">
			<div class="text-left" style="margin-top: 80px;">
		    	<div style="font-weight: bold; font-size: 30px; padding-left:30px; margin-bottom:15px; margin-top:15px; ">${noticevo.subject}</div><br>
					<div>
				    	<span style=" margin-bottom: 10px; font-size: 19px; margin-left:30px;
				    	position:relative; bottom:15px; color:#8e8e8e;">${noticevo.regdate}</span>
					    <span style="font-size: 19px; margin-bottom: 10px; position:relative;
					    bottom:14px; color:#8e8e8e;">&nbsp;조회수ㅣ ${noticevo.readcount}
					  </span>
				  	</div>
		    </div>
		<!-- 글 내용 -->
			<div id="content_div">
				<p>${noticevo.content}</p> 			
			</div>
		
		<%-- 글수정, 삭제 버튼은 작성자만 보임 --%>	
			<div class="text-right" style="margin-top: 30px;">
				<c:if test="${userid == 'admin'}">
			    	<button type="button" class="rounded" id="deleteBtn"  style="margin-left: 5px;" onclick="deletePost()">삭제</button>
					<button type="button" class="rounded" id="updateBtn" style="margin-right: 0" onclick="editPost()">수정</button>
				 </c:if>	
			</div>
			<hr style="border-top: solid 1.2px black">
			<div style='margin-top: 10px;'>
				<div style="display: inline-block; float:right"> 
				    <button type="button" id="showList" class="btn-secondary listView rounded" onclick="location.href='${noticeBackUrl}'">목록보기</button>
			    </div>
			</div>
	    	<div><i style='vertical-align: bottom;' class="fas fa-sort-up"></i>&nbsp;이전글&nbsp;&nbsp;
	    		<c:if test="${not empty noticevo.next_seq}">
		    		<a href="<%= ctxPath%>/CustomerService/Noticeview.bk?seq=${noticevo.next_seq}">
		    		${noticevo.next_subject}
		    		</a>
	    		</c:if>
	    		<c:if test="${empty noticevo.next_seq}">
	    			첫 글입니다.
	    		</c:if>
	    	</div>
	    	<div><i style='vertical-align: top;' class="fas fa-sort-down"></i>&nbsp;다음글&nbsp;&nbsp;
	    		<c:if test="${not empty noticevo.prev_seq}">
		    		<a href="<%= ctxPath%>/CustomerService/Noticeview.bk?seq=${noticevo.prev_seq}">
		    			${noticevo.prev_subject}
		    		</a>
	    		</c:if>
    			<c:if test="${empty noticevo.prev_seq}">
    				마지막 글입니다.
    			</c:if>
    		</div>
	    	<hr style="border-top: solid 1.2px black">
		</c:when>
		<c:otherwise>
			존재하지 않는 글입니다.
		</c:otherwise>
	</c:choose>
</div>