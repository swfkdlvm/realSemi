package kjy.myshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import common.controller.AbstractController;
import pys.member.domain.MemberVO;

public class CartListEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
	      
	    if(!"POST".equalsIgnoreCase(method)) {
	         // GET 방식이라면
	         
	         String message = "비정상적인 경로로 들어왔습니다";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	         super.setViewPage("/WEB-INF/msg.jsp");
	         return;
	      }
	      else if("POST".equalsIgnoreCase(method) && super.checkLogin(request)) {
	    	  //post 방식이고 로그인을 했다라면
	    	  
	    	  HttpSession session = request.getSession();
			  MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			  
			  request.setAttribute("loginuser", loginuser);
	    	  
	    	  super.setRedirect(false);
	    	  super.setViewPage("/WEB-INF/kjy.shop/cartListEnd.jsp");
	    	  
	    	  
	      }
		
	}

}
