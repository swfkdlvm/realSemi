package kjy.category.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kjy.common.controller.AbstractController;

public class NewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/category/new.jsp");
		
	}

}
