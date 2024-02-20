package msh.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import msh.event.model.*;

public class Eventmain extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// === Ajax(JSON)를 사용하여 "더보기" 방식으로 페이징 처리해서 보여주겠다. ===//
		EventDAO edao = new EventDAO_imple();
		
		int totalHITCount = edao.totalPspecCount();     
		
		request.setAttribute("totalHITCount",totalHITCount);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/msh.event/eventmain.jsp");
		
	}

}
