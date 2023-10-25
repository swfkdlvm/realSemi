package login.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import myshop.domain.ImageVO;
import myshop.model.ProductDAO;
import myshop.model.ProductDAO_imple;

public class LoginIndex extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ProductDAO pdao = new ProductDAO_imple();
		
		try {
			List<ImageVO> imgList = pdao.imageSelectAll();
			request.setAttribute("imgList", imgList);
			
			
			if(super.checkLogin(request)) {
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/login/delivery.bk");
				
				
			}
			else {
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/login/loginIndex.jsp");
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
			super.setRedirect(true);
			super.setViewPage(request.getContextPath()+"/error.up");
		}
		
	}
		
}


