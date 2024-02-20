<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴정보 상세</title>
    
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

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/index.js"></script>

<style type="text/css">
@font-face {
    font-family: dabanggu;
    font-weight: 400;
    src: url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff2"),url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff")
}

div#bgDiv {
   width: 100%;
   border: solid 0px blue;
}

div#inner-contents {
   border: solid 0px red;
   padding-top: 110px;
}

table {
   border: solid 0px orange;
   width: 60%;
   margin:auto;
}

table > tbody > tr:first-child > td {
   font-family: dabanggu;
}

body > nav:nth-child(1) > ul {
   position: relative;
   left: 300px;
}
body > nav.navbar.navbar-expand-sm{
background-color:black;}
body > nav.navbar.navbar-expand-sm > ul > li.nav-item > a {
   position: relative;
   left: 300px;
   font-family: dabanggu;
   
}

body > nav.navbar.navbar-expand-sm > ul > li:nth-child(2) > button {
   width: 310px;
   height: 40px;
   border-radius: 10px;
   font-weight: bold;
   position: relative;
   left: 900px;
   font-family: dabanggu;
}

body > nav:nth-child(3) > ul > li.nav-item > a {
   font-family: dabanggu;
}

body > nav:nth-child(3) > ul > li:nth-child(2) > button {
   font-family: dabanggu;
}

body > nav:nth-child(3) > ul > li:nth-child(2) > button > img {
   padding-bottom: 2.7px;
}


/* modal css */
h4.modal-title {
   font-family: dabanggu;
}

div.modal-body {
   background-color: #F2EBE6;
   padding: 40px;
}

div.modal-body > div:first-child {
   border: solid 0px blue;
   background-color: white;
   padding: 40px;
   border-radius: 10px;
   
   margin-bottom: 20px;
}

div.modal-body > div:nth-child(2) {
   border: solid 0px blue;
   background-color: white;
   padding: 40px;
   border-radius: 10px;
}

div.modal-body h6 {
   font-family: dabanggu;
   color: #490206;
   
}

div.modal-body span {
   font-family: dabanggu;
   color: #490206;
   
}

div.modal-body p {
   font-weight: bold;
   color: #490206;
   
}

div#bgDiv {
   background-image: url("<%= ctxPath%>/image/menuDetailBG.png");
   background-size: cover;
   height: 450px;
}

</style>


<script type="text/javascript">

let isOrderOK = false;
// 로그인한 사용자가 해당 제품을 구매한 상태인지 구매하지 않은 상태인지 알아오는 용도.
// isOrderOK 값이 true 이면   로그인한 사용자가 해당 제품을 구매한 상태이고,
// isOrderOK 값이 false 이면  로그인한 사용자가 해당 제품을 구매하지 않은 상태로 할 것임.

