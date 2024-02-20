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
<title>주문하기</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/kjy.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<style type="text/css">
	
@font-face {
    font-family: dabanggu;
    font-weight: 400;
    src: url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff2"),url(<%= ctxPath%>/font/Typo_DabangguB.ttf) format("woff");
} 

body {
	font-family: dabanggu;
	background-color: rgb(242,235,230);
}

div#main-div {
	width: 63%;
	margin: auto;
}

table#userInfo {
	width: 95%;
	height: 200px;
	background-color: white;
	font-size: 17pt;
	margin: 20px;
	padding: 20px;
}

table#orderInfo {
	width: 95%;
	height: 200px;
	background-color: white;
	font-size: 17pt;
	margin: 20px;
	padding: 20px;
}

table#userInfo > tbody > tr > td:first-child {
	border: solid 0px orange;
	width: 13%;
	padding-left: 35px;
}

button#viewOrder {
	border-radius: 10pt; 
	background-color: rgb(81,35,20); 
	border: none; width: 200px; 
	height: 60px;
	color: white;
}

table#payment {
	width: 95%;
	height: 200px;
	background-color: white;
	font-size: 17pt;
	margin: 20px;
	padding: 20px;
}

table#payment > tbody > tr > td:first-child {
	border: solid 0px orange;
	width: 85%;
	padding-left: 35px;
}

input {
	border: none;
}

button.LAST {
	height: 60px;
	width: 200px;
	font-size: 20pt;
	border-radius: 10pt;
	color: white;
}

#pname > table > tbody > tr > td:nth-child(1) {
	width: 60%;
	padding-left: 25px;
}

#pname > table > tbody > tr > td:nth-child(2) {
	width: 20%;
	padding-left: 10px;
}

#pname > table > tbody > tr > td:nth-child(3) {
	width: 20%;
	text-align: right;
	padding-left: 50px;
}

td#productPrice, td#tip, td#totalPrice {
	text-align: right;
}

span.error {
	color: red;
}

</style>


