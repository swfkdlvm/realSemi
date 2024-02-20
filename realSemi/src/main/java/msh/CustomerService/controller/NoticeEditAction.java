package msh.CustomerService.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import msh.CustomerService.domain.NoticeVO;
import msh.CustomerService.model.NoticeDAO;
import msh.CustomerService.model.NoticeDAO_imple;
import pys.member.domain.MemberVO;

public class NoticeEditAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		if(loginuser != null && "admin".equalsIgnoreCase(loginuser.getUserid())) {
			String userid = loginuser.getUserid();
			request.setAttribute("userid", userid);
		

			String seq = request.getParameter("seq");
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("seq", seq);
			
			NoticeDAO ndao = new NoticeDAO_imple();
			
			// 글 내용 조회 
			NoticeVO noticevo = ndao.getNoticeDetailView(paraMap);
	
			request.setAttribute("noticevo", noticevo);
			super.setViewPage("/WEB-INF/msh.CustomerService/NoticeEdit.jsp");
		}
		else {
	         // 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우 
	         String message = "관리자만 접근이 가능합니다.";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);

	         super.setViewPage("/WEB-INF/msg.jsp");
	   }
	}

}
