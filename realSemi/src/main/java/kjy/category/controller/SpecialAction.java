package kjy.category.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import kjy.myshop.domain.ProductVO;
import kjy.myshop.model.ProductDAO;
import kjy.myshop.model.ProductDAO_imple;

public class SpecialAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProductDAO pdao = new ProductDAO_imple();
		//스페셜팩 처음 띄울때 스페셜 상품 보여주기
		List<ProductVO> productList= pdao.selectproductdefault();
		
	//	System.out.println("productList => "+ productList);
		
		request.setAttribute("productList", productList);
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/kjy.category/special.jsp");
	}

}
