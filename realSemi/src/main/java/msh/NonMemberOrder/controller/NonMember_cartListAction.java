package msh.NonMemberOrder.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import msh.NonMemberOrder.domain.NonMemberCartVO;
import msh.NonMemberOrder.model.NonMemberOrderDAO_imple;
import msh.NonMemberOrder.model.NonMemberOrderDAO;
import msh.NonMemberOrder.domain.NonMemberInfoVO;

public class NonMember_cartListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String ordernum = request.getParameter("ordernum");
			
			if(ordernum == null) {
				 request.setAttribute("message", "장바구니를 보려면 먼저 인증 부터 하세요!!");
		         request.setAttribute("loc", "javascript:history.back()"); 
		         
		      // super.setRedirect(false);
		         super.setViewPage("/WEB-INF/msg.jsp");
		         return;
			}
				
			else {
				String method = request.getMethod();
						
				if("POST".equalsIgnoreCase(method)) {

					NonMemberOrderDAO ndao = new NonMemberOrderDAO_imple();
						
					List<NonMemberCartVO> cartList = ndao.nonmember_selectProductCart(ordernum);
						
					Map<String,String> sumMap = ndao.nonmember_selectCartSumPrice(ordernum);
						
					List<NonMemberInfoVO> infoList = ndao.selectNonmemberInfo(ordernum);
						
					request.setAttribute("infoList", infoList);
					request.setAttribute("cartList", cartList);
					request.setAttribute("sumMap", sumMap);

					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msh.NonMemberOrder/NonMember_CartList.jsp");
				}
				else {
			     // POST 방식으로 넘어오지 않았다면
					String message = "비정상적인 경로를 통해 들어왔습니다.!!";
			        String loc = "javascript:history.back()";

			        request.setAttribute("message", message);
			        request.setAttribute("loc", loc);

			        super.setRedirect(false);
			        super.setViewPage("/WEB-INF/msg.jsp");
			    }
			}//end of else {---------------		
		
	}

}
