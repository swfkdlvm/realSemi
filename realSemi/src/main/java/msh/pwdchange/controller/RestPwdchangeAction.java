package msh.pwdchange.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import msh.pwdchange.model.PwdchangeDAO;
import msh.pwdchange.model.PwdchangeDAO_imple;
import pys.member.domain.MemberVO;

public class RestPwdchangeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String comeuserid = request.getParameter("comeuserid");
		
		HttpSession session = request.getSession(); 
		
		MemberVO loginuser =(MemberVO)session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		String new_pwd;
		int n = 0;
		
		if(userid.equals(comeuserid)) {
	         
	        new_pwd = request.getParameter("pwd");
	        PwdchangeDAO rdao = new PwdchangeDAO_imple();
	        paraMap.put("new_pwd", new_pwd);
	        
			n = rdao.updatehumyun(paraMap);
			request.setAttribute("n", n);
		}
		
		if(n==1) {
			
			String message = "휴면해제 및 비밀번호 변경 성공!";
			String loc = request.getContextPath()+"/login/loginIndex.bk";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");	
			session.removeAttribute("loginuser");
		}
		
	}
		

}
