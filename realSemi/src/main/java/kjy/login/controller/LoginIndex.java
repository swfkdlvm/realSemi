package kjy.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class LoginIndex extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			
			if(super.checkLogin(request)) {
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/login/delivery.bk");
				
				
			}
			else {
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/kjy.login/loginIndex.jsp");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			super.setRedirect(true);
			super.setViewPage(request.getContextPath()+"/error.up");
		}
		
	}
		
}


