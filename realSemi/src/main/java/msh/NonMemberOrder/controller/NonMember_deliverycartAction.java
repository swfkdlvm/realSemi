package msh.NonMemberOrder.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import msh.NonMemberOrder.model.NonMemberOrderDAO_imple;
import msh.NonMemberOrder.domain.NonMemberOrderVO;
import msh.NonMemberOrder.model.NonMemberOrderDAO;
import pys.myshop.domain.ProductVO;
import pys.myshop.model.ProductDAO;
import pys.myshop.model.ProductDAO_imple;

public class NonMember_deliverycartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
	    int n = 0;
	    
	    if ("POST".equalsIgnoreCase(method)) { 
	    	ProductDAO pdao = new ProductDAO_imple();
	    	//딜리버리 화면 처음 띄울때 스페셜 상품 보여주기
	    	List<ProductVO> productList= pdao.selectproductdefault();
		
	    	String ordernum = request.getParameter("ordernum");
	    	String address = request.getParameter("address");
	    	String detailaddress = request.getParameter("detailaddress");
	    	String extraaddress = request.getParameter("extraaddress");
	    	NonMemberOrderVO nvo = new NonMemberOrderVO();

	    	nvo.setOrdernum(ordernum);
	    	nvo.setAddress(address);
	    	nvo.setDetailaddress(detailaddress);
	    	nvo.setExtraaddress(extraaddress);
        
	    	request.setAttribute("nvo", nvo);
	    	request.setAttribute("productList", productList);

	    	super.setRedirect(false);
	    	super.setViewPage("/WEB-INF/msh.NonMemberOrder/NonMember_delivery.jsp");
	    }
	    else {
	    	// POST 방식으로 넘어오지 않았다면
	        String message = "비정상적인 경로를 통해 들어왔습니다.!!";
	        String loc = "javascript:history.back()";

	        request.setAttribute("message", message);
	        request.setAttribute("loc", loc);

	        super.setRedirect(false);
	        super.setViewPage("/WEB-INF/msg.jsp");
	    }
	}

}
