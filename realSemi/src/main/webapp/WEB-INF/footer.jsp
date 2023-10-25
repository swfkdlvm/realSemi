<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    
%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/footer.css"/>
      <%--밑에 메뉴 시작 --%>
 <div class="main_bottom_container">
      <ul class="main_bottom">
          <li><a href="#"><span class="main_bottom_main">메뉴</span></a>
              <ul class="main_bottom_sub">
                  <li><a href="#">스페셜&amp;할인팩</a></li>
                  <li><a href="#">신제품(NEW)</a></li>
                  <li><a href="#">프리미엄</a></li>
                  <li><a href="#">와퍼&amp;주니어</a></li>
                  <li><a href="#">치킨&amp;슈림프버거</a></li>
                  <li><a href="#">올데이킹&amp;킹모닝</a></li>
                  <li><a href="#">사이드</a></li>
                  <li><a href="#">음료&amp;디저트</a></li>
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
  
  
  
  
</body>
</html>