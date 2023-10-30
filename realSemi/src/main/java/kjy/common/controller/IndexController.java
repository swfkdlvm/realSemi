package kjy.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		try {
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/index.jsp");
			
		} catch(Exception e) {
			e.printStackTrace();
			super.setRedirect(true);
			super.setViewPage(request.getContextPath()+"/error.bk");
		}
		
	}

}
