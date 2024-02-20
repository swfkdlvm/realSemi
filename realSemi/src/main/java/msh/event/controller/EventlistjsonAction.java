package msh.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import msh.event.domain.*;
import msh.event.model.*;

public class EventlistjsonAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   // js 안의 json 데이터들을 파라미터로 받아온 것

	      String start = request.getParameter("start");
	      String len = request.getParameter("len");
	      
	      EventDAO edao = new EventDAO_imple();
	      
	      Map<String, String> paraMap = new HashMap<>();
	      paraMap.put("start", start); // start    "1"   "9"   "17"    "24"
	      
	      String end = String.valueOf(Integer.parseInt(start) + Integer.parseInt(len) - 1);
	      paraMap.put("end", end); // end => start + len - 1    
	                               // end     "8"   "16"   "24"   "32"   "40"
	      
	      List<EventVO> eventList = edao.selectEventlist(paraMap);
	      
	      JSONArray jsonArr = new JSONArray(); // [] 이모양임.
	      
	      if( eventList.size() > 0) {
	         // DB에서 조회해온 결과물이 있을 경우
	         
	         for(EventVO evo : eventList) { 
	            
	            JSONObject jsonObj = new JSONObject(); // {}
	            jsonObj.put("eventimg", evo.getEventimg());  
	            jsonObj.put("eventdate", evo.getEventdate()); 
	            jsonObj.put("eventimgdetail", evo.getEventimgdetail());
	            jsonObj.put("eventitle", evo.getEventitle());
	            jsonObj.put("eventno", evo.getEventno());
	            
	            jsonArr.put(jsonObj);  //[{}]
	            
	         } // end of for ------------------------

	      } // end of if -----
	      
	      String json = jsonArr.toString(); // 문자열로 변환
	      
	      request.setAttribute("json", json);
	      
	      super.setViewPage("/WEB-INF/jsonview.jsp");
	      
		
	}

}
