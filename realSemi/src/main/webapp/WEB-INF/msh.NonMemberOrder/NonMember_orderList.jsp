
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>


<style type="text/css" >
   table#tblorder_map_List {width: 95%;
                       margin-top: 20px;
                       margin-left: 10px;
                       margin-bottom: 20px;}
                      
   table#tblorder_map_List th {border: solid gray 1px;}
   table#tblorder_map_List td {border: dotted gray 1px;} 
</style>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/kjy.css/footer.css"/>
<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/kjy.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<script type="text/javascript">

   $(document).ready(function(){
      
       $("input#btnDeliverStart").click(function(){
          // 배송하기 버튼 클릭시
         
          const chkDeliverStart_length = $("input:checkbox[class='chkDeliverStart custom_input']:checked").length;
          // 배송하기 체크박스에 체크가 되어진 개수
          // class 가 복합으로 이루어진 경우 class='chkDeliverStart custom_input' 와 같이 해야하지 class=chkDeliverStart 으로 하면 안된다.
         
          const chkDeliverEnd_length = $("input:checkbox[class='chkDeliverEnd custom_input']:checked").length;
          // 배송완료 체크박스에 체크가 되어진 개수
          // class 가 복합으로 이루어진 경우 class='chkDeliverEnd custom_input' 와 같이 해야하지 class=chkDeliverStart 으로 하면 안된다.
      
         
          if(chkDeliverStart_length == 0) {
             alert("먼저 하나이상의 배송을 시작할 제품을 선택하셔야 합니다.");
             return; // 종료 
          }
         
          if(chkDeliverEnd_length > 0) {
             alert("배송하기만 선택하셔야 합니다.");
             return; // 종료 
          }
         
          $("input.custom_input").prop("disabled", true); 
          // 배송하기 및 배송완료 관련 모든 input 태그 비활성화 시키기
         
          $("input:checkbox[class='chkDeliverStart custom_input']:checked").prop("disabled", false);
          // 체크되어진 배송하기 체크박스(제품번호값을 가지고 있음)만 활성화 시키기
         
          $("input:checkbox[class='chkDeliverStart custom_input']:checked").next().next().prop("disabled", false);
          // 체크되어진 배송하기의 주문코드(전표)만 활성화 시키기
         
          const frm = document.frmDeliver;
          frm.method = "post";
          frm.action = "<%= ctxPath%>/NonMemberOrder/NonMemberOrder_deliverStart.bk";
          frm.submit();

      });// end of $("input#btnDeliverStart").click()------------------
      
      
      $("input#btnDeliverEnd").click(function(){
          // 배송완료 버튼 클릭시
         
          const chkDeliverStart_length = $("input:checkbox[class='chkDeliverStart custom_input']:checked").length;
          // 배송하기 체크박스에 체크가 되어진 개수
          // class 가 복합으로 이루어진 경우 class='chkDeliverStart custom_input' 와 같이 해야하지 class=chkDeliverStart 으로 하면 안된다.
         
          const chkDeliverEnd_length = $("input:checkbox[class='chkDeliverEnd custom_input']:checked").length;
          // 배송완료 체크박스에 체크가 되어진 개수
          // class 가 복합으로 이루어진 경우 class='chkDeliverEnd custom_input' 와 같이 해야하지 class=chkDeliverStart 으로 하면 안된다.
      
         
          if(chkDeliverEnd_length == 0) {
             alert("먼저 하나이상의 배송을 완료할 제품을 선택하셔야 합니다.");
             return; // 종료 
          }
         
          if(chkDeliverStart_length > 0) {
             alert("배송완료만 선택하셔야 합니다.");
             return; // 종료 
          }
         
          $("input.custom_input").prop("disabled", true); 
          // 배송하기 및 배송완료 관련 모든 input 태그 비활성화 시키기
         
          $("input:checkbox[class='chkDeliverEnd custom_input']:checked").prop("disabled", false);
          // 체크되어진 배송완료 체크박스(제품번호값을 가지고 있음)만 활성화 시키기
         
          $("input:checkbox[class='chkDeliverEnd custom_input']:checked").next().next().prop("disabled", false);
          // 체크되어진 배송완료의 주문코드(전표)만 활성화 시키기
         
          const frm = document.frmDeliver;
          frm.method = "post";
          frm.action = "<%= ctxPath%>/NonMemberOrder/NonMemberOrder_deliverEnd.bk";
          frm.submit();   
         
      });// end of $("input#btnDeliverEnd").click()------------------
      
      
   }); // end of $(document).ready()--------------------------
   
   
   // Function Declartion
   
   function allCheckStart() {
      $("input.custom_input").prop("disabled", false); // 모든 배송하기 및 배송완료 input 태그 활성화 시키기
      const bool = $("input#allCheckDeliverStart").is(':checked');
      $("input.chkDeliverStart").prop('checked', bool);
   }// end of function allCheckBoxStart()------------
   
   
   function allCheckEnd() {
      $("input.custom_input").prop("disabled", false); // 모든 배송하기 및 배송완료 input 태그 활성화 시키기
      const bool = $("input#allCheckDeliverEnd").is(':checked');
      $("input.chkDeliverEnd").prop('checked', bool);
   }// end of function allCheckBoxEnd()-----------
   
   