$(document).ready(function(){
	
	goLikeDislikeCount(); // 좋아요, 싫어요 갯수를 보여주도록 하는 것이다.
    
    goReviewListView();  // 제품 구매후기를 보여주는 것.
/////////////////////////////////////////////////////////////////////////
    // === 로그인한 사용자가 해당 제품을 구매한 상태인지 구매하지 않은 상태인지 먼저 알아온다 === // 
    
   $.ajax({
         url:"<%=ctxPath %>/shop/isOrder.bk",
          type:"GET",
          data:{"fk_pnum":"${requestScope.pvo.pnum}"
             ,"fk_userid":"${sessionScope.loginuser.userid}"},
          dataType:"JSON",
       
          async:false,   // 동기처리
     // async:true,    // 비동기처리(기본값임) 
       
        success:function(json){
      	  //console.log("~~ 확인용 : " + JSON.strigify(json));
      	  // ~~ 확인용 : {"isOrder": true} 해당제품을 구매한 경우
      	  // ~~ 확인용 : {"isOrder": false}  해당제품을 구매하지 않은 경우
           isOrderOK = json.isOrder; 
           
             // json.isOrder 값이 true  이면 로그인한 사용자가 해당 제품을 구매한 경우이고
             // json.isOrder 값이 false 이면 로그인한 사용자가 해당 제품을 구매하지 않은 경우이다.
          },
         error: function(request, status, error){
          alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
          }
   });
     
   //////////////////////////////////////////////////////////////////////////
    
	
      // **** 제품후기 쓰기(로그인하여 실제 해당 제품을 구매했을 때만 딱 1번만 작성할 수 있는 것. 제품후기를 삭제했을 경우에는 다시 작성할 수 있는 것임.) ****// 
      $("button#btnCommentOK").click(function(){
         
    	  if(${empty sessionScope.loginuser}) {
   		  	 alert("제품사용 후기를 작성 하시려면 먼저 로그인 하셔야 합니다.");
   		   	 return; // 종료
   	   }
       
    	  if(!isOrderOK){ // 해당 제품을 구매하지 않은 경우라면
   		    alert("${requestScope.pvo.pname}제품을 구매하셔야지만 후기작성이 가능합니다.")
   	   }
    	  else {// 해당 제품을 구매한 경우라면
    		 const review_contents = $("textarea[name='contents']").val().trim();
    	  
    	  	 if(review_contents =="") {
    	  		 alert("제품후기 내용을 입력하세요!!");
    	  		$("textarea[name='contents']").val(""); // 공백제거
    	  		 return; // 종료
    	  	 }
    	  	 <%--
    	  	 // 보내야할 데이터를 선정하는 첫번째 방법
    	  	 const queryString = {"fk_userid":"${sessionScope.loginuser.userid}"
    	  			 			  "fk_pnum":"${requestScope.pvo.pnum}"
    	  			 			  "contents":$("textarea[name='contents']").val()};
    	  	 --%>
    	  	 // 보내야할 데이터를 선정하는 두번째 방법
    	  	 // jQuery 에서 사용하는 것으로써,
             // form태그의 선택자.serialize(); 을 해주면 form 태그내의 모든 값들을 name 속성값을 키값으로 만들어서 보내준다. 
    	  	 const queryString = $("form[name='commentFrm']").serialize();
    	  		
             $.ajax({
                url:"<%= ctxPath%>/shop/reviewRegister.bk",
                type:"POST",
                data:queryString,
                dataType:"JSON",
                success:function(json){ 
                   console.log(JSON.stringify(json));
                   /*
                      {"n":1} 또는 {"n":-1} 또는 {"n":0}
                   */
                   
                   if(json.n == 1) {
                       // 제품후기 등록(insert)이 성공했으므로 제품후기글을 새로이 보여줘야(select) 한다.
                       goReviewListView(); // 제품후기글을 보여주는 함수 호출하기 
                	   
                     }
                     else if(json.n == -1)  {
                   // 동일한 제품에 대하여 동일한 회원이 제품후기를 2번 쓰려고 경우 unique 제약에 위배됨 
                   // alert("이미 후기를 작성하셨습니다.\n작성하시려면 기존의 제품후기를\n삭제하시고 다시 쓰세요.");
                      swal("이미 후기를 작성하셨습니다.\n작성하시려면 기존의 제품후기를\n삭제하시고 다시 쓰세요.");
                   }
                     else  {
                        // 제품후기 등록(insert)이 실패한 경우 
                        alert("제품후기 글쓰기가 실패했습니다.");
                     }
                   
                   $("textarea[name='contents']").val("").focus();
                },
                error: function(request, status, error){
                   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                }
             });
    	  	 
    	  }// end of if ~ else

      });//end of $("button#btnCommentOK").click(function()
	
	
});// end of $(document).ready(function(){



function redirectToOtherPage() {
	
    window.location.href = "http://localhost:9090/tempSemifinal/login/loginIndex.bk"; // "목표페이지의URL"을 실제 페이지의 URL로 바꿔주세요.
}

/////////////////////////////////////////////////////////////////////////////

