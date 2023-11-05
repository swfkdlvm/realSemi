package pys.login.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;


public class LoginIndex extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		
		
			
			if(super.checkLogin(request)) {
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/login/delivery.bk");
				
				
			}
			else {
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/pys.login/loginIndex.jsp");
			}
			
			
		
		
	}
		
}


