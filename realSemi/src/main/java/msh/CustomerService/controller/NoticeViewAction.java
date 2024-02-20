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

public class NoticeViewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		if(loginuser != null) {
			String userid = loginuser.getUserid();
			request.setAttribute("userid", userid);
		}

		String seq = request.getParameter("seq");
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("seq", seq);
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		if(searchType == null) {
			searchType = "";
		}
		
		if(searchWord == null) {
			searchWord = "";
		}
		
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		NoticeDAO ndao = new NoticeDAO_imple();
		
		// 글 내용 조회 + 조회수 증가
		NoticeVO noticevo = ndao.getNoticeDetailView(paraMap);
		int n = ndao.getNoticeDetailViewCnt(seq);
		
		request.setAttribute("noticevo", noticevo);
		
		super.setViewPage("/WEB-INF/msh.CustomerService/NoticeView.jsp");
		
	}

}
