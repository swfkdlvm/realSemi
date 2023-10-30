package kjy.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kjy.common.controller.AbstractController;

public class DeliveryAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/kjy.login/delivery.jsp");
			
		} catch(Exception e) {
			e.printStackTrace();
			super.setRedirect(true);
			super.setViewPage(request.getContextPath()+"/error.bk");
		}
		
	}

}
