package pys.myshop.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import pys.myshop.model.*;

public class CartCountAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String userid = request.getParameter("userid");
		
		ProductDAO pdao = new ProductDAO_imple();
		
		Map<String, String> cartcount = pdao.countCart(userid);
		
		JSONObject jsonObj = new JSONObject();
	        
	    String pname = cartcount.get("pname");
	    String cnt = cartcount.get("cnt");
	        
	    // JSON 객체에 두 개의 값을 추가
	    jsonObj.put("pname", pname);
	    jsonObj.put("cnt", cnt);
	      
	    String json = jsonObj.toString(); // JSON 객체를 문자열로 변환
  
		request.setAttribute("json", json);
		      
		//   super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");   

	}

}
