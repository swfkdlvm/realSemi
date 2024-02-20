<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
    
<%
    String ctxPath = request.getContextPath();
    //    /tempSemi
%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/msh.css/NonMember/NonMember_cartList.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/kjy.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 


<style>
#selection{
	margin-left:55px;
	margin-top:30px;
	background-color:white;
	width:1000px;
}

#selection > ul{
	margin-left:20px;
	font-size:17pt;
}
#finaladdress{
	margin-left:60px;
	margin-top:40px;
	font-size:20pt;
	position:relative;
	top:20px;
}

#phonenumber{
	border:none;
}
</style>

<script type="text/javascript">


$(document).ready(function(){
	 
	// 제품번호의 모든 체크박스가 체크가 되었다가 그 중 하나만 이라도 체크를 해제하면 전체선택 체크박스에도 체크를 해제하도록 한다.
	$(".chkboxpnum").click(function(){
       
    let bFlag = false;
    	$(".chkboxpnum").each(function(){
        	const bChecked = $(this).prop("checked");
        	if(!bChecked) {
            	$("#allCheckOrNone").prop("checked",false);
            	bFlag = true;
             	return false;
        	}
        });
       
       if(!bFlag) {
          $("#allCheckOrNone").prop("checked",true);
       }
       
    });
	
	
    $("#go_menu").on("click", function() {
    	const ordernum = $("input.fk_ordernum").val();
        console.log("ordernum: ", ordernum);

        var form = $('<form action="/tempSemifinal/NonMemberOrder/NonMember_deliverycart.bk" method="post"></form>');
        form.append('<input type="hidden" name="ordernum" value="' + ordernum + '">');
        $('body').append(form);
        form.submit();
    });
	
    // === "우편번호찾기"를 클릭했을 때 이벤트 처리하기 === //
	$("img#zipcodeSearch").click(function(){
		// 주소를 쓰기가능 으로 만들기
		$("#address").removeAttr("readonly");
        
        // 참고항목을 쓰기가능 으로 만들기
        $("#extraAddress").removeAttr("readonly");

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
        $("#address").attr("readonly", true);
        if($("#extraAddress") != null){
        // 참고항목을 읽기전용(readonly) 로 만들기
        	$("#extraAddress").attr("readonly", true);	
        }
        else{
        	$("#extraAddress").value = null;
        }
	});	
	
});//end of $(document).ready(function(){----------
	
//Function declaration

function redirectToIndex() {
    const allCnt = $("input:checkbox[name='pnum']").length;
    let name = $("#name").val();
    let phonenumber = $("#phonenumber").val();
    let address = $("#address").val();
    let detailAddress = $("#detailAddress").val();
    let extraAddress = $("#extraAddress").val();
    let deliveryaddress = address + " " + detailAddress + " " + extraAddress;
    let successCount = 0;

    for (let i = 0; i < allCnt; i++) {
        if ($("input:checkbox[name='pnum']").eq(i).prop("checked")) {
            let oqty = $("input.oqty").eq(i).val();
            let price = parseInt($("input.price").eq(i).val());
            let fk_ordernum = $("input.fk_ordernum").eq(i).val();
            let pname = $("input.pname").eq(i).val();
            let pnum = $("input.pnum").eq(i).val();

            $.ajax({
                url: "<%= ctxPath%>/NonMemberOrder/NonMember_orderAdd.bk",
                type: "post",
                data: {
                    "oqty": oqty,
                    "price": price,
                    "fk_ordernum": fk_ordernum,
                    "pname": pname,
                    "pnum": pnum,
                    "name": name,
                    "phonenumber": phonenumber,
                    "deliveryaddress": deliveryaddress,
                },
                dataType: "json",
                success: function (json) {
                    successCount++;

                    if (successCount === allCnt) {
                        // 모든 요청이 성공했을 때만 이동
                        location.href = "<%= ctxPath%>/NonMemberOrder/NonMember_Complete.bk";
                    }
                },
                error: function (request, status, error) {
                    alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
                    successCount++;  
                    if (successCount === allCnt) {
                        // 모든 요청이 완료되었을 때만 이동
                        location.href = "<%= ctxPath%>/NonMemberOrder/NonMember_Complete.bk";
                    }
                }
            });
        }//end of if ($("input:checkbox[name='pnum']").eq(i).prop("checked")) {-------
    }//end of for (let i = 0; i < allCnt; i++) {------------
}
    
