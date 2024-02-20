package msh.NonMemberOrder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import pys.member.domain.MemberVO;

public class NonMember_productPurchaseAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String phonenumber = request.getParameter("phonenumber");
			
		if(phonenumber != null) {
			
			String productName = "제품구매"; // 제품명, "새우깡";
			int productPrice = 100;
			
			request.setAttribute("mobile", phonenumber);
			request.setAttribute("productName", productName);
			request.setAttribute("productPrice", productPrice);

			super.setViewPage("/WEB-INF/msh.NonMemberOrder/paymentGateway.jsp");
		}
			
		else {
			String message = "결제를 하기 위해서는 먼저 인증을 하세요!!";
			String loc = "javascript:history.back()";
				
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
				
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}

	}
			
			


}
