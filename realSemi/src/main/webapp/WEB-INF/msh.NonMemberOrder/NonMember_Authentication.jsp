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
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/msh.css/NonMember/NonMember_Register.css"/>

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<style>

.Order_btn{
	background-color: #6a2626;
	color:white;
	border-radius: 10px;
	font-family: dabanggu;
	height:50px;
	width:100px;
}

#phoneChk{
	background-color: #6a2626;
	color:white;
	border-radius: 10px;
	font-family: dabanggu;
	height:30px;
	width:100px;
	position:relative;
	bottom:3px;
}

#phoneChk2{
	background-color: #6a2626;
	color:white;
	border-radius: 10px;
	font-family: dabanggu;
	height:30px;
	width:100px;
	position:relative;
	bottom:3px;
}


</style>


<script type="text/javascript">

let b_phone_click = false;
//"이메일중복확인" 을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도

let b_zipcodeSearch_click = false;
//"우편번호찾기" 를 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도


$(document).ready(function(){
	
	
	$("span.error").hide();
	$("input#name").focus();
	
	$("input#name").blur( (e) => {
		
		const name = $(e.target).val().trim();
		
		if(name == "") {
			
			$("table#tblMemberRegister :input").prop("disabled", true);  
			$(e.target).prop("disabled", false); 

		    $(e.target).parent().find("span.error").show();
		     	
			$(e.target).val("").focus(); 
		}
		else {
			$("table#tblMemberRegister :input").prop("disabled", false);

		    $(e.target).parent().find("span.error").hide();
		    $("input#pwd").focus();
		}
		
	});// 아이디가 name 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다. end of $("input#name").blur( (e) => {
	
	$("input#pwd").blur( (e) => {
			
		const regExp_pwd = /^\d{6}$/;
	    // 숫자 6자리 정규표현식 객체 생성 
	    
	    const bool = regExp_pwd.test($(e.target).val());	
	    const pwd = $(e.target).val().trim();
		if(!bool || pwd == "") {
			// 암호가 정규표현식에 위배된 경우 
			$("table#tblMemberRegister :input").prop("disabled", true);  
			$(e.target).prop("disabled", false); 

		    $(e.target).parent().find("span.error").show();
		     	
			$(e.target).val("").focus(); 
		}
		else {
			// 암호가 정규표현식에 맞는 경우 
			$("table#tblMemberRegister :input").prop("disabled", false);
			$("input#pwdcheck").focus();
		    $(e.target).parent().find("span.error").hide();
		}
			
	});// 아이디가 pwd 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		
		
	$("input#pwdcheck").blur( (e) => {
		const pwd2 = $(e.target).val().trim();
		
		if( $("input#pwd").val() != $(e.target).val() || pwd2 == "") {
			// 암호와 암호확인값이 틀린 경우 
			
			$("table#tblMemberRegister :input").prop("disabled", true);  
			$("input#pwd").prop("disabled", false);
			$(e.target).prop("disabled", false); 

		    $(e.target).parent().find("span.error").show();
		    
			$("input#pwd").focus();
		}
		else {
			// 암호와 암호확인값이 같은 경우
			$("table#tblMemberRegister :input").prop("disabled", false);

		    $(e.target).parent().find("span.error").hide();
		}
			
	});// 아이디가 pwdcheck 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.	
		
	$("input#postcode").blur( (e) => {
			
    	const regExp_postcode = new RegExp(/^\d{5}$/);  
    	// 숫자 5자리만 들어오도록 검사해주는 정규표현식 객체 생성 
    
    	const bool = regExp_postcode.test($(e.target).val());	
    	const postcode = $(e.target).val().trim();
		
    	if(!bool || postcode=="") {
		// 우편번호가 정규표현식에 위배된 경우 
		
			$("table#tblMemberRegister :input").prop("disabled", true);  
			$(e.target).prop("disabled", false); 

	    	$(e.target).parent().find("span.error").show();
	     	
			$(e.target).val("").focus(); 
		}
		else {
			// 우편번호가 정규표현식에 맞는 경우 
			$("table#tblMemberRegister :input").prop("disabled", false);
			
			$("input#detailAddress").focus();
		    $(e.target).parent().find("span.error").hide();
		}
	
	});// 아이디가 postcode 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.


	// === "우편번호찾기"를 클릭했을 때 이벤트 처리하기 === //
	$("img#zipcodeSearch").click(function(){
	
		b_zipcodeSearch_click = true;
		// "우편번호찾기" 를 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도  
	
		// 주소를 쓰기가능 으로 만들기
		$("input#address").removeAttr("readonly");
       
        // 참고항목을 쓰기가능 으로 만들기
        $("input#extraAddress").removeAttr("readonly");

		new daum.Postcode({
        	oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            	addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

           	// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            	extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
            	extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraAddr !== ''){
            extraAddr = ' (' + extraAddr + ')';
            }
            
            // 조합된 참고항목을 해당 필드에 넣는다.
            document.getElementById("extraAddress").value = extraAddr;
               
            } else {
            	document.getElementById("extraAddress").value = '';
            }

           	// 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
            }
        }).open();
       
       // 주소를 읽기전용(readonly) 로 만들기
        $("input#address").attr("readonly", true);
        if($("input#extraAddress") != null){
        // 참고항목을 읽기전용(readonly) 로 만들기
            $("input#extraAddress").attr("readonly", true);	
        }
        else{
            $("input#extraAddress").value = null;
    	}
	});	//end of $("img#zipcodeSearch").click(function(){----------

	$("#phoneChk").click(function(){

	    alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
	    var phone = $("#phoneNumber").val();
	    $.ajax({
	        type:"POST", // post 형식으로 발송
	        url:"<%=ctxPath%>/NonMemberOrder/smsphoneCheck.bk", 
	        data: {phoneNumber:phone}, // 전송할 ㅔ이터값
	        cache : false,
	        success:function(data){
	            if(data == "error"){ //실패시 
	                alert("휴대폰 번호가 올바르지 않습니다.")
	            }else{            //성공시        
	                alert("휴대폰 전송이  됨.")
	                code2 = data; // 성공하면 데이터저장
	            }
	        }
	        
	    });
	}); //end of $("#phoneChk").click(function()---------------
	
	
	//휴대폰 인증번호 대조
	$("#phoneChk2").click(function(){
		if($("#phone2").val() == code2){ // 위에서 저장한값을 ㅣ교함
	    	alert('인증성공')
	        b_phone_click = true;
	    }else{
	        alert('인증실패!')
	        $("#phone2").val("");
	        b_phone_click = true;
	    }
	});
	
}); //end of $(document).ready(function(){---------------
	