function allCheckBox() {
	const bool = $("#allCheckOrNone").is(":checked");
    $(".chkboxpnum").prop("checked", bool);
}// end of function allCheckBox()-------------------------

//=== 장바구니 현재주문수량 수정하기 === // 
function goOqtyEdit(obj) {
	const index = $("button.updateBtn").index(obj);
	const cartno = $("input.cartno").eq(index).val(); // 장바구니번호
	const oqty = $("input.oqty").eq(index).val(); // 수정개수
	   
	const ordernum = $("input.fk_ordernum").val();
	   
	const regExp = /^[0-9]+$/g;// 숫자만 체크하는 정규표현식 
	   
	const bool = regExp.test(oqty);
	   
	if(!bool) {
		alert("수정하시려는 수량은 0개 이상이어야 합니다.");
		location.href="javascript:history.go(0)";
		return; // 함수 종료
	}
	   
	if(oqty == "0") {
		goDel(cartno); // 해당 장바구니 번호 비우기 
	}
	else {
		$.ajax({
			url:"<%=ctxPath%>/NonMemberOrder/NonMember_cartEdit.bk",
			type:"post",
			data:{"cartno":cartno, 
				  "oqty":oqty, "ordernum":ordernum},
			dataType:"json",
			success:function(json){
				if(json.n == 1) {
					alert("주문수량이 변경되었습니다.")
					redirectToCartList(ordernum, address); // 장바구니 보기 페이지로 간다.
				}
			},
			error: function(request, status, error){
		    	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
				   
		});
	}
	   
}// end of function goOqtyEdit(obj)-----------------
// === 장바구니에서 특정 제품을 비우기 === //  
function goDel(cartno) {
	const ordernum = $("input.fk_ordernum").val();
		$.ajax({
			url:"<%=ctxPath%>/NonMemberOrder/NonMember_cartDel.bk",
			type:"post",
			data:{"cartno":cartno,"ordernum":ordernum },
			dataType: "json",
			success:function(json){
				console.log("~~ 확인용 ", JSON.stringify(json));
				   // ~~~~ 확인용 {"n":1}
				   
				 if(json.n == 1) {
					   //장바구니가 변경되었으므로 다시 새로고침을 한다.
					redirectToCartList(ordernum); // 장바구니 보기 페이지로 간다.
				 }
				  
			 },
			 error: function(request, status, error){
	         	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	         }
		});
}// end of function goDel(cartno)---------------------------

function oqtyminus(obj) {
    const index = $("button.minus").index(obj);
    const value = parseInt($("input.oqty").eq(index).val()); // 장바구니번호

    if (value > 0) {
        $("input.oqty").eq(index).val(value - 1);
    }
}

function oqtyplus(obj) {
    const index = $("button.plus").index(obj);
    const value = parseInt($("input.oqty").eq(index).val()); // 장바구니번호
    $("input.oqty").eq(index).val(value + 1);
}

function goBack() {
	const ordernum = $("input.fk_ordernum").val();
    var form = $('<form action="/tempSemifinal/NonMemberOrder/NonMember_deliverycart.bk" method="post"></form>');
    form.append('<input type="hidden" name="ordernum" value="' + ordernum + '">');
    $('body').append(form);
    form.submit();
}

function goOrder() {
    // 체크박스의 체크된 개수(checked 속성 이용)
    const checkCnt = $("input:checkbox[name='pnum']:checked").length;

    if (checkCnt < 1) {
        alert("주문하실 제품을 선택하세요!!");
        return; // 종료
    } else {
        const postcode = $("input#postcode").val().trim();
        const address = $("input#address").val().trim();
        const detailAddress = $("input#detailAddress").val().trim();
        const phonenumber = $("input#phonenumber").val().trim(); // 폰 번호 추가

        if (postcode === "" || address === "" || detailAddress === "" || phonenumber === "") {
            alert("주문 정보를 모두 입력하셔야 합니다.");
            return;
        }

        let proceedToOrder = true;
        let totalprice_calc = 0;

        // 체크된 체크박스만 가져오기
        const allCnt = $("input:checkbox[name='pnum']").length;

        for (let i = 0; i < allCnt; i++) {
            if ($("input:checkbox[name='pnum']").eq(i).prop("checked")) {
                let oqty = $("input.oqty").eq(i).val();
                let pqty = $("input.pqty").eq(i).val();
                let price = parseInt($("input.price").eq(i).val());
                totalprice_calc += price * parseInt(oqty);

                if (parseInt(pqty) < parseInt(oqty)) {
                    alert("-메뉴- " + $("input.pname").eq(i).val() + " 의 주문개수가 잔고개수보다 더 많습니다.");
                    proceedToOrder = false;
                    break; // each 함수 종료
                }
            }
        }//end of for (let i = 0; i < allCnt; i++) {-----

        if (!proceedToOrder) {
            location.href = "javascript:history.go(0)";
            return;
        }

        if (totalprice_calc < 14000) {
            alert("최소주문 금액 14000원 이상입니다.");
            return;
        }

        const n_sum_totalPrice = totalprice_calc + 3000; // 배달팁 3000원 포함된 가격

        const url = `<%= ctxPath %>/NonMemberOrder/NonMember_productPurchase.bk?phonenumber=` + phonenumber;

        if (confirm("총 주문액 (배달팁 3000원 포함)" + n_sum_totalPrice.toLocaleString('en') + "원을 결제하시겠습니까?")) {
            const width = 1000;
            const height = 500;
            const left = Math.ceil((window.screen.width - width) / 2);
            const top = Math.ceil((window.screen.height - height) / 2);
            window.open(url, "productPurchase", `left=${left}, top=${top}, width=${width}, height=${height}`);
        } else {
            alert("주문취소!");
        }
    }// end of  else {---------------
}// end of function goOrder() {--------------

function checkDelete() {
////=== 체크박스의 체크된 개수(checked 속성이용) == ////
	const checkCnt = $("input:checkbox[name='pnum']:checked").length;
	if(checkCnt < 1) {
		alert("삭제하실 제품을 체크하세요!!");
		return; //종료
	}
	   
	else {
		//// === 체크박스의 체크된 개수(checked 속성이용) == //// 
		//// === 체크가 된 것만 읽어와서 배열에 넣어준다. === ////
		const allCnt = $("input:checkbox[name='pnum']").length;
		
		for(let i=0; i<allCnt; i++){
	        	
	    	if( $("input:checkbox[name='pnum']").eq(i).prop("checked") ) { 	
	       		let cartno = $("input.cartno").eq(i).val();
	        	goDel(cartno);
	        	    
	        }
		}
	}
}//end of checkDelete()


function redirectToCartList(ordernum,address) {
    var form = $('<form action="/tempSemifinal/NonMemberOrder/Nonmember_cartList.bk" method="post"></form>');

    form.append('<input type="hidden" name="ordernum" value="' + ordernum + '">');
    $('body').append(form);
    form.submit();
}	




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
						<a class="nav-item" href="<%= ctxPath%>/login/logout.bk">로그아웃</a>
						<a class="nav-item" href="#">MY킹</a>
						<a class="nav-item" href="#">고객센터</a>
					</td>
				</tr>
				
				
				<tr>
					<td><img alt="deliveryLogo" src="<%= ctxPath%>/image/deliverylogo.png"> 딜리버리</td>
					<td>
						<table style="margin-left: auto;">
							<tr>
								<td rowspan="2"><img alt="man" src="<%= ctxPath%>/image/man.png" style="padding-right: 10px;"></td>
								<%--<td>${(sessionScope.loginuser).name}님 안녕하세요</td>--%>
							</tr>
							<tr>
								<%--<td><a href="<%= ctxPath%>/member/mypage.bk?userid=${(sessionScope.loginuser).userid}">MY킹 바로가기  ></a></td>--%>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</nav>
	<%-- 헤더끝 --%>
	
	<div id= "rlcontainer">
	
		<div id= "container" class="container-fluid p-4 text-white" style="background-color: #333332;">
			<div>
				<table id="firsttbl" class="ordcrt">
					<tbody>
						<tr>
							<td rowspan="2"><a class="navbar-brand" href="#"><img alt="deliveryLogo" src="<%= ctxPath%>/image/bike.png"></a></td>
							<td style="font-weight: bold">배달비용</td>
						</tr>
						<tr>
							<td class="smtd">배달비용은 3000원이 추가됩니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<span style="border-left: solid 1px white;"></span>
			<div>
				<table id="secondtbl" class="ordcrt">
					<tbody>
						<tr>
							<td rowspan="2"><img alt="deliveryLogo" src="<%= ctxPath%>/image/cart.png"></td>
							<td style="font-weight: bold">비회원 딜리버리 서비스!</td>
						</tr>
						<tr>
							<td class="smtd">카트에 담은 메뉴를 금방 배달 해드립니다</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: black;">
			  <!-- Links 추가하기 -->
			  <ul id="leftbar" class="navbar-nav mr-auto">
			    <li class="nav-item">
			      <a class="nav-link text-white" href="#">딜리버리</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-white" href="#">>&nbsp;&nbsp;&nbsp;&nbsp;장바구니</a>
			    </li>
			  </ul>
			  <ul id="rightbar" class="navbar-nav ml-auto">  
			    
			  </ul>
		</nav>
	</div>
			
			
			
	<c:if test="${empty requestScope.cartList}">
    	<div class="container" style="width:100%; display:flex;">
        	<div style="margin:auto;">
        		<span style="color: red; font-weight: bold; display:block">장바구니에 담긴 상품이 없습니다.</span>
        		<button type="button" id="go_menu" style="margin-left:30px; border-radius:10px; background-color:rgb(81,35,20); color:white;"> 메뉴선택으로 돌아가기</button>
        	</div> 
        </div>    
    </c:if> 
     
    <c:if test="${not empty requestScope.cartList}">
     	
     	<%--장바구니 본문 시작 --%>
		<div class="container" style="background-color: rgb(242,235,230);">
		<span id="menu_delivery">딜리버리 카트</span>
		<div>
			<input type="checkbox"  id="allCheckOrNone" onClick="allCheckBox();" style='zoom:3.0;'  />
			<label for ="allCheckOrNone" ><span id="selectAllLabel" style="display:inline-block; margin-bottom:20px;">전체선택</span></label>
			<button type="button" id="delete_btn" onclick="checkDelete()" >삭제</button> 
		</div>
			
		<c:forEach var="cartvo" items="${requestScope.cartList}" varStatus="status">
     	<%--상품 들어가기 시작 --%>
			<div id="cartproduct">
				<div id="cartList">
					<button type="button" id="deletecart" onclick="goDel('${cartvo.cartno}')"><img src="<%= ctxPath%>/image/x버튼.png"/></button>
						<table id="cardtable">
							<tbody>
								<tr>
									<td rowspan="3" width="50px;"><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value="${cartvo.fk_pnum}" style='zoom:3.0; margin-bottom:40px; margin-left:10px;'  /></td>
									<td><span id="productname" class="cart_pname">${cartvo.prod.pname}</span></td>
									<td rowspan="3"><img src="<%= ctxPath%>/image/${cartvo.prod.pimage}" style="width:250px; margin-left:200px;"/></td>
								</tr>
								
								<tr>
									<td><span>${cartvo.prod.pdetail}</span></td>
								</tr>
									
								<tr>
									<td><fmt:formatNumber value="${cartvo.prod.price}" pattern="###,###" />원</td>
								</tr>
							</tbody>
						</table>
						
						<div style="margin-top:50px">
							<span id="cartcount">수량</span>
			                <button type="button" class="minus" onclick="oqtyminus(this)" style="background-color:gray;"><img src="<%= ctxPath%>/image/마이너스버튼.png"/></button>
			                <input type="text" class="oqty" value="${cartvo.oqty}" style="width:50px;"/>
			                <button type="button" class="plus" onclick="oqtyplus(this)" style="background-color:gray;"><img src="<%= ctxPath%>/image/플러스버튼.png"/></button>
			                <button type="button" class="updateBtn" style="margin-left:50px;" onclick="goOqtyEdit(this)">수정하기</button>
			                <span id="totalcount"  style="margin-left:200px;">합계금액:<fmt:formatNumber value="${cartvo.prod.totalPrice}" pattern="###,###" />원</span>
			                <input type="hidden" class="pname" value="${cartvo.prod.pname}" />
			                <input type="hidden" class="cartno" value="${cartvo.cartno}" />
			                <input type="hidden" class="pqty" value="${cartvo.prod.pqty}" />
			                <input type="hidden" class="totalPrice" value="${cartvo.prod.totalPrice}" />
			                <input type="hidden" class="price" value="${cartvo.prod.price}" />
							<input type="hidden" class="fk_ordernum" value="${cartvo.fk_ordernum}" />	
							<input type="hidden" class="pnum" value="${cartvo.fk_pnum}" />	
						</div>	
				</div>
			</div>
		</c:forEach>
     		 
			
			
			<div id="sumcount">
				<span>총 주문금액</span>
				<span id="totalprice" ><fmt:formatNumber value="${requestScope.sumMap.SUMTOTALPRICE}" pattern="###,###" /><span id="totalprice_calc" style="display:none">${requestScope.sumMap.SUMTOTALPRICE}</span></span>
			</div>
			
			<div id="finaladdress">최종 배송지 및 주문정보</div>
				<c:forEach var="cart" items="${requestScope.infoList}" varStatus="status">
			   		<div id="selection"> 
			   		   <ul>	
			   		       <li class="edit">주문번호: <span id="ordernum" class="ordernum" style="width:50px;">${cart.ordernum}</span></li>
			   		       <li class="edit">전화번호: <input type="text" id="phonenumber" class="phonenumber" value="${cart.phonenumber}" readonly/></li>
				           <li class="edit">이름: <input id="name" class="name" value="${cart.name}"/></li>
				           <li class="edit">우편번호: <input type="text"  name="postcode" id="postcode" size="6" maxlength="5" class="postcode" value="${cart.postcode}" />&nbsp;&nbsp;
	                       <img src="<%= ctxPath%>/image/b_zipcode.gif" id="zipcodeSearch" />
					       <li class="edit">주소: <input type="text" name="address" id="address" value="${cart.address}" /></li>
					       <li class="edit">상세주소: <input type="text" name="detailAddress" id="detailAddress" value="${cart.detailaddress}"/></li>
					       <li class="edit">추가주소: <input type="text" name="extraAddress" id="extraAddress" value="${cart.extraaddress}" /></li>
					   </ul>
			    	</div>
			    	    <input type="hidden" name="phonenumber" id="phonenumber" value="${cart.phonenumber}" />
				</c:forEach>
			
			<div id="caution">
				<ul>
					<li>주문서를 작성하기 전에 선택하신 상품명, 수량 및 가격이 정확한지 확인해주세요.</li>
					<li>해당매장의 주문배달 최소금액은 14,000원 입니다.</li>
					<li>최종금액에 배달팁 3000원이 포함됩니다. (주문금액+3000원)</li>
				</ul>
				<button type="button" id="addmenu" onclick="goBack()">메뉴추가+</button>
				<button type="button" id="goOrder" onclick="goOrder()">주문하기</button>
			</div>
			
		</div>
		
	</c:if>
	<form id="orderForm" action="<%= ctxPath %>/NonMemberOrder/Nonmember_cartListEnd.bk" method="post"></form>
</body>
</html>