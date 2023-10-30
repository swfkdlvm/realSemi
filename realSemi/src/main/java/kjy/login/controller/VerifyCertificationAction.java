package kjy.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjy.common.controller.AbstractController;

public class VerifyCertificationAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		System.out.println("확인용 method " + method);
		
		if("POST".equalsIgnoreCase(method)) {
			
			String userCertificationCode = request.getParameter("userCertificationCode");
			String userid = request.getParameter("userid");
			
			HttpSession session = request.getSession();	// 세션불러오기
			
			String certification_code = (String)session.getAttribute("certification_code");
			session.setAttribute("pwd_change_userid", userid);
			
			String message = "";
			String loc = "";
			
			if(userCertificationCode.equals(certification_code)) {
				message = "인증성공 되었습니다.";
				loc = request.getContextPath()+"/login/pwdUpdateEnd.bk?userid="+userid;
			}
			else {
				message = "발급된 인증코드가 아닙니다. \\n인증코드를 다시 발급받으세요!!";
				loc = request.getContextPath()+"/login/pwdSearch.bk";
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			// === 중요 === //
			//세션에 저장된 인증코드 삭제하기 !!
			session.removeAttribute("certification_code");
			
		}//end of if("POST".equalsIgnoreCase(method))
		
		
	}

}
