package login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.*;

public class IdSearchAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); // "GET" 또는 "POST"
		
		if("POST".equalsIgnoreCase(method)) { // post 방식이라면
			
			String name =  request.getParameter("name");
			String mobile = request.getParameter("mobile");
			
			MemberDAO mdao = new MemberDAO_imple();
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("name", name);
			paraMap.put("mobile", mobile);
			
			String userid = mdao.findUserid(paraMap);
			
			if(userid != null) {
				request.setAttribute("userid", userid);
			}
			else {
				request.setAttribute("userid", "존재하지 않습니다.");
			}
			
			request.setAttribute("name", name);
			request.setAttribute("mobile", mobile);
			
		}// end of if("POST".equalsIgnoreCase(method)) {}----------
		
		request.setAttribute("method", method);
		
		super.setRedirect(false); // get 방식이든지 post 방식이든지 둘 다
		super.setViewPage("/WEB-INF/login/idSearch.jsp");
		
	}

}
