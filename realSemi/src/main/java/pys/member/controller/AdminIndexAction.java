package pys.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import pys.member.domain.MemberVO;

public class AdminIndexAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// == 관리자(admin)로 로그인 했을 때만 회원조회가 가능하도록 햐여 한다.
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if( loginuser != null && "admin".equalsIgnoreCase(loginuser.getUserid())) {
			
			super.setViewPage("/WEB-INF/pys.member/admin/admin.jsp");
		}
		
	}

}
