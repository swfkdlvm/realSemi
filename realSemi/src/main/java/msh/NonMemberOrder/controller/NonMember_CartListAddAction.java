package msh.NonMemberOrder.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import msh.NonMemberOrder.domain.NonMemberOrderVO;
import msh.NonMemberOrder.model.NonMemberOrderDAO;
import msh.NonMemberOrder.model.NonMemberOrderDAO_imple;


public class NonMember_CartListAddAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ordernum = request.getParameter("ordernum");

		if(ordernum == null) { // 인증을 하지 않은 상태이라면

			request.setAttribute("message", "장바구니에 담으려면 먼저 인증부터 하세요!!");
	        request.setAttribute("loc", "javascript:history.back()");
	        
	        super.setViewPage("/WEB-INF/msg.jsp");
	            
	        return;
		}
		
		else {
			String method = request.getMethod();
			
			if("POST".equalsIgnoreCase(method)) {
				//POST 방식이라면

				String pnum = request.getParameter("pnum"); // 제품번호
				
				NonMemberOrderDAO odao = new NonMemberOrderDAO_imple();
				Map<String, String> paraMap = new HashMap<>();
				
				paraMap.put("pnum", pnum);
				paraMap.put("ordernum", ordernum );
				int n = odao.nonmember_addCart(paraMap); // 장바구니에 해당사용자의 기존 제품이 없을경우 insert 하고 
									   		             // 장바구니에 해당사용자의 기존 제품이 있을경우 update 한다.
				if(n==1) {
					
					JSONObject jsobj = new JSONObject(); // {}
			    	jsobj.put("n", n); // {"n":1}
			    	  
			    	String json = jsobj.toString(); 
			    	request.setAttribute("json", json);
			    	  
			    	super.setRedirect(false);
			    	super.setViewPage("/WEB-INF/jsonview.jsp");
		        }
	              
			}
			else {
				
				  //GET 방식이라면
				String message = "비정상적인 경로로 들어왔습니다";
	            String loc = "javascript:history.back()";
	               
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	
	            super.setViewPage("/WEB-INF/msg.jsp");
			}
			
		}

	}

}
