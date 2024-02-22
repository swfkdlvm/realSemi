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


/* 모달 스타일 */
.modal {
	display: none; /* 초기에는 보이지 않도록 설정 */
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 50%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

  /* 모달 내용 스타일 */
.modal-content {
	background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* 모달 닫기 버튼 스타일 */
.close {
	color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
#myModal > div{
	width:70%;
}
  
#teamDraftTable tbody tr:hover {
	background-color: #f5f5f5; 
	cursor: pointer; 
}

#teamDraftTable tbody tr:hover td {
	color: #333; 
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
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
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
		
		$("button#tempsaveBtn").click(function(){
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
			     url : "<%=ctxPath%>/CustomerService/Noticetemp_WriteEnd.bk",
			     data : formData,
			     type:'POST',
			     dataType:'json',
			     success:function(json){
			     	alert("임시저장 성공!");
			     },
			     error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
			 
		}); //end of $("button#tempsaveBtn").click(function(){--------------

		
		$("button#getSavedPostBtn").click(function(){
			
	    	$("#myModal").css("display", "block");
		});	
		
		$(".close, #myModal").click(function () {
		     $("#myModal").css("display", "none");
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
			     url : "<%=ctxPath%>/CustomerService/NoticeWriteEnd.bk",
			     data : formData,
			     type:'POST',
			     dataType:'json',
			     success:function(json){
			     		alert("등록 성공!");
				    	location.href = "<%=ctxPath%>/CustomerService/NoticeList.bk";

			     },
			     error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
			 });
			 
		});//end of $("button#submitBtn").click(function(){---------------
		
	}); // end of $(document).ready() ======================================================
	
		
	function redirectToOtherPage() {
	    window.location.href = "<%= ctxPath%>/login/loginIndex.bk"; // "목표페이지의URL"을 실제 페이지의 URL로 바꿔주세요.
	}	
	 // ===== 임시 글을 가져오기 위한 함수시작  ==========
	function goView(seq) {
		const goBackURL = "${requestScope.goBackURL}";
	    const frm = document.goViewFrm; 
	    frm.seq.value = seq;
	    frm.goBackURL.value = goBackURL;
		
	    frm.method = "post";
	    frm.action = "<%= ctxPath%>/CustomerService/NoticeTempEdit.bk";
	    frm.submit();
	}
 
	//임시글을 삭제하기 위한 함수시작
	function deletego(seq) {
	    const goBackURL = "${requestScope.goBackURL}";
	    const frm = document.goViewFrm; 
	    frm.seq.value = seq;
	    frm.goBackURL.value = goBackURL;
	
	    var isConfirmed = confirm("삭제하시겠습니까?");
	
	    // 사용자가 확인 버튼을 누른 경우
	    if (isConfirmed) {
	        $.ajax({
	            url: "<%=ctxPath%>/CustomerService/NoticeTempDelete.bk",
	            data: $(frm).serialize(), // Serialize form data
	            dataType: "json",
	            method: "post",
	            success: function(json) {
	                location.href = "<%=ctxPath%>/CustomerService/NoticeWrite.bk";
	            },
	            error: function(request, status, error) {
	                alert("code: " + request.status + "\n" + "message: "
	                    + request.responseText + "\n" + "error: " + error);
		            }
		        });
		}//end of if (isConfirmed) {------------	
	}//end of function deletego(seq) {------------
	
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
	
		<h5 class='text-left mb-3' style="margin-top: 80px">제목</h5>

	    <%-- == 원글쓰기인 경우 == --%>
	    <input type="text" name="subject" id="subject" placeholder='제목을 입력하세요' style='width: 100%; font-size: small;' />
			
		<div class='mb-3' style='margin-top: 30px'>
			<h5 style='display: inline-block;'>내용</h5>
			<button id='tempsaveBtn' type="button" class="btn btn-sm btn-light" style='float: right'>임시저장</button>
			<button id='getSavedPostBtn' type="button" class="btn btn-sm btn-light" style='float: right'>임시저장 불러오기</button>
		</div>
		<textarea style="width: 100%; height: 612px;" name="content" id="content" placeholder='내용을 입력하세요'></textarea>

	</form>
	
	<div style="margin: 20px; text-align: center;">
		<button type="button" id='cancelBtn' class='btn btn-secondary rounded' onclick="javascript:history.back()">취소</button>
		<button type="submit" class='btn rounded ml-2' id="submitBtn">확인</button>
	</div>
	
	
	<!-- 모달 창 -->
	<div id="myModal" class="modal">
	  <!-- 모달 내용 -->
		  <div class="modal-content">
		    <span class="close">&times;</span>
		    	<div id='list' class='m-4'>
			    	<form name="goViewFrm">
				        <table class="table" id="teamDraftTable">
				        	<thead>
								<tr class='row'>
									<th class='col text-center'>번호</th>
									<th class='col col-4 text-center'>제목</th>
									<th class='col text-center'>작성일자</th>
								</tr>
							</thead>
							
				            <tbody>
				                <c:choose>
				                    <c:when test="${not empty temp_postList}">
				                        <c:forEach items="${temp_postList}" var="temp_post">
				                            <tr class='row'>
				                                <td class='col text-center' style="position:relative; right:5px;">${temp_post.seq}</td>
				                                <td class='col text-center' style="padding-left:60px;" onclick="goView('${temp_post.seq}')">${temp_post.subject}</td>
				                                <td class='col text-center' style="padding-left:70px;">${temp_post.regdate}</td>
				                            	<td class='col col-1' id="vacDelete"><button id = "delete_button" onclick="deletego('${temp_post.seq}')">삭제</button></td>
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
				        <div id="pageList" class='text-center'>
		        			${pageBar}
		    			</div>
	
				    <!-- 값이 동적으로 설정되도록 변경 -->
				    <input type="hidden" name="seq" id="seq"/>
				    <input type="hidden" name="goBackURL" />
				    <input type="hidden" name="searchType" />
				    <input type="hidden" name="searchWord" />
	         	</form>
	    	</div>
	  	</div>
	</div>
</div>

