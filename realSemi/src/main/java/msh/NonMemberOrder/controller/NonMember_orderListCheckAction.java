package msh.NonMemberOrder.controller;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import msh.NonMemberOrder.domain.NonMemberOrderVO;
import msh.NonMemberOrder.model.NonMemberOrderDAO;
import msh.NonMemberOrder.model.NonMemberOrderDAO_imple;

public class NonMember_orderListCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    String ordernum = request.getParameter("ordernum");
	    String pwd = request.getParameter("pwd");
	    int n = 0;
	    String method = request.getMethod();

	    if ("POST".equalsIgnoreCase(method)) {
	    	NonMemberOrderDAO odao = new NonMemberOrderDAO_imple();

	        Map<String, String> paraMap = new HashMap<>();
	        paraMap.put("ordernum", ordernum);
	        paraMap.put("pwd", pwd);

	        List<NonMemberOrderVO> ndaolist = odao.nonmemberOrder_search(paraMap);

	        boolean isPasswordCorrect = false;

	        JSONArray jsonArray = new JSONArray(); // []

	        for (NonMemberOrderVO ndao : ndaolist) {
	        	String storedPassword = ndao.getPwd();
	            String inputPasswordHash = getSHA256(pwd);

	            if (storedPassword.equals(inputPasswordHash)) {
	                isPasswordCorrect = true;

	                JSONObject jsobj = new JSONObject(); // {}

	                jsobj.put("name", ndao.getName());
	                jsobj.put("pname", ndao.getPname());
	                jsobj.put("oqty", ndao.getOqty());
	                jsobj.put("deliverdate", ndao.getDeliverdate());
	                jsobj.put("address", ndao.getAddress());
	                jsobj.put("phoneNumber", ndao.getPhoneNumber());
	                jsobj.put("status", ndao.getStatus());
	                jsobj.put("pwd", ndao.getPwd());

	                jsonArray.put(jsobj); // JSONArray에 JSONObject 추가
	            }//end of if (storedPassword.equals(inputPasswordHash)) {-----------
	        
	        }//end of for (NonMemberOrderVO ndao : ndaolist) {----------------

	        if (isPasswordCorrect) {
	            String json = jsonArray.toString();
	            request.setAttribute("json", json);
	            super.setRedirect(false);
	            super.setViewPage("/WEB-INF/jsonview.jsp");
	            
	        } else {
	        	String message = "비밀번호가 틀립니다!";
	            String loc = "javascript:history.back()";
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            super.setViewPage("/WEB-INF/msg.jsp");
	        }
	    }//end of if ("POST".equalsIgnoreCase(method)) {----------
	    else {
	        String message = "비정상적인 경로로 들어왔습니다";
	        String loc = "javascript:history.back()";
	        request.setAttribute("message", message);
	        request.setAttribute("loc", loc);
	        super.setViewPage("/WEB-INF/msg.jsp");
	    } //end of else {----------
	}//end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {--

	private String getSHA256(String input) {
	    try {
	        MessageDigest sha = MessageDigest.getInstance("SHA-256");
	        byte[] hashedBytes = sha.digest(input.getBytes());
	        StringBuilder hexHash = new StringBuilder(2 * hashedBytes.length);
	        for (byte b : hashedBytes) {
	        	hexHash.append(String.format("%02x", b & 0xff));
	        }
	        return hexHash.toString();
	    } catch (Exception e) {
	        // 예외 처리
	        e.printStackTrace();
	        return null;
	    }
	}
}
