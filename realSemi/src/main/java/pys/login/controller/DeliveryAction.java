package pys.login.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import pys.myshop.domain.ImageVO;
import pys.myshop.domain.ProductVO;
import pys.myshop.model.ProductDAO;
import pys.myshop.model.ProductDAO_imple;

public class DeliveryAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			
			ProductDAO pdao = new ProductDAO_imple();
			//딜리버리 화면 처음 띄울때 스페셜 상품 보여주기
			List<ProductVO> productList= pdao.selectproductdefault();
			
			request.setAttribute("productList", productList);
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/pys.login/delivery.jsp");
			
		
		
	}

}
