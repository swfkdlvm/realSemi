package msh.CustomerService.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import msh.CustomerService.domain.NoticeVO;
import msh.CustomerService.model.NoticeDAO;
import msh.CustomerService.model.NoticeDAO_imple;

public class NoticeTempWriteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		int n = 0;
		
		if("POST".equalsIgnoreCase(method)) {			
		
			NoticeDAO ndao = new NoticeDAO_imple();
			
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			NoticeVO nvo = new NoticeVO();
			
	        nvo.setSubject(subject);
	        nvo.setContent(content);
	
			try {
				n = ndao.add_temp_notice(nvo);
			} catch (Throwable e) {
				e.printStackTrace();
			}
			
			JSONObject jsonObj = new JSONObject();
	        jsonObj.put("n", n);
	         
	        String json = jsonObj.toString();  
	         
	        request.setAttribute("json", json);
	
	        super.setViewPage("/WEB-INF/jsonview.jsp");
    	  
		}
	
		else{
	        // **** POST 방식으로 넘어온 것이 아니라면 **** // 
	        String message = "비정상적인 경로를 통해 들어왔습니다.!!";
	        String loc = "javascript:history.back()";
	        
	        request.setAttribute("message", message);
	        request.setAttribute("loc", loc);
	        
	        super.setRedirect(false);
	        super.setViewPage("/WEB-INF/msg.jsp");
	    } 
	}
		
}
