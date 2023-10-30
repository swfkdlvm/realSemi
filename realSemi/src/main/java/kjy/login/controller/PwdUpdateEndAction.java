package kjy.login.controller;

import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import kjy.member.model.*;

public class PwdUpdateEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = request.getParameter("userid");
		
		///////////////////////////////////////////////////////
		HttpSession session = request.getSession();
		
		String pwd_change_userid = (String)session.getAttribute("pwd_change_userid");
		
	//	System.out.println("~~~~ 요기요 userid => " + userid);
	//	System.out.println("~~~~ 요기요 pwd_change_userid => " + pwd_change_userid);
		
		
		if(pwd_change_userid == null || !userid.equals(pwd_change_userid)) {
			String message = "타인의 비밀번호는 변경이 불가합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return; // 종료
		}
        ///////////////////////////////////////////////////////
		
		else {
			
			String method = request.getMethod();
			
			if("POST".equalsIgnoreCase(method)) {
				// 암호 변경하기 버튼을 클릭했을 경우
				
				String new_pwd = request.getParameter("pwd");
				
				MemberDAO mdao = new MemberDAO_imple();
				
				Map<String,String> paraMap = new HashMap<>();
				
				paraMap.put("userid", userid);
				paraMap.put("new_pwd", new_pwd);
				
				int n = 0;
				try {
					n = mdao.pwdUpdate(paraMap);
				
				}catch(SQLException e) {
					
				}
				
				request.setAttribute("n", n);
				
				session.removeAttribute("pwd_change_userid");
				
			}//end of if("POST".equalsIgnoreCase(method))
			
			
			
			request.setAttribute("userid", userid);
			request.setAttribute("method", method);
			
		    super.setRedirect(false);
			super.setViewPage("/WEB-INF/kjy.login/pwdUpdateEnd.jsp");	
		}
		
	}

}
