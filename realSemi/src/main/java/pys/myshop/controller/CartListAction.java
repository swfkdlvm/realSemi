package pys.myshop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import pys.member.domain.MemberVO;
import pys.myshop.domain.CartVO;
import pys.myshop.model.ProductDAO;
import pys.myshop.model.ProductDAO_imple;

public class CartListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 장바구니 보기는 반드시 해당사용자가 로그인을 해야만 볼 수 있다.
		boolean isLogin = super.checkLogin(request);
		
		if(!isLogin) {
			 request.setAttribute("message", "장바구니를 보려면 먼저 로그인 부터 하세요!!");
	         request.setAttribute("loc", "javascript:history.back()"); 
	         
	      // super.setRedirect(false);
	         super.setViewPage("/WEB-INF/msg.jsp");
	         return;
		}
		
		else {
			// 로그인을 했을 경우
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			
			ProductDAO pdao = new ProductDAO_imple();
			
			List<CartVO> cartList = pdao.selectProductCart(loginuser.getUserid());
			
			Map<String,String> sumMap = pdao.selectCartSumPricePoint(loginuser.getUserid());
			
			
			request.setAttribute("cartList", cartList);
			request.setAttribute("sumMap", sumMap);
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/pys.myshop/cartList.jsp");
		}
		
		
		
		
	}

}
