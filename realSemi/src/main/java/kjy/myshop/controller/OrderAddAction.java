package kjy.myshop.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import kjy.login.controller.GoogleMail;
import pys.member.domain.MemberVO;
import pys.myshop.domain.ProductVO;
import kjy.myshop.model.*;

public class OrderAddAction extends AbstractController {
	
private ProductDAO pdao = new ProductDAO_imple();
	
	// === 전표(주문코드)를 생성해주는 메소드 생성하기 === //
	private String getOdrcode() {
		
		// 주문코드(명세서번호) 형식 : s+날짜+sequence s20231101-1
		
		// 날짜 생성
		Date now = new Date();
		SimpleDateFormat smdatefm = new SimpleDateFormat("yyyyMMdd");
		String today = smdatefm.format(now);
		
		int seq = 0;
		try {
			seq = pdao.get_seq_tbl_order();
		       // pdao.get_seq_tbl_order(); 는 시퀀스 seq_tbl_order 값("주문코드")을 채번해오는 것.
		} catch(SQLException e) {
			
		}
		
		return "BK"+today+"-"+seq;
		
	}// end of private String getOdrcode()---------------
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)){
			// POST 방식이라면
			
			String sum_totalPrice = request.getParameter("n_sum_totalPrice");
			String str_pnum_join = request.getParameter("str_pnum_join");
			String str_oqty_join = request.getParameter("str_oqty_join");
			String str_totalPrice_join = request.getParameter("str_totalPrice_join");
			String str_cartno_join = request.getParameter("str_cartno_join");
			String deliveryAddress = request.getParameter("deliveryAddress");
			String mobile = request.getParameter("mobile");
			String orderRequest = request.getParameter("orderRequest");
			
		/*	
			System.out.println("~~~~~ 확인용 sum_totalPrice : " + n_sum_totalPrice);		 // ~~~~~ 확인용 n_sum_totalPrice : 86000
			System.out.println("~~~~~ 확인용 sum_totalPoint : " + n_sum_totalPoint);		 // ~~~~~ 확인용 n_sum_totalPoint : 530
			System.out.println("~~~~~ 확인용 str_pnum_join : " + str_pnum_join);				 // ~~~~~ 확인용 str_pnum_join : 5,4,61
			System.out.println("~~~~~ 확인용 str_oqty_join : " + str_oqty_join);				 // ~~~~~ 확인용 str_oqty_join : 1,1,5
			System.out.println("~~~~~ 확인용 str_totalPrice_join : " + str_totalPrice_join);  // ~~~~~ 확인용 str_totalPrice_join : 33000,13000,40000
			System.out.println("~~~~~ 확인용 str_cartno_join : " + str_cartno_join);			// ~~~~~ 확인용 str_cartno_join : 12,8,7
		*/
			
			// ===== Transaction 처리하기 ===== // 
		    // 1. 주문 테이블에 입력되어야할 주문전표를 채번(select)하기 
		    // 2. 주문 테이블에 채번해온 주문전표, 로그인한 사용자, 현재시각을 insert 하기(수동커밋처리)
		    // 3. 주문상세 테이블에 채번해온 주문전표, 제품번호, 주문량, 주문금액을 insert 하기(수동커밋처리)
		    // 4. 제품 테이블에서 제품번호에 해당하는 잔고량을 주문량 만큼 감하기(수동커밋처리) 
		        
		    // 5. 장바구니 테이블에서 str_cartno_join 값에 해당하는 행들을 삭제(delete)하기(수동커밋처리)
		    // >> 장바구니에서 주문을 한 것이 아니라 특정제품을 바로주문하기를 한 경우에는 장바구니 테이블에서 행들을 삭제할 작업은 없다. << 
		        
		    // 6. 회원 테이블에서 로그인한 사용자의 coin 액을 sum_totalPrice 만큼 감하고, point 를 sum_totalPoint 만큼 더하기(update)(수동커밋처리) 
		    // 7. **** 모든처리가 성공되었을시 commit 하기(commit) **** 
		    // 8. **** SQL 장애 발생시 rollback 하기(rollback) **** 
		   
		    // === Transaction 처리가 성공시 세션에 저장되어져 있는 loginuser 정보를 새로이 갱신하기 ===
		    // === 주문이 완료되었을시 주문이 완료되었다라는 email 보내주기  === // 
			
			
			Map<String, Object> paraMap = new HashMap<>();
			String odrcode = getOdrcode();
			// === 주문테이블(tbl_order)에 insert 할 데이터 === //
			paraMap.put("odrcode", odrcode); // 주문코드(명세서번호) s+날짜+sequence
			// getOdrcode() 메소드는 위에서 정의한 전표(주문코드)를 생성해주는 것이다.
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			paraMap.put("userid", loginuser.getUserid());  // 회원아이디
			paraMap.put("sum_totalPrice", sum_totalPrice); // 주문총액
			
			
			// === 주문상세테이블(tbl_orderdetail)에 insert 할 데이터 === //
			String[] pnum_arr = str_pnum_join.split("\\,"); // 여러개 제품을 주문한 경우  		  ex) "5,4,61".split("\\,"); ==> ["5","4","61"]
															// 장바구니에서 제품을 1개만 주문한 경우  ex) "5".split("\\,"); 	 ==> ["5"]
															// 특정제품을 바로주문하기를 한 경우	  ex) "5".split("\\,"); 	 ==> ["5"]
			
			String[] oqty_arr = str_oqty_join.split("\\,");

			String[] totalPrice_arr = str_totalPrice_join.split("\\,");
			
			paraMap.put("pnum_arr", pnum_arr);
			paraMap.put("oqty_arr", oqty_arr);
			paraMap.put("totalPrice_arr", totalPrice_arr);
			
			// 배송지, 연락처, 요청사항
			paraMap.put("deliveryAddress", deliveryAddress);
			paraMap.put("mobile", mobile);
			paraMap.put("orderRequest", orderRequest);
			
			
			// === 장바구니(tbl_cart)에 delete 할 데이터 === //
			String[] cartno_arr = str_cartno_join.split("\\,");
			paraMap.put("cartno_arr", cartno_arr);
			
			
			// *** Transaction 처리를 해주는 메소드 호출하기 *** //
			int isSuccess = pdao.orderAdd(paraMap); // Transaction 처리를 해주는 메소드 호출하기
			
			// **** 주문이 완료되었을시 세션에 저장되어져 있는 loginuser 정보를 갱신하고
			//      이어서 주문이 완료되었다라는 email 보내주기  **** // 
			if(isSuccess == 1) {
				

				////////// === 주문이 완료되었다는 email 보내기 시작 === ///////////
				GoogleMail mail = new GoogleMail();
				
				// str_pnum_join ==> "5,4,61"
				
				String pnumes = "'"+String.join("','", str_pnum_join.split("\\,"))+"'"; 
				// ==> ["5", "4", "61"]
				// "5','4','61"
				// "'5','4','61'"
				
				// System.out.println("~~~~ 확인용 주문한 제품번호 pnumes : " + pnumes);
				// ~~~~ 확인용 주문한 제품번호 pnumes : '5','4','61'
				
				// 주문한 제품에 대해 email 보내기시 email 내용에 넣을 주문한 제품번호들에 대한 제품정보를 얻어오는 것.
				List<ProductVO> jumunProductList = pdao.getJumunProductList(pnumes);
				
				StringBuilder sb = new StringBuilder();
		         
				sb.append("<div id='maincontainer' style='width: 100%;'><div style='width: 50%; margin: auto; border: solid 1px rgb(247,247,247);'><div style='width: 100%; height:100px; position:relative; background-color: rgb(247,247,247); font-size: 17pt; font-weight: bold;'><span style='margin-left: 10px;  height: 100px; display: flex; align-items:center; float: left;'><img src='http://127.0.0.1:9090/tempSemi/image/logo.png' height='60px' />&nbsp;&nbsp;BURGER KING</span><span style='margin-right: 10px; height: 100px; display: flex; align-items:center; float: right;'>집에서 만나는 버거킹</span></div><div style='width: 90%; margin: auto;'><div style='text-align: center;'><h1 style='margin:40px 0;'>주문이 완료되었습니다.</h1></div><div>안녕하세요. <span style='font-weight: bold;'>"+loginuser.getName()+"</span> 회원님<br>회원님께서 주문하신 내역은 다음과 같습니다.<br><br></div><div><span style='display:inline-block; width:100%; padding:5px 0; border-bottom: solid 1px black;'>주문내역</span><table style='width:100%; margin:30px 0;'><tbody>");
				
				for(int i=0; i<jumunProductList.size(); i++) {
					
					int oqtyPrice = Integer.parseInt(oqty_arr[i]) * jumunProductList.get(i).getPrice();
					
					sb.append("<tr><td style='width: 20%;'><img src='http://127.0.0.1:9090/tempSemi/image/"+jumunProductList.get(i).getPimage()+"' height='100px' /></td><td style='width: 50%;'>"+jumunProductList.get(i).getPname()+"</td><td style='width: 10%;'>"+oqty_arr[i]+"개</td><td style='width: 10%;'>"+oqtyPrice+"원</td></tr>");
				}// end of for----------------
				
				sb.append("<tr style='line-height: 100px; text-align: right;'><td colspan='4'>배송비(3,000원) 포함 결제 총액 : <span style='font-weight: bold;'>"+sum_totalPrice+"원</span></td></tr></tbody></table></div></div></div></div>");
		         
		        String emailContents = sb.toString();
		        
		        System.out.println(emailContents);
		        
		        mail.sendmail_OrderFinish(loginuser.getEmail(), loginuser.getName(), emailContents);
		        ////////// === 주문이 완료되었다는 email 보내기 끝 === ///////////
			}
			
			JSONObject jsobj = new JSONObject(); // {}
		    jsobj.put("isSuccess", isSuccess);   // {"isSuccess":1} 또는 {"isSuccess":0}
		       
		    String json = jsobj.toString();
		    request.setAttribute("json", json);
		       
		    super.setRedirect(false);
		    super.setViewPage("/WEB-INF/jsonview.jsp");
			
		}
		
		else {
			// GET 방식이라면
			String message = "비정상적인 경로로 들어왔습니다";
			String loc = "javascript:history.back()";
               
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
              
		//	super.setRedirect(false);   
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
	}
	
}