function register() {
	
    window.location.href = "<%= ctxPath%>/member/memberRegister.bk"; //
}


//Function Declaration
//"가입하기" 버튼 클릭시 호출되는 함수
function goOrder() {
	
	// *** 필수입력사항에 모두 입력이 되었는지 검사하기 시작 *** //
	let b_requiredInfo = false;
	
	const requiredInfo_list = document.querySelectorAll("input.requiredInfo"); 
 	for(let i=0; i<requiredInfo_list.length; i++){
		const val = requiredInfo_list[i].value.trim();
		if(val == "") {
			alert("*표시된 필수입력사항은 모두 입력하셔야 합니다.");
		    b_requiredInfo = true;
		    break; 
		}
	}// end of for-----------------------------
  	
	if(b_requiredInfo) {
		return; // goOrder() 함수를 종료한다.
	}
	// *** 필수입력사항에 모두 입력이 되었는지 검사하기 끝 *** //

	
	// *** "우편번호찾기" 를 클릭했는지 검사하기 시작 *** //
	if(!b_zipcodeSearch_click) {
		// "우편번호찾기" 를 클릭 안 했을 경우
		alert("우편번호찾기를 클릭하셔서 우편번호를 입력하셔야 합니다.");
		return; // goOrder() 함수를 종료한다.
	}
	// *** "번호인증하기" 를 클릭했는지 검사하기 끝 *** //
	if(b_phone_click == false) {
		// "인증확인" 을 클릭 안 했을 경우
		alert("번호인증을 해야합니다.");
		return; // goOrder() 함수를 종료한다.
	}
	
	// *** 우편번호 및 주소에 값을 입력했는지 검사하기 시작 *** //
	const postcode = $("input#postcode").val().trim();
	const address = $("input#address").val().trim();
	const detailAddress = $("input#detailAddress").val().trim();
	const extraAddress = $("input#extraAddress").val()
	
	if(postcode == "" || address == "" || detailAddress == "") {
		alert("우편번호 및 주소를 입력하셔야 합니다.");
		return; // goRegister() 함수를 종료한다.
	}
	// *** 우편번호 및 주소에 값을 입력했는지 검사하기 끝 *** //


	// *** 약관에 동의를 했는지 검사하기 시작 *** //
	const checkbox_checked_length = $("input:checkbox[id='agree']:checked").length; 
	
	if(checkbox_checked_length == 0) {
		alert("이용약관에 동의하셔야 합니다.");
		return; // goRegister() 함수를 종료한다.
	}
	// *** 약관에 동의를 했는지 검사하기 끝 *** //
	
	const frm = document.registerFrm;
	frm.action = "NonMember_delivery.bk";
	frm.method = "post";
	frm.submit();
	
}// end of function goRegister()----------------------


