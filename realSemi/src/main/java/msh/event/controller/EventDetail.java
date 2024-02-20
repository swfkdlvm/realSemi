package msh.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import msh.event.domain.*;
import msh.event.model.*;

public class EventDetail extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
	  String eventno = request.getParameter("eventno");// 이벤트 번호
      
      EventDAO pdao = new EventDAO_imple();
      
      // 이벤트 번호로 조회해오기
      EventVO pvo = pdao.selectOneProductByPnum(eventno);

      if(pvo == null) {
           String message = "검색하신 은 존재하지 않습니다.";
           String loc = "javascript:history.back()";
           
           request.setAttribute("message", message);
           request.setAttribute("loc", loc);
           
           super.setViewPage("/WEB-INF/msg.jsp");
            
           return;
      }
      else {
         // 제품이 있는 경우
         request.setAttribute("pvo", pvo);        
         super.setViewPage("/WEB-INF/msh.event/eventDetail.jsp");
         
      }
      
    }

}