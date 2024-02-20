package msh.pwdchange.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import pys.member.domain.MemberVO;

public class DormancyclearAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); // "GET" 또는 "POST"
		
		HttpSession session = request.getSession(); 
		
		MemberVO loginuser =(MemberVO)session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		request.setAttribute("method", method);
		request.setAttribute("userid", userid);
	
	
		super.setRedirect(false); // get 방식이든지 post 방식이든지 둘 다
		super.setViewPage("/WEB-INF/msh.pwdupdate/pwdUpdateEnd.jsp");
		
	}

}
