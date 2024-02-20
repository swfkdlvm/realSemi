package msh.NonMemberOrder.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import pys.member.domain.MemberVO;
import msh.NonMemberOrder.domain.NonMemberOrderVO;
import msh.NonMemberOrder.model.NonMemberOrderDAO;
import msh.NonMemberOrder.model.NonMemberOrderDAO_imple;


public class NonMember_orderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// === 로그인 유무 검사하기 === //
		if(!super.checkLogin(request)) {
			// 로그인하지 않은 경우라면
			request.setAttribute("message", "주문내역을 조회하려면 먼저 로그인 부터 하세요!!");
			request.setAttribute("loc", "javascript:history.back()"); 

			super.setViewPage("/WEB-INF/msg.jsp");
			return; // 종료
		}
		
		else {// 로그인한 경우라면
			//  관리자(admin)로 로그인한 경우 모든 사용자들의 주문한 내역을 조회해온다.
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

			if("admin".equalsIgnoreCase(loginuser.getUserid())) {
			
				// *** 페이징 처리한 주문 목록 보여주기 *** //
				String currentShowPageNo = request.getParameter("currentShowPageNo");
				
				if(currentShowPageNo == null) {
					currentShowPageNo = "1";
				}
				
				NonMemberOrderDAO pdao = new NonMemberOrderDAO_imple();
				
				// === 페이징 처리를 위해 총 페이지 수 알아오기 === //
				int totalCountOrder = pdao.Nonmember_TotalCountOrder();
	
				// === 한 페이지당 보여줄 주문내역의 개수는 10개로 한다.
				int sizePerPage = 10;
				
				// === 전체 페이지 개수 ===
				int totalPage = (int)Math.ceil((double) totalCountOrder/sizePerPage);
				
	
				try {
					if( Integer.parseInt(currentShowPageNo) > totalPage || 
					    Integer.parseInt(currentShowPageNo) <= 0) {
						currentShowPageNo = "1";
					}
				} catch (NumberFormatException e) {
					currentShowPageNo = "1";
				}
				
				
				// *** 관리자가 아닌 일반사용자로 로그인 했을 경우에는 자신이 주문한 내역만 페이징 처리하여 조회를 해오고,
				//     관리자로 로그인을 했을 경우에는 모든 사용자들의 주문내역을 페이징 처리하여 조회해온다.
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("currentShowPageNo", currentShowPageNo);
				
				List<Map<String, String>>Nonmber_order_map_List = pdao.getNonmber_orderList (paraMap);
	
				request.setAttribute("Nonmber_order_map_List", Nonmber_order_map_List);
				
				String pageBar = "";
				
				int blockSize = 10;
				
				int loop = 1;
				
				// ==== !!! 다음은 pageNo 구하는 공식이다 !!! ==== //
				int pageNo = ( ( Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
	
				// **** [맨처음] [이전] 만들기 **** //
				pageBar += "<li class='page-item'><a class='page-link' href='NonMemberOrder_orderList.bk?currentShowPageNo=1'>[맨처음]</a></li>";
				
				if( pageNo != 1) {
					pageBar += "<li class='page-item'><a class='page-link' href='NonMemberOrder_orderList.bk?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
				}
				
				while( !(loop > blockSize || pageNo > totalPage) ) {
					
					if(pageNo == Integer.parseInt(currentShowPageNo)) {
						pageBar += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>";
					}
					else {
						pageBar += "<li class='page-item'><a class='page-link' href='NonMemberOrder_orderList.bk?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
					}
					
					loop ++;  
					
					pageNo++; 
				}// end of while-----------------------------------------------
				
				// **** [다음] [마지막] 만들기 **** //
				// pageNo ==> 11
				if(pageNo <= totalPage) {
					pageBar += "<li class='page-item'><a class='page-link' href='NonMemberOrder_orderList.bk?currentShowPageNo="+pageNo+"'>[다음]</a></li>";
				}
				pageBar += "<li class='page-item'><a class='page-link' href='NonMemberOrder_orderList.bk?currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
					
				// *** ==== 페이지바 만들기 끝 ==== *** //
	
				request.setAttribute("pageBar", pageBar);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msh.NonMemberOrder/NonMember_orderList.jsp");
			}//end of if("admin".equalsIgnoreCase(loginuser.getUserid())) {----------
			else {
				String message = "비정상적인 경로로 들어왔습니다";
				String loc = "javascript:history.back()";
               
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
              
				//  super.setRedirect(false);   
				super.setViewPage("/WEB-INF/msg.jsp");	
				
			}	
		
		}//end of else {// 로그인한 경우라면------------
		
			
	}		
	
	
}
