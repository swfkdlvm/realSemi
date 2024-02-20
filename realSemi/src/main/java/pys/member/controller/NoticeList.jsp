<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String ctxPath=request.getContextPath(); %>

<style>
#list {
	font-size: small;
	margin-bottom: 50px !important;
}

#pageList a{
	font-size: small;
	color: black;
}

#pageList .active a{
	color: white;
	background-color: #086BDE;
}

a {
	color: black;
}

#writeBtn {
	border-style: none;
	background-color: #086BDE;
	color: ivory;
	float: right;
	font-size: small;
	padding: 3px 7px;
}



/* 테이블 로우 스타일 변경 */
tr {
    cursor: pointer;
    transition: background-color 0.3s ease;
}

/* 테이블 로우 호버 효과 */
tr:hover {
    background-color: #f9f9f9;
}
</style>
<meta charset="utf-8">
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
<%-- 직접만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/index.js"></script>

<script>

	$(document).ready(function(){
		
		// 검색창에서 엔터시 검색하기 함수 실행
		$("#searchWord").bind("keydown", (e) => {
			if (e.keyCode == 13) {
				goSearch();
			}
		});
		
		$(document).on('click', '#teamDraftTable tbody tr', function() {
			const seq = $(this).find('td:first-child').text();
			goView(seq);
		});
		// 검색어가 있을 경우 검색타입 및 검색어 유지시키기
		if (${not empty paraMap.searchType}){
			$("select#searchType").val("${paraMap.searchType}");
			$("input#searchWord").val("${paraMap.searchWord}");
		}
		
		// pageSize 유지시키기
		$("select#pageSize").val("${paraMap.pageSize}");
		
		// sortType 유지시키기
		$("select#sortType").val("${paraMap.sortType}");
		
		// sortOrder 유지시키기
		$("select#sortOrder").val("${paraMap.sortOrder}");

		 var selectedPageSize = localStorage.getItem('selectedPageSize');
		     
		 $("#pageSize").val(selectedPageSize);
		    
		$("#pageSize").change(function() {
			localStorage.setItem('selectedPageSize', $(this).val());  
			goSearch2();
		});
		
		 var initialSortOrder = localStorage.getItem("selectedSortOrder") || "desc";
		    $("#sortOrder").val(initialSortOrder);
		   
		    $("#sortOrder").val("desc");
		    // 선택이 변경될 때 현재 선택된 값을 로컬 스토리지에 저장
		    $("#sortOrder").change(function(){
		        var selectedSortOrder = $(this).val();
		        localStorage.setItem("selectedSortOrder", selectedSortOrder);
		        console.log("Selected Sort Order: " + selectedSortOrder);
		    });
  
	}); // end of $(document).ready() =============================
	
	function addPost(){
		location.href='<%=ctxPath%>/CustomerService/NoticeWrite.bk';
	}
	
	 // ===== 글의 상세 정보를 보기 위한 함수시작  ==========
	  function goView(seq) {
        const goBackURL = "${requestScope.goBackURL}";
        const frm = document.goViewFrm; 
        frm.seq.value = seq;
        frm.goBackURL.value = goBackURL;

        if (${not empty requestScope.paraMap}) {
            frm.searchType.value = "${requestScope.paraMap.searchType}";
            frm.searchWord.value = "${requestScope.paraMap.searchWord}";
        }

        frm.method = "post";
        frm.action = "<%= ctxPath%>/CustomerService/Noticeview.bk";
        frm.submit();
    }
    //===== 글의 상세 정보를 보기 위한 함수 끝  ==========
	//검색
	/*
	function goSearch(){
		const frm = document.searchFrm;
		
		frm.method = "get";
		frm.action = "<%=ctxPath%>/CustomerService/NoticeSearch.bk";
		frm.submit();
	}
	function goSearch2(){
		const frm = document.searchFrm;
		
		frm.method = "get";
		frm.action = "<%=ctxPath%>/CustomerService/NoticeSelectSearch.bk";
		frm.submit();
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



<div class='container' style="margin-top:200px;">
	<div class='mt-4' >
		<h4>공지사항</h4>
	</div>
	<form name="searchFrm">
			<div class="text-right mb-3">
				<%-- 검색 구분 --%>
				<select id="searchType" name="searchType" class="mr-1" style="padding: 3px">
					<option value="subject_content">제목+내용</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select>
				<%-- 검색어 입력창 --%>
				<input type="text" style="display: none;" /> 
				<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요" />&nbsp;
				<button type="button" style="border: none; background-color: transparent;" onclick="goSearch()">
					<i class="fas fa-search fa-1x"></i>
				</button>
			</div>
		
			<div class="row mb-3">
				<div class='col text-right'>
					<select id="pageSize" name="pageSize" onchange="goSearch2()">
						<option value="10">10개씩 보기</option>
						<option value="30">30개씩 보기</option>
						<option value="50">50개씩 보기</option>
					</select> <%--
					<select id="sortType" name="sortType" onchange="goSearch()">
						<option value="post_date">작성일</option>
					</select>  --%>
					<select id="sortOrder" name="sortOrder" onchange="goSearch2()">
						<option value="desc">최신순</option>
						<option value="asc">오래된순</option>
					</select>
				</div>
			</div>
		</form>
		<form name="goViewFrm">
    <div id='list' class='m-4'>
        <table class="table" id="teamDraftTable">
        	<thead>
				<tr class='row'>
					<th class='col text-center'>번호</th>
					<th class='col col-4 text-center'>제목</th>
					<th class='col text-center'>작성일자</th>
					<th class='col text-center'>조회수</th>
				</tr>
			</thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty postList}">
                        <c:forEach items="${postList}" var="post">
                            <tr class='row'>
                                <td class='col text-center' style="position:relative; right:5px;">${post.seq}</td>
                                <td class='col text-center' style="padding-left:60px;" onclick="goView('${post.seq}')">${post.subject}</td>
                                <td class='col text-center' style="padding-left:70px;">${fn:substring(post.regdate,0,10)}</td>
                                <td class='col text-center' style="padding-left:10px;">${post.readcount}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan='5' class='text-center'>게시물이 존재하지 않습니다.</td>
                        </tr>
                    </c:otherwise>            
                </c:choose>
            </tbody>
        </table>
    </div>

    <button type="button" id="writeBtn" class='rounded' onclick='addPost()'>글쓰기</button>

    <div id="pageList">
        ${pageBar}
    </div>

    <!-- 값이 동적으로 설정되도록 변경 -->
    <input type="hidden" name="seq" id="seq"/>
    <input type="hidden" name="goBackURL" />
    <input type="hidden" name="searchType" />
    <input type="hidden" name="searchWord" />
</form>
</div>


