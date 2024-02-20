package msh.NonMemberOrder.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import msh.NonMemberOrder.model.NonMemberOrderDAO;
import msh.NonMemberOrder.model.NonMemberOrderDAO_imple;

public class NonMember_orderAddAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fk_ordernum = request.getParameter("fk_ordernum");
		String oqty = request.getParameter("oqty");
		String price = request.getParameter("price");
		String pname = request.getParameter("pname");
		String fk_pnum= request.getParameter("pnum");
		String name= request.getParameter("name");
		String phonenumber= request.getParameter("phonenumber");
		String deliveryaddress= request.getParameter("deliveryaddress");

        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
        String paymentdate = sdf.format(new java.util.Date());

        if(fk_ordernum == null) { // 인증을 하지 않은 상태이라면
	
        	request.setAttribute("message", "장바구니에 담으려면 먼저 인증부터 하세요!!");
		    request.setAttribute("loc", "javascript:history.back()");

		    super.setViewPage("/WEB-INF/msg.jsp");
		            
		    return;
        }
			
		else {
			String method = request.getMethod();
				
			if("POST".equalsIgnoreCase(method)) {

				NonMemberOrderDAO odao = new NonMemberOrderDAO_imple();
					
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("paymentdate",paymentdate);
				paraMap.put("fk_pnum", fk_pnum);
				paraMap.put("oqty", oqty);
				paraMap.put("price", price);
				paraMap.put("pname", pname);
				paraMap.put("name", name);
				paraMap.put("phonenumber", phonenumber);
				paraMap.put("deliveryaddress", deliveryaddress);
				paraMap.put("fk_ordernum", fk_ordernum);
					
				int n = odao.nonmember_addOrder(paraMap); // 장바구니에 해당사용자의 기존 제품이 없을경우 insert 하고 
										   		          // 장바구니에 해당사용자의 기존 제품이 있을경우 update 한다.
				if(n==1) {
					
					JSONObject jsobj = new JSONObject(); // {}
			    	  
			    	jsobj.put("n", n); // {"n":1}
			    	  
			    	String json = jsobj.toString(); // "{"n":1}"
			    	request.setAttribute("json", json);
			    	  
			    	super.setRedirect(false);
			    	super.setViewPage("/WEB-INF/jsonview.jsp");

		        }
		              
			}//end of if("POST".equalsIgnoreCase(method)) {----------
			else {
				//GET 방식이라면
				String message = "비정상적인 경로로 들어왔습니다";
	            String loc = "javascript:history.back()";
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	              
	            //  super.setRedirect(false);   
	            super.setViewPage("/WEB-INF/msg.jsp");
			}
				
		}//end of else {------------
	
	}
}