function goReset() {
	
	$("span.error").hide();
	$("span#idcheckResult").empty();
	$("span#emailCheckResult").empty();
	
}// end of function goReset()------------------------- 





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
                  <a class="nav-item" href="#">고객센터</a>
               </td>
            </tr>
            <tr>
               <td><img alt="deliveryLogo" src="<%= ctxPath%>/image/deliverylogo.png"> 버거킹</td>
               <td>
                  <table style="margin-left: auto;">
                     <tr>
                        <td><button type="button" class="register_btn" onclick="register()">회원가입</button></td>
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
		   	<table id="tblMemberRegister">
			   	<thead>
			   		<tr>
			   			<th colspan="2">비회원 주문</th>
			   		</tr>
			   	</thead>
			   	
			   	<tbody>
			   		<tr>
			   			<td colspan="2"><i class="fa-solid fa-user"></i>기본정보</td>
			   		</tr>
			   		
			   		<tr>
						<td>주문번호&nbsp;<span class="star">*</span></td>
					    <td>
					        <%
					            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
					            String orderNum = sdf.format(new java.util.Date());
					        %>
					        <input type="text" name="ordernum" id="ordernum" class="requiredInfo" value="<%= orderNum %>" readonly />
					    </td>
					</tr>
			   		
			   		
			   		<tr>
			   			<td>성명&nbsp;<span class="star">*</span></td>
	                    <td>
	                       <input type="text" name="name" id="name" maxlength="30" class="requiredInfo" />
	                       <span class="error">성명은 필수입력 사항입니다.</span>
	                    </td>
			   		</tr>
			   		
			   		 <tr>
	                    <td>비밀번호&nbsp;<span class="star">* (숫자 6자리)</span></td>
	                    <td>
	                       <input type="password" name="pwd" id="pwd" maxlength="15" class="requiredInfo" />
	                       <span class="error">암호는 6글자로 입력하세요.</span>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td>비밀번호확인&nbsp;<span class="star">*</span></td>
	                    <td>
	                       <input type="password" id="pwdcheck" maxlength="15" class="requiredInfo" />
	                       <span class="error">암호가 일치하지 않습니다.</span>
	                    </td>
	                </tr>
			   		
			   		<tr>
	                    <td>우편번호</td>
	                    <td>
	                       <input type="text" name="postcode" id="postcode" size="6" maxlength="5" />&nbsp;&nbsp;
	                       <%-- 우편번호 찾기 --%>
	                       <img src="<%= ctxPath%>/image/b_zipcode.gif" id="zipcodeSearch" />
	                       <span class="error">우편번호 형식에 맞지 않습니다.</span>
	                    </td>
	                </tr>
			   		
			   		
			   		<tr>
	                    <td>주소</td>
	                    <td>
	                       <input type="text" name="address" id="address" size="40" maxlength="200" placeholder="주소" /><br>
	                       <input type="text" name="detailaddress" id="detailAddress" size="40" maxlength="200" placeholder="상세주소" />&nbsp;<input type="text" name="extraaddress" id="extraAddress" size="40" maxlength="200" placeholder="참고항목" />            
	                       <span class="error">주소를 입력하세요.</span>
	                    </td>
	                </tr>
			   		
			   		
			   		<tr>
	                    <td>연락처&nbsp;</td>
	                     <td>
	           				<input  class="signin_pass" id="phoneNumber" type="text" name="phoneNumber" title="전화번호 입력" placeholder="전화번호 입력해주세요">
	            			<input  class="signin_pass" type="button" value="입력" id="phoneChk">  // -를 제외하고 써주세요. 예시)010123456789
	        				
	           				<input  class="signin_pass" id="phone2" type="text" name="phone" title="전화번호 입력" placeholder="인증번호 입력해주세요">
	            			<input  class="signin_pass" type="button" value="인증확인" id="phoneChk2"> 
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
	                       <input type="button" class="Order_btn" value="가입하기" onclick="goOrder()" />
	                       <input type="reset"  class="cancel_btn" value="취소하기" onclick="goReset()" />
	                    </td>
	                </tr>
			   	</tbody>
		   	</table>
		</div>
	</form>
   	
<jsp:include page="../footer.jsp" /> 