// Function Declaration 
   
   // **** 특정제품에 대한 좋아요 등록하기 **** // 
   function golikeAdd(pnum) {
   	
	   if(${empty sessionScope.loginuser}) {
		   alert("좋아요 하시려면 먼저 로그인 하셔야 합니다.");
		   return; // 종료
	   }
     	
	   if(!isOrderOK){ // 해당 제품을 구매하지 않은 경우라면
		   alert("${requestScope.pvo.pname}제품을 구매하셔야만 좋아요 투표가 가능합니다.")
	   }
	   else {// 해당 제품을 구매한 경우라면
		   $.ajax({
	            url:"<%= ctxPath%>/shop/likeAdd.bk",
	            type:"POST",
	            data:{"pnum":pnum,
	                 "userid":"${sessionScope.loginuser.userid}"},
	            dataType:"JSON", 
	            success:function(json) {
	               //console.log(JSON.stringify(json));
	                // {"msg":"해당제품에\n 좋아요를 클릭하셨습니다."}
	                  // 또는
	                  // {"msg":"이미 좋아요를 클릭하셨기에\n 두번 이상 좋아요는 불가합니다."}
	                  
	               alert(json.msg);
	                 //swal(json.msg);
	                 goLikeDislikeCount();
	            },
	            error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            }
	         });
	   
	   }
      
   }// end of golikeAdd(pnum)---------------------------
   
   
   // **** 특정제품에 대한 싫어요 등록하기 **** //
   function godisLikeAdd(pnum) {
 		
	   if(${empty sessionScope.loginuser}) {
		   alert("싫어요 하시려면 먼저 로그인 하셔야 합니다.");
		   return; // 종료
	   }
	   
	   if(!isOrderOK){ // 해당 제품을 구매하지 않은 경우라면
		   alert("${requestScope.pvo.pname}제품을 구매하셔야만 삻어요 투표가 가능합니다.")
	   }
	   else {// 해당 제품을 구매한 경우라면
		   $.ajax({
	            url:"<%= ctxPath%>/shop/dislikeAdd.bk",
	            type:"POST",
	            data:{"pnum":pnum,
	                 "userid":"${sessionScope.loginuser.userid}"},
	            dataType:"JSON", 
	            success:function(json) {
	               //console.log(JSON.stringify(json));
	                // {"msg":"해당제품에\n 싫어요를 클릭하셨습니다."}
	                  // 또는
	                  // {"msg":"이미 싫어요를 클릭하셨기에\n 두번 이상 싫어요는 불가합니다."}
	                  
	               alert(json.msg);
	                 //swal(json.msg);
	                 goLikeDislikeCount();
	            },
	            error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            }
	         });
	   
	   }
	   
	   // 해당 제품을 구매하지 않은 경우이라면 
      
      
   }// end of golikeAdd(pnum)---------------
   
   
   // **** 특정 제품에 대한 좋아요, 싫어요 갯수를 보여주기 **** //
   function goLikeDislikeCount() {

	   $.ajax({
	         url:"<%= ctxPath%>/shop/likeDislikeCount.bk",
	      // type:"GET",
	         data:{"pnum":"${requestScope.pvo.pnum}"},
	         dataType:"JSON", 
	         success:function(json) {
	            console.log(JSON.stringify(json));
	             // {"likecnt":1, "dislikecnt":0}
	             
	            $("span#likeCnt").html(json.likecnt);
	            $("span#dislikeCnt").html(json.dislikecnt);
	         },
	         error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	         }
	      });    
      
   }// end of function goLikeDislikeCount()-------------------
   
   
   // 특정 제품의 제품후기글들을 보여주는 함수
   function goReviewListView() {
		
	   $.ajax({
		   url:"<%= ctxPath%>/shop/reviewList.bk",
		   type:"get",
		   data:{"fk_pnum":"${requestScope.pvo.pnum}"},
		   dataType:"json",
		   success:function(json){
			   console.log(JSON.stringify(json));
			   /*
			   [{"contents":"엄정화 후기","name":"엄정화","writeDate":"2023-11-06 09:06:12","review_seq":4,"userid":"eomjh"},{"contents":"qwdwqd","name":"박윤수","writeDate":"2023-11-03 15:25:40","review_seq":1,"userid":"ujkl021"}]
			   */
			   let v_html = "";
	            
	            if (json.length > 0) {    
	               $.each(json, function(index, item){ 
	                  let writeuserid = item.userid;
	                  let loginuserid = "${sessionScope.loginuser.userid}";
	                                 
	                  v_html +=  "<div id='review"+index+"' style='font-family: dabanggu;' ><span class='markColor' style='color:rgb(81,35,20)'>▶</span>&nbsp;"+item.contents+"</div>"
	                          + "<div class='customDisplay'>"+item.name+"</div>"      
	                          + "<div class='customDisplay'>"+item.writeDate+"</div>";
	                   
	                   if( loginuserid == "") { 
	                      // 로그인을 안한 경우 
	                      v_html += "<div class='customDisplay spacediv'>&nbsp;</div>";
	                   }      
	                   else if( loginuserid != "" && writeuserid != loginuserid ) { 
	                      // 로그인을 했으나 후기글이 로그인한 사용자 쓴 글이 아니라 다른 사용자 쓴 후기글 이라면  
	                      v_html += "<div class='customDisplay spacediv'>&nbsp;</div>";
	                   }    
	                   else if( loginuserid != "" && writeuserid == loginuserid ) {
	                      // 로그인을 했고 후기글이 로그인한 사용자 쓴 글 이라면
	                      v_html += "<div class='customDisplay spacediv commentDel' style='font-size:15px;' onclick='delMyReview("+item.review_seq+")'>후기삭제</div>"; 
	                      v_html += "<div class='customDisplay spacediv commentDel commentUpdate' style='font-size:15px;' onclick='updateMyReview("+index+","+item.review_seq+")'>후기수정</div>"; 
	                   }
	               } ); 
	            }// end of if -----------------------
	            
	            else {
	            	v_html += "<div>등록된 상품후기가 없습니다.</div>";
	            }// end of else ---------------------
	            
	            $("div#viewComments").html(v_html);
		   },
		   error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	         }
		   
	   });
      
   }
   
   
   // 특정 제품의 제품후기를 삭제하는 함수
   function delMyReview(review_seq) {
	   
	   if(confirm("정말로 제품후기를 삭제하시겠습니까?")) {
		   $.ajax({
			   url:"<%= ctxPath%>/shop/reviewDel.bk",
			   type:"post",
			   data:{"review_seq":review_seq},
			   dataType:"json",
			   success:function(json){
				  // console.log(JSON.stringify(json));
				  // {"n":1} 또는 {"n":0}
				  
				  if(json.n == 1) {
					  alert("제품후기 삭제가 성공되었습니다.");
					  goReviewListView(); // 특정 제품의 제품후기글들을 보여주는 함수호출하기
				  }
				  else {
					  alert("제품후기 삭제가 실패했습니다.");
				  }
				  
			   },
			   error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		         }
		   });
	   }
      
     
      
   }// end of function delMyReview(review_seq) {}--------------------------  
   
   // 특정 제품의 제품후기를 수정하는 함수
   function updateMyReview(index, review_seq) {

		const origin_elmt = $("div#review"+index).html();// 원래의 제품후기 엘리먼트 
		//alert(origin_elmt);
		//<span class="markColor">▶</span>&nbsp;다시 후기를 씁니다 옷 조아여
	   	  
		//alert($("div#review"+index).text());
		//▶ 다시 후기를 씁니다 옷 조아여
		
		const review_contents = $("div#review"+index).text().substring(2); // 원래의 제품후기 내용
		//alert(review_contents);
		//다시 후기를 씁니다 옷 조아여
		
		$("div.commentUpdate").hide(); //"후기수정" 글자 감추기
	    
		// "후기수정" 을 위한 엘리먼트 만들기
		let v_html = "<textarea id='edit_textarea' style='font-size: 12pt; width: 40%; height: 50px;'>"+review_contents+"</textarea>";
		v_html += "<div style='display: inline-block; position: relative; top: -20px; left: 10px;'><button type='button' class='btn btn-sm btn-outline-secondary' id='btnReviewUpdate_OK'>수정완료</button></div>"; 
		v_html += "<div style='display: inline-block; position: relative; top: -20px; left: 20px;'><button type='button' class='btn btn-sm btn-outline-secondary' id='btnReviewUpdate_NO'>수정취소</button></div>";
   		
		// 원래의 제품후기 엘리먼트에 위에서 만든 "후기수정" 을 위한 엘리먼트로 교체하기
		$("div#review"+index).html(v_html);
		
		// 수정취소 버튼 클릭시
		$(document).on("click","button#btnReviewUpdate_NO",function(){
			$("div#review"+index).html(origin_elmt);// 원래의 제품후기 엘리먼트로 복원하기
			$("div.commentUpdate").show();  //"후기수정" 글자 보여주기
		});
		// 수정완료 버튼 클릭시
		$(document).on("click","button#btnReviewUpdate_OK",function(){
			
		//	review_seq // 수정할 제품후기 번호 
			
		//	$("textarea#edit_textarea").val(); // 수정할 제품후기 내용
		
			$.ajax({
				   url:"<%= ctxPath%>/shop/reviewUpdate.bk",
				   type:"post",
				   data:{"review_seq":review_seq,
					     "contents":$("textarea#edit_textarea").val()},
				   dataType:"json",
				   success:function(json){
					  // console.log(JSON.stringify(json));
					  // {"n":1} 또는 {"n":0}
					  
					  if(json.n == 1) {
						  
						  goReviewListView(); // 특정 제품의 제품후기글들을 보여주는 함수호출하기
					  }
					  else {
						  alert("제품후기 수정이 실패했습니다.");
						  goReviewListView(); // 특정 제품의 제품후기글들을 보여주는 함수호출하기
					  }
					  
				   },
				   error: function(request, status, error){
			            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			         }
			   });
		});
   
   
   
   }// end of function updateMyReview(index, review_seq)
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
	<nav class="navbar navbar-expand-sm" style="background-color: black;">
	  <ul class="navbar-nav pl-5">
	    <li class="nav-item">
	      <a class="nav-link text-white font-weight-bold" href="#">HOME</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white" href="#">></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white font-weight-bold" href="#">메뉴소개</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white" href="#">></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white font-weight-bold" href="#">${requestScope.pvo.categvo.cname}</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white" href="#">></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link disabled text-white font-weight-bold" href="#">${requestScope.pvo.pname}</a>
	    </li>
	  </ul>
	</nav>
	<%-- 상단 메뉴바 1 끝--%>
	
		
	<div id="bgDiv">
		<div id="inner-contents">
			<table>
				<tr>
					<td valign="bottom"><p style="margin-top:50px; text-align: left; font-size: 50px; color: white;">${requestScope.pvo.pname}<p></td>
					<td rowspan="2"><img height="300px" src="<%= ctxPath%>/image/${requestScope.pvo.pimage}"></td>
				</tr>
				<tr>
					<td><p style="margin-bottom:50px; text-align: left; font-size: 22px; color: white; font-weight: bold;">${requestScope.pvo.pcontent}<p></td>
				</tr>
			</table>
		</div>
	</div>
	
		<%-- 하단바 --%>
	<nav class="navbar navbar-expand-sm">
	  <ul class="navbar-nav pl-5">
	    <li class="nav-item">
	      <a class="nav-link text-white" href="#" onclick="javascript:history.back()"> &lt;&nbsp;&nbsp;&nbsp;메뉴목록으로 돌아가기</a>
	    </li>
	    <li>
	    	<button type="button" data-toggle="modal" data-target="#exampleModal_scrolling_2" style="margin-left: auto;">원산지, 영양성분, 알레르기 유발성분&nbsp;<img height="20px" src="<%= ctxPath%>/image/bangpae.png"></button>
	    	<div class="modal fade" id="exampleModal_scrolling_2">
			  <div class="modal-dialog modal-dialog-scrollable modal-lg">
			  <!-- .modal-dialog-scrollable을 .modal-dialog에 추가하여 페이지 자체가 아닌 모달 내부에서만 스크롤할 수 있습니다. -->
			    <div class="modal-content">
			      
			      <!-- Modal header -->
			      <div class="modal-header">
			        <h4 class="modal-title">원산지, 영양성분, 알레르기 유발성분</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			      
			      <!-- Modal body -->
			      	<div class="modal-body">
		                <div>
		                	<h6>원산지</h6>
		                	<p>
			                	<img height="50px" src="<%= ctxPath%>/image/cow.png">
			                	<span>쇠고기</span><br>
			                	• 호주산과 뉴질랜드산 섞음 : 와퍼/버거패티 (주니어포함)<br>
			                	• 호주산과 뉴질랜드산 섞음 : 몬스터X<br>
			                	• 국내산(한우) : 오리지널스페퍼잭싱글, 오리지널스페퍼잭더블
			                	<br><br>
			                	<img height="50px" src="<%= ctxPath%>/image/pig.png">
			                	<span>돼지고기</span><br>
			                	• 미국산 : 베이컨
			                	<br><br>
			                	<img height="50px" src="<%= ctxPath%>/image/chicken.png">
			                	<span>닭고기</span><br>
			                	• 국내산 : 너겟킹<br>
			                	• 태국산과 국내산 섞음 : 롱치킨버거<br>
			                	• 국내산과 태국산 섞음 : 몬스터X, 몬스터와퍼, (바비큐)치킨버거<br>
			                	• 외국산 : 치킨킹, 치킨킹BLT, 바삭킹
		                	</p>
		                </div>
		                <div>
		                	<h6>안내사항</h6>
		                	<p>
		                	1.&nbsp;각 제품은 원재료의 수급 상황에 따라 구성성분이 다소 변경될 수도 있습니다.<br><br>
							2.&nbsp;표시된 영양성분표는 매장에서 판매되고 있는 모든 제품의 영양성분을 포함하지 못할 수도 있습니다.(신제품/ 특정계절 한시판매 제품/ 일부 매장 특별 판매 제품)<br><br>
							3.&nbsp;표시된 영양 구성성분은 실험방법 등에 따라 차이가 있을 수도 있습니다.<br><br>
							4.&nbsp;영양표 속의 모든 제품은 표준 용량이며, 실제 제공시 다소 차이가 있을 수 있습니다.<br><br>
							5.&nbsp;괄호안 %는 1일 영양소 기준치에 대한 비율입니다.<br><br>
							6.&nbsp;아이스 아메리카노, 아메리카노는 고카페인 함유 음료로 어린이, 임산부, 카페인 민감자는 섭취에 주의해 주시기 바랍니다.<br><br>
							7.&nbsp;판매되는 일부 메뉴는 밀, 대두, 우유, 돼지고기, 토마토, 닭고기, 쇠고기, 조개류, 난류, 게, 새우, 땅콩, 복숭아, 아황산류, 호두, 오징어, 잣 알레르기 유발 가능성이 있음을 안내드립니다.
		                	</p>
				        </div>
	            	</div>
			    </div>
			  </div>
			</div>
	    </li>
	  </ul>
	</nav>
	
	<!-- 하단 메뉴상세 -->
	<div class="container" style="border: solid 0px orange; width: 100%; height: 500px">
	  	<div style="padding-top: 80px; text-align: center; border: solid 0px lime;"><img height="200px" src="<%= ctxPath%>/image/${requestScope.pvo.pimage}"></div>
		<div style="padding-top: 20px; margin-top: 15px; border: solid 0px red;"><p style="text-align: center; font-size: 30px;">${requestScope.pvo.pname}<p></div>
		<div style="margin-top: 15px; border: solid 0px red;"><p style="text-align: center; font-size: 20px; font-weight: bold;">${requestScope.pvo.pdetail}<p></div>
	</div>
	
	<div class=" mt-5">
        
        
      <div class="row">
         <div class="col" style="display: flex">
               <h3 style="margin: auto">
                  <i class="fas fa-thumbs-up fa-2x" style="cursor: pointer;" onclick="golikeAdd('${requestScope.pvo.pnum}')"></i>
                  <span id="likeCnt" class="badge badge-primary"></span>
                </h3>
         </div>
         
         <div class="col" style="display: flex">
             <h3 style="margin: auto">
                <i class="fas fa-thumbs-down fa-2x" style="cursor: pointer;" onclick="godisLikeAdd('${requestScope.pvo.pnum}')"></i>
                <span id="dislikeCnt" class="badge badge-danger"></span>
             </h3>       
         </div>
      </div>
   
   </div>
	
	<div class="text-center">
	    <p class="h1" style="color:rgb(81,35,20) font-size:70px; font-family: dabanggu;  ">${requestScope.pvo.pname} 제품 사용후기</p>
	    
	    <div id="viewComments">
	       <%-- 여기가 제품사용 후기 내용이 들어오는 곳이다. --%>
	    </div>
    </div>
     
    <div class="row offset-4">
        <div class="col-lg-4">
          <form name="commentFrm">
              <textarea name="contents" style="font-size: 12pt; width: 100%; height: 70px;"></textarea>
              <input type="hidden" name="fk_userid" value="${sessionScope.loginuser.userid}" />
                  <input type="hidden" name="fk_pnum" value="${requestScope.pvo.pnum}" />
          </form>
       </div>
       <div class="col-lg-2" style="display: flex;">
          <button type="button" class="btn" id="btnCommentOK" ><span class="h5">후기등록</span></button>
       </div>
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
  	
	
	
	
	
	
	
	
	
	