<%-- JS --%>
<script type="text/javascript">
	
	const jsonString = sessionStorage.getItem("productInfoArray");
	// 세션 스토리지에 string으로 저장된 값을 가져온다.	
		
	const objArray = JSON.parse(jsonString);
	// 객체 배열로 바꿔준다
		
	const arrLength = objArray.length; // 제품 배열의 길이
		
	$(document).ready(function(){
		
		$("span.error").hide(); // 문서가 로딩되었을 때 주소창 관련 에러메시지를 숨긴다.
		
		// 유저 정보를 뿌려준다 //
		const userAddress = "${sessionScope.loginuser.address}";
		const userMobile = "${sessionScope.loginuser.mobile}";
		
		$("input#address").val(userAddress);
		$("input#mobile").val(userMobile);
		// 유저 정보를 뿌려준다 끝 //
		
		// 세션스토리지에 저장된 배열의 길이만큼 상품 정보를 출력한다 시작 //
		let p_html = "<table>";
		
		for (let i = 0; i < objArray.length; i++) {
			
			p_html += "<tr><td>" + objArray[i].pname +"</td><td>"+ objArray[i].oqty + " 개	</td><td>"+ Number(objArray[i].price).toLocaleString('en') + " 원	</td></tr>";
			
        }

        p_html += "</table>";
        $("td#pname").html(p_html);
		
		let totalPrice = 0;
		
		for (let i = 0; i < objArray.length; i++) {
			  totalPrice += Number(objArray[i].price);
			}
	
		$("td#productPrice").html(totalPrice.toLocaleString('en')+"원");
		
		$("td#totalPrice").html((totalPrice+3000).toLocaleString('en')+"원");
		
		// 세션스토리지에 저장된 배열의 길이만큼 상품 정보를 출력한다 끝 //
		
		
		// === "우편번호찾기"를 클릭했을 때 이벤트 처리하기 === //
		$("img#zipcodeSearch").click(function(){
			
			b_zipcodeSearch_click = true;
			// "우편번호찾기" 를 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도
			
			// 주소를 쓰기가능 으로 만들기
			$("input#address").removeAttr("readonly");
	        
			// 참고항목을 쓰기가능 으로 만들기
			$("input#extraAddress").removeAttr("readonly");
			
			// 주소를 활성화 시키기
		//	$("input#address").removeAttr("disabled");
	        
			// 참고항목을 활성화 시키기
		//	$("input#extraAddress").removeAttr("disabled");
			
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
	        
		// 참고항목을 읽기전용(readonly) 로 만들기
		$("input#extraAddress").attr("readonly", true);	
	    
	    // 주소를 비활성화(disabled) 로 만들기    
	//	$("input#address").attr("disabled", true);
		
	    // 참고항목를 비활성화(disabled) 로 만들기    
	//	$("input#extraAddress").attr("disabled", true);
	
		});// end of $("img#zipcodeSearch").click(function()
		
		$("input#detailAddress").change(function(){
			$("span.error").hide();
		})
		
	});// end of $(document).ready(function(){})
	
	// 장바구니 수정 버튼을 클릭하면 장바구니 페이지로 경로이동 시킨다.
	function goCart() {
		if(confirm("장바구니로 이동하시겠습니까?")){
			window.location.href = "<%= ctxPath%>/shop/cartList.bk";
		}
	}
	
	// 주문하기 및 결제하기 함수
	function goOrder() {
		
		 if($("input#detailAddress").val().trim() == "") {
			 $("span.error").show();
			 return;
		 }
		
         const oqtyArr = new Array();        // 또는 const oqtyArr = [];
         const pqtyArr = new Array();        // 또는 const pqtyArr = [];
         const totalPriceArr = new Array();  // 또는 const totalPriceArr = [];
         
         for(let i=0; i<arrLength; i++) {
       		  
       		oqtyArr.push(objArray[i].oqty);
       		pqtyArr.push(objArray[i].pqty);
       		totalPriceArr.push(objArray[i].price);
       		
       	  }// end of for-----------------------------
       	  
       	 /*  console.log(pnumArr);
       	  console.log(typeof pnumArr);
       	  
       	  console.log(totalPriceArr);
       	  console.log(typeof pnumArr);
       	   */
         
       
	 for(let i=0; i<arrLength; i++) {
		if(Number(pqtyArr[i]) < Number(oqtyArr[i])) {
		// 주문할 제품중 아무거나 하나가 잔고량이 주문량 보다 적을 경우
              
		alert("제품번호 "+ pnumArr[i] +" 의 주문개수가 잔고개수 보다 더 커서 진행할 수 없습니다.");
		location.href="javascript:history.go(0)";
		return; // goOrder 함수 종료
		} 
	}// end of for---------------------------
         
       let n_sum_totalPrice = 0;
       for(let i=0; i<totalPriceArr.length; i++) {
       	n_sum_totalPrice += Number(totalPriceArr[i]);
       }// end of for-----------------------------
       
       n_sum_totalPrice += 3000; // 배달팁 3000원 포함된 가격
       
       
   if( confirm("총 주문액 " + n_sum_totalPrice.toLocaleString('en') + "원을 결제하시겠습니까?") ) {
       	
		// 코인충전 결제금액 선택하기 팝업창 띄우기
		const url = `<%= ctxPath%>/shop/productPurchase.bk?userid=${sessionScope.loginuser.userid}`;
		
		// 너비 850, 높이 640 인 팝업창을 화면 가운데 위치시키기
		const width = 850;
		const height = 640;
		
		const left = Math.ceil( (window.screen.width - width)/2 );  // 정수로 만듬
		const top = Math.ceil( (window.screen.height - height)/2 );	// 정수로 만듬
		window.open(url, "productPurchase",
				`left=\${left}, top=\${top}, width=\${width}, height=\${height}`);
	   
    }
       	
       	else {
       		alert("주문취소!");
       	} 
		
	}// end of goCart()
	
	
	// DB에 업데이트를 해주는 함수
	function goUpdate() {
		
		const pnumArr = new Array();        // 또는 const pnumArr = [];
        const oqtyArr = new Array();        // 또는 const oqtyArr = [];
        const pqtyArr = new Array();        // 또는 const pqtyArr = [];
        const cartnoArr = new Array();      // 또는 const cartnoArr = [];
        const totalPriceArr = new Array();  // 또는 const totalPriceArr = [];
        
        for(let i=0; i<arrLength; i++) {
      		  
      		pnumArr.push(objArray[i].pnum);
      		oqtyArr.push(objArray[i].oqty);
      		pqtyArr.push(objArray[i].pqty);
      		cartnoArr.push(objArray[i].cartno);
      		totalPriceArr.push(objArray[i].price);
      		
      	}// end of for-----------------------------
		
        const str_pnum = pnumArr.join(); // ajax로 데이터를 보내줄 것인데 getParameter 는 string 타입만 허용되기 때문에 배열을 string 타입으로 변환해준다.
        const str_oqty = oqtyArr.join();
        const str_cartno = cartnoArr.join();
        const str_totalPrice = totalPriceArr.join();
      	
     // 전송할 유저정보
        const deliveryAddress = $("input#address").val() + $("input#detailAddress").val() + $("input#extraAddress").val();
        const mobile = $("input#mobile").val();
        const orderRequest = $("input#orderRequest").val();
        
        let n_sum_totalPrice = 0;
        for(let i=0; i<totalPriceArr.length; i++) {
        	n_sum_totalPrice += Number(totalPriceArr[i]);
        }// end of for-----------------------------
        
        n_sum_totalPrice += 3000; // 배달팁 3000원 포함된 가격
        
    //    console.log(deliveryAddress);
    //    console.log(mobile);
    //    console.log(orderRequest);
    //    console.log("확인용 str_pnum :", str_pnum); 					// 확인용 str_pnum : 5,4,61
    //    console.log("확인용 str_oqty :", str_oqty); 					// 확인용 str_oqty : 1,1,5
    //    console.log("확인용 str_cartno :", str_cartno); 				// 확인용 str_cartno : 12,8,7
    //    console.log("확인용 str_totalPrice :", str_totalPrice); 		// 확인용 str_totalPrice : 33000,13000,40000
    //    console.log("확인용 n_sum_totalPrice :", n_sum_totalPrice); 	// 확인용 n_sum_totalPrice : 86000
        
        $.ajax({
        	url:"<%= ctxPath%>/shop/orderAdd.bk",
        	type:"post",
        	data:{"n_sum_totalPrice":n_sum_totalPrice,
        		  "str_pnum_join":str_pnum, // 자바에서 , 을 기준으로 split() 하면 배열로 반환함
        		  "str_oqty_join":str_oqty,
        		  "str_totalPrice_join":str_totalPrice,
        		  "str_cartno_join":str_cartno,
        		  "deliveryAddress":deliveryAddress,
        		  "mobile":mobile,
        		  "orderRequest":orderRequest
        		 },
        	dataType:"json",
        	success:function(json) { // json ==> {"isSuccess":1} 또는 {"isSuccess":0}
        		if(json.isSuccess == 1) {
                        location.href="<%= ctxPath%>/shop/orderList.bk";
                        sessionStorage.removeItem('productInfoArray');
                     }
                     else {
                        location.href="<%= ctxPath%>/shop/orderError.bk";
                     }
        	},
        	error: function(request, status, error){
	 	           alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 	    	}
        });
        
	}// end of goUpdate---------
	
