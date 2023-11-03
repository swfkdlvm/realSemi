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
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/pys.css/myshop/cartList.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 


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
	
	
	
	
	
});//end of $(document).ready(function(){
//Function declaration

function allCheckBox() {

   const bool = $("#allCheckOrNone").is(":checked");
   /*
      $("#allCheckOrNone").is(":checked"); 은
        선택자 $("#allCheckOrNone") 이 체크되어지면 true를 나타내고,
        선택자 $("#allCheckOrNone") 이 체크가 해제되어지면 false를 나타내어주는 것이다.
   */
   
   $(".chkboxpnum").prop("checked", bool);
}// end of function allCheckBox()-------------------------


//=== 장바구니 현재주문수량 수정하기 === // 
function goOqtyEdit(obj) {
   	   
	   const index = $("button.updateBtn").index(obj);
	   //alert(index);
	   
	   const cartno = $("input.cartno").eq(index).val(); // 장바구니번호
	   // 배열중에서 몇번째 요소를 꺼내오는것과 같은느낌
	   
	   const oqty = $("input.oqty").eq(index).val(); // 수정개수
	   
	   //console.log(`장바구니번호 : \${cartno}, 수정개수 : \${oqty}`);
	   
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
			   url:"<%= ctxPath%>/shop/cartEdit.bk",
			   type:"post",
			   data:{"cartno":cartno, 
				     "oqty":oqty},
			   dataType:"json",
			   success:function(json){
				   //console.log("~~ 확인용 ", JSON.stringify(json));
				   // ~~~~ 확인용 {"n":1}
				   
				   if(json.n == 1) {
					   alert("주문수량이 변경되었습니다.")
					   location.href = "<%= ctxPath%>/shop/cartList.bk"; // 장바구니 보기 페이지로 간다.
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
   		
			
		   
		   $.ajax({
			   url:"<%=ctxPath%>/shop/cartDel.bk",
			   type:"post",
			   data:{"cartno":cartno},
			   dataType: "json",
			   success:function(json){
				   console.log("~~ 확인용 ", JSON.stringify(json));
				   // ~~~~ 확인용 {"n":1}
				   
				   if(json.n == 1) {
					   //장바구니가 변경되었으므로 다시 새로고침을 한다.
					   location.href = "cartList.bk"; // 장바구니 보기 페이지로 간다.
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
    window.history.back();
}

//=== 장바구니에서 제품 주문하기 === // 
function goOrder() {
	   
	   
	   //// === 체크박스의 체크된 개수(checked 속성이용) == ////
	   
	 const checkCnt = $("input:checkbox[name='pnum']:checked").length;
	 
	   if(checkCnt < 1) {
		   alert("주문하실 제품을 선택하세요!!");
		   return; //종료
		}
	   
	   else {
			//// === 체크박스의 체크된 개수(checked 속성이용) == //// 
			//// === 체크가 된 것만 읽어와서 배열에 넣어준다. === ////
			const allCnt = $("input:checkbox[name='pnum']").length;
			
		 const pnumArr = new Array();        // 또는 const pnumArr = [];
         const oqtyArr = new Array();        // 또는 const oqtyArr = [];
         const cartnoArr = new Array();      // 또는 const cartnoArr = [];
         const totalPriceArr = new Array();  // 또는 const totalPriceArr = [];
         const pqtyArr = new Array();
         
         for(let i=0; i<allCnt; i++){
         	
         	if( $("input:checkbox[name='pnum']").eq(i).prop("checked") ) {
         	    
         		/* console.log("제품번호 : " , $("input:checkbox[name='pnum']").eq(i).val() ); 
         	    console.log("주문량 : " , $("input.oqty").eq(i).val() );
         	    console.log("삭제해야할 장바구니 번호 : " , $("input.cartno").eq(i).val() ); 
         	    console.log("주문한 제품의 개수에 따른 가격합계 : " , $("input.totalPrice").eq(i).val() );
         	    console.log("주문한 제품의 개수에 따른 포인트합계 : " , $("input.totalPoint").eq(i).val() );
         	    console.log("============================") */
         	    
         	     pnumArr.push( $("input:checkbox[name='pnum']").eq(i).val() );
                 oqtyArr.push( $("input.oqty").eq(i).val() );
                 cartnoArr.push( $("input.cartno").eq(i).val() );
                 totalPriceArr.push( $("input.totalPrice").eq(i).val() );
                 pqtyArr.push( $("input.pqty").eq(i).val() );
                 
         	}
         
         }//end of for
         
         for(let i=0; i<checkCnt; i++) {
             if(Number(pqtyArr[i]) < Number(oqtyArr[i])) {
                // 주문할 제품중 아무거나 하나가 잔고량이 주문량 보다 적을 경우
                
                alert("제품번호 "+ pnumArr[i] +" 의 주문개수가 잔고개수 보다 더 커서 진행할 수 없습니다.");
             location.href="javascript:history.go(0)";
             return; // goOrder 함수 종료
             } 
          }// end of for---------------------------
         
      const str_pnum = pnumArr.join();
      const str_oqty = oqtyArr.join();
      const str_cartno = cartnoArr.join();
      const str_totalPrice = totalPriceArr.join();
      
      
      let n_sum_totalPrice = 0;
      for(let i=0; i<totalPriceArr.length; i++ ){
     	 n_sum_totalPrice += Number(totalPriceArr[i]);
     	 
      }//end of for 
      
      
      
      console.log("확인용 str_pnum : ", str_pnum); 					//확인용 str_pnum :  34,36,63
      console.log("확인용 str_oqty : ", str_oqty); 					//확인용 str_oqty :  4,3,3
      console.log("확인용 str_cartno : ", str_cartno); 				//확인용 str_cartno :  6,5,4
      console.log("확인용 str_totalPrice : ", str_totalPrice); 		//확인용 str_totalPrice :  4000000,3000000,57000
      console.log("확인용 n_sum_totalPrice : ", n_sum_totalPrice); //확인용 n_sum_totalPrice :  7057000
     
      
      
      	
      		
      		
      		if( confirm("총주문액 " + n_sum_totalPrice.toLocaleString('en') + "원을 결제하시겠습니까?")){
      			
      			
      			
      			$.ajax({
      				url:"<%=ctxPath%>/shop/orderAdd.bk",
      				type:"post",
      				data:{"n_sum_totalPrice":n_sum_totalPrice,
      					  "str_pnum_join":str_pnum,
      					  "str_oqty_join":str_oqty,
      					  "str_totalPrice_join":str_totalPrice,
      					  "str_cartno_join":str_cartno 
      					},
      				dataType:"json",
      				success:function(json){
      					
      				},
      				error: function(request, status, error){
      	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      	            }
      				
      			});
      		}
      		
      		
      	
      	
   		
	   }
	   
  
   
}// end of function goOrder()----------------------


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
								<td>${(sessionScope.loginuser).name}님 안녕하세요</td>
							</tr>
							<tr>
								<td><a href="<%= ctxPath%>/member/mypage.bk?userid=${(sessionScope.loginuser).userid}">MY킹 바로가기  ></a></td>
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
							<td style="font-weight: bold">딜리버리 주문내역</td>
						</tr>
						<tr>
							<td class="smtd">주문내역이 없습니다.</td>
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
							<td style="font-weight: bold">카트</td>
						</tr>
						<tr>
							<td class="smtd">카트에 담은 상품이 없습니다.</td>
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
			    <li class="nav-item">
			      <a class="nav-link disabled text-white" href="#" tabindex="-1" aria-disabled="true">배달지를 선택하세요</a>
			    </li>
			    <li class="nav-item">
			    	<button id="change" type="button" class="btn btn-light">변경</button>
			    </li>
			  </ul>
			</nav>
			</div>
			
			
			
			<c:if test="${empty requestScope.cartList}">
               <tr>
                    <td colspan="6" align="center">
                      <span style="color: red; font-weight: bold;">
                         장바구니에 담긴 상품이 없습니다.
                      </span>
                    </td>   
               </tr>
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
						<input type="hidden" class="cartno" value="${cartvo.cartno}" />
						<input type="hidden" class="pqty" value="${cartvo.prod.pqty}" />
						<input type="hidden" class="totalPrice" value="${cartvo.prod.totalPrice}" />
						
						</div>
						
				</div>
			</div>
			</c:forEach>
     		 
			
			
			<div id="sumcount">
				<span>총 주문금액</span>
				<span id="totalprice" ><fmt:formatNumber value="${requestScope.sumMap.SUMTOTALPRICE}" pattern="###,###" />원</span>
			</div>
			
			<div id="caution">
				<ul>
					<li>주문서를 작성하기 전에 선택하신 상품명, 수량 및 가격이 정확한지 확인해주세요.</li>
					<li>해당매장의 주문배달 최소금액은 14,000원 입니다.</li>
				</ul>
				<button type="button" id="addmenu" onclick="goBack()">메뉴추가+</button>
				<button type="button" id="goOrder" onclick="goOrder()">주문하기</button>
			
			</div>
			
		</div>
		
		</c:if>
</body>
</html>