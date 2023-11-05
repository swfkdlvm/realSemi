package pys.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import pys.member.domain.MemberVO;
import pys.member.model.MemberDAO;
import pys.member.model.MemberDAO_imple;

public class MemberOneDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// === 관리자(admin)로 로그인 했을때만 조회가 가능하도록 한다. ===//
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null && "admin".equals(loginuser.getUserid())) {
			// 관리자(admin)로 로그인 했을 경우
			
			String method = request.getMethod();
			
			if("POST".equalsIgnoreCase(method)) {
				// POST 방식일때
				String userid = request.getParameter("userid");
				String goBackURL = request.getParameter("goBackURL");
				
				//System.out.println("goBackURL =>" + goBackURL);
				// /member/memberList.up?searchType=name&searchWord=%EC%83%88%ED%95%9C&sizePerPage=10
				
				
				MemberDAO mdao = new MemberDAO_imple();
				MemberVO mvo = mdao.showonemember(userid);
				
				request.setAttribute("mvo", mvo);
				request.setAttribute("goBackURL", goBackURL);
				
				//super.setRedirect(false);
				  super.setViewPage("/WEB-INF/pys.member/admin/memberOneDetail.jsp");
			}
		
	}

}
}