</script>

</head>
<body>

	<div id="containr" style="width: 100%;">
		
		<div id="main-div">
	
			<h1 style="text-align: left; margin: 40px 0;">주문하기</h1>
			
			<form> <%-- 연락처, 요청사항을 넘기기 위한 form 태그 --%>
				<div style="font-size: 14pt;"><img src="<%= ctxPath%>/image/order_bike.png" />배달정보</div>
				<div style="background-color: white;">
					<table id="userInfo">
						<tr>
							<td>
								주소지
							</td>
							<td>
								<input type="text" name="postcode" id="postcode" size="6" maxlength="5" value="${sessionScope.loginuser.postcode}" readonly />&nbsp;&nbsp;
		                        <%-- 우편번호 찾기 --%>
		                        <img src="<%= ctxPath%>/image/b_zipcode.gif" id="zipcodeSearch" />
							</td>
						</tr>
						<tr>
							<td></td>
	                    <td>
	                       <input type="text" name="address" id="address" size="40" maxlength="200" placeholder="주소" value="${sessionScope.loginuser.address}" readonly />
	                       <input type="text" name="detailaddress" id="detailAddress" size="40" maxlength="200" placeholder="상세주소" value="${sessionScope.loginuser.detailaddress}"/>
	                       <span class="error" style="display: inline-block; margin-left: 100px;">상세주소를 입력하세요.</span>
	                       <input type="text" name="extraaddress" id="extraAddress" size="40" maxlength="200" placeholder="참고항목" value="${sessionScope.loginuser.extraaddress}" readonly />
	                    </td>
						</tr>
						<tr>
							<td>
								연락처
							</td>
							<td>
								<input id="mobile" type="text" size="25" />
							</td>
						</tr>
						<tr>
							<td>
								요청사항
							</td>
							<td>
								<input id="orderRequest" type="text" maxlength="50" size="50" placeholder="요청사항을 입력하세요" />
							</td>
						</tr>
					</table>
				</div>
				
				<%-- 메뉴정보 시작 --%>
				<div style="font-size: 14pt;"><img src="<%= ctxPath%>/image/order_burger.png" />주문정보</div>
				<div style="background-color: white;">
					<table id="orderInfo">
						<tr>
							<td id="pname" style="font-size: 24pt;">

							</td>
						</tr>

					</table>
				</div>
				
				<div style="font-size: 14pt;"><img src="<%= ctxPath%>/image/won.png" />최종 결제금액</div>
				<div style="background-color: white;">
					<table id="payment">
						<tr>
							<td>
								제품금액
							</td>
							<td id="productPrice">
								
							</td>
						</tr>
						<tr>
							<td>
								배달팁
							</td>
							<td id="tip">
								3,000원
							</td>
						</tr>
						<tr>
							<td>
								최종 결제금액
							</td>
							<td id="totalPrice" style="color: rgb(226,34,25);">
								
							</td>
						</tr>
					</table>
				</div>
				
				<div style="width:100%;">
					<div id="button_group" style="float: right;">
						<button class="LAST" style="background-color: rgb(81,35,20); border: solid 1px;" type="button" onclick="goCart()">
							장바구니수정
						</button>
						<button class="LAST" style="background-color: rgb(226,34,25); border: none;" type="button" onclick="goOrder()">
							결제하기
						</button>
					</div>
				</div>
				
			</form>
			
		</div>
		
	
	</div>

</body>
</html>