</script>

<div class="container-fluid" style="border: solid 0px red">
   <div class="my-5">
      <c:set var="userid" value="${(sessionScope.loginuser).userid}" />
      
      <c:if test='${userid eq "admin"}'>
         <p class="h2 text-center" style="font-family: dabanggu;">&raquo;&nbsp;&nbsp;주문내역 전체목록&nbsp;&nbsp;&laquo;</p>
      </c:if>
      
      <c:if test='${userid ne "admin"}'>
         <p class="h2 text-center" style="font-family: dabanggu;">&raquo;&nbsp;&nbsp;${(sessionScope.loginuser).name} 님[ ${userid} ] 주문내역 목록&nbsp;&nbsp;&laquo;</p>   
      </c:if>
   </div>
   
   <div>
      <form name="frmDeliver">
         <table id="tblorder_map_List" style="width: 80%; margin: auto; font-family: dabanggu;">
            
           <c:if test='${userid eq "admin"}'>
            <tr>   
               <th class="pb-3" colspan="7" style="text-align: right; border: none;"> 
                  <input type="checkbox" id="allCheckDeliverStart" onclick="allCheckStart();">&nbsp;<label for="allCheckDeliverStart"><span style="color: green; font-size: 14pt;">전체선택(배송하기)</span></label>&nbsp;
                  <input type="button" name="btnDeliverStart" id="btnDeliverStart" value="배송하기" class="btn btn-outline-success btn-sm mr-3" style="font-size: 14pt;" />
                  
                  <input type="checkbox" id="allCheckDeliverEnd" onclick="allCheckEnd();">&nbsp;<label for="allCheckDeliverEnd"><span style="color: red; font-size: 14pt;">전체선택(배송완료)</span></label>&nbsp;
                  <input type="button" name="btnDeliverEnd" id="btnDeliverEnd" value="배송완료" class="btn btn-outline-danger btn-sm" style="font-size: 14pt;" />
               </th>
            </tr>
           </c:if>
               
               <tr bgcolor="#cfcfcf" style="font-size: 18pt; height: 60px">
	               <th width="7%" style="text-align: center;">주문번호</th>
	               <th width="6%" style="text-align: center;">결제일자</th>
	               <th width="30%" style="text-align: center;">제품정보</th> <%-- 제품번호,제품명,제품이미지1,판매정가,판매세일가,포인트 --%> 
	               <th width="7%"  style="text-align: center;">주문수량</th>
	               <th width="7%" style="text-align: center;">주문총액</th>   
	               <th width="7%" style="text-align: center;">배송상태</th>
               </tr>
            <c:if test="${empty requestScope.Nonmber_order_map_List}" > 
            	<tr>
                	<td colspan="7" align="center">
                	<span style="color: red; font-weight: bold;">주문내역이 없습니다.</span>
                </tr>
            </c:if>
         
            <%-- ============================================ --%>
            <c:if test="${not empty requestScope.Nonmber_order_map_List}">
                <c:forEach var="odrmap" items="${requestScope.Nonmber_order_map_List}" varStatus="status">
                	<tr>
	                    <td align="center"> 
	                        <c:if test='${userid eq "admin"}'>
	                           <a style="font-size: 14pt;">${odrmap.fk_ordernum}</a>
	                        </c:if>
	                        
	                        <c:if test='${userid ne "admin"}'>
	                           ${odrmap.fk_ordernum}
	                        </c:if>
	                     </td>
	                     
	                     <td align="center" style="line-height: 180%;"> <%-- 주문일자 --%>
	                        ${odrmap.formattedDate}
	                     </td>
	                     
	                     <td style="cursor:pointer;" onclick="javascript:location.href='<%= ctxPath%>/category/prodDetail.bk?pnum=${odrmap.FK_PNUM}'">  <%-- === 제품정보 넣기 === --%>
	                        
	                        <div style="display: flex; padding-top: 10px; justify-content: space-between;">
	                            <%-- flex 아이템들은 width의 기본값은 내용물 만큼 잡히고 height 값들은 동일하게 설정되어 inline 형태로 보여진다.
	                                 justify-content: space-between; 은 flex 아이템들 사이에 간격을 균일하게 만들어 주는 것이다.
	                                         이것이 없으면  flex 아이템들은 간격없이 죽~~붙어서 나오게 된다. 
	                            --%>
	                           <div style="width: 32%; margin: auto;">
	                               <img src="<%= ctxPath%>/image/${odrmap.pimage}" height="110px;" />  <%-- 제품이미지1 --%>
	                           </div>
	                           <div style="width: 66%; line-height: 150%;">
	                               <ul class="list-unstyled">
	                                  <li>제품번호 : ${odrmap.fk_pnum}</li> <%-- 제품번호 --%>
	                                  <li>제품명 : ${odrmap.pname}</li>    <%-- 제품명 --%> 
	                                  <li>판매가 : <fmt:formatNumber value="${odrmap.price}" pattern="###,###" /> 원</li>   <%-- 제품개당 판매정가 --%> 
	                                  <li>주소지 : ${odrmap.deliveryaddress}</li>    <%-- 배송지 --%> 
	                                  <li>연락처 : ${odrmap.phonenumber}</li>    <%-- 연락처 --%> 
	                                  <li>이름 : ${odrmap.name}</li>    <%-- 연락처 --%> 
	                               </ul>
	                            </div>
	                         </div> 
	                     </td>
                     
	                     <td align="center">    <%-- 수량 --%>
	                         ${odrmap.oqty} 개
	                     </td>
	                     
	                     <td align="center">    <%-- 금액 --%>
	                          <c:set var="su" value="${odrmap.oqty}" />
	                          <c:set var="danga" value="${odrmap.price}" />
	                          <c:set var="totalmoney" value="${su * danga}" />
	                         <fmt:formatNumber value="${totalmoney}" pattern="###,###" /> 원
	                     </td>
	                     
	                     <td align="center"> <%-- 배송상태 --%>
	                        <c:if test='${userid ne "admin"}'>
	                           <c:choose>
	                              <c:when test="${odrmap.status == '주문완료'}">
	                                 주문완료<br/>
	                              </c:when>
	                              <c:when test="${odrmap.status == '배송중'}">
	                                 <span style="color: green; font-weight: bold;">배송중</span><br/>
	                              </c:when>
	                              <c:when test="${odrmap.status == '배송완료'}">
	                                 <span style="color: red; font-weight: bold;">배송완료</span><br/>
	                              </c:when>
	                           </c:choose>
	                        </c:if>
	            
	                        <c:if test='${userid eq "admin"}'>
	                           <c:if test="${odrmap.status == '주문완료'}">
	                              <input type="checkbox" class="chkDeliverStart custom_input" name="pnum" id="chkDeliverStart${status.index}" value="${odrmap.fk_pnum}">&nbsp;
	                              <label for="chkDeliverStart${status.index}" style="color: green; font-size: 14pt; padding: 5px 0;">배송하기</label> 
	                              <input type="hidden" class="odrcodeDeliverStart custom_input" name="fk_ordernum" value="${odrmap.fk_ordernum}" />  
	                           </c:if>
	                           <br/>
	                           <c:if test="${odrmap.status == '주문완료' or odrmap.status == '배송중'}">
	                              <input type="checkbox" class="chkDeliverEnd custom_input" name="pnum" id="chkDeliverEnd${status.index}" value="${odrmap.fk_pnum}">&nbsp;
	                              <label for="chkDeliverEnd${status.index}" style="color: red; font-size: 14pt; padding: 5px 0;">배송완료</label>
	                              <input type="hidden" class="odrcodeDeliverEnd custom_input" name="fk_ordernum" value="${odrmap.fk_ordernum}" /> 
	                           </c:if>
	                           <c:if test="${odrmap.status == '배송완료'}">
	                              <label style="color: blue; font-size: 14pt; padding: 5px 0;">배송처리 완료!</label> 
	                           </c:if>
	                        </c:if>
	                     </td>
                     </tr>
                 </c:forEach>
             </c:if>
         </table>
      </form>  
   </div> 
    
   <%-- === 페이지바 === --%>
   <nav class="my-5">
       <div style='display:flex; width:80%; margin: 0 auto;'>
         <ul class="pagination" style='margin:auto;'>${requestScope.pageBar}</ul>
          <button type="button" style="background-color:rgb(81,35,20); color:white; font-family: dabanggu;" onclick="location.href='<%= ctxPath%>/login/delivery.bk'">뒤로가기</button>
       </div>
   </nav> 
 
</div>
  <%--밑에 메뉴 시작 --%>
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
  
	<div id="footer">
		<hr style="width: 65%; background-color: white;">
		<div id="ftcontent">
			<img id="bgk" src="<%= ctxPath%>/image/bgk.png">
			<p class="lastp" style="padding-top: 20px;">서울 종로구 삼봉로 71 G 타워 4F,5F 주식회사 비케이알  전화주문 1599-0505</p>
			<p class="lastp">사업자 등록번호 101-86-76277  (주)BKR 대표이사 이동형</p>
			<p class="lastp">Copyright 2019 BKR Co., Ltd. All right Reserved</p>
			<div style="position: absolute; bottom: 70%; left: 76%;">
				<a href="#" class="lasta">이용약관</a>&nbsp;&nbsp;
				<a href="#" class="lasta">개인정보처리방침</a>&nbsp;&nbsp;
				<a href="#" class="lasta">법적고지</a>
			</div>
		</div>
	</div>
