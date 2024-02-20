package pys.myshop.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import pys.myshop.model.ProductDAO;
import pys.myshop.model.ProductDAO_imple;

public class LikeDislikeCountAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		  String pnum = request.getParameter("pnum");
	      
		  ProductDAO pdao = new ProductDAO_imple();
	      
	      Map<String, Integer> map = pdao.getLikeDislikeCnt(pnum);
	      
	      JSONObject jsonObj = new JSONObject(); // {}
	      
	      jsonObj.put("likecnt", map.get("likecnt"));       // {"likecnt":1}
	      jsonObj.put("dislikecnt", map.get("dislikecnt")); // {"likecnt":1, "dislikecnt":0} 
	      
	      String json = jsonObj.toString(); // "{"likecnt":1, "dislikecnt":0}"
	      
	      request.setAttribute("json", json);
	      
	   //   super.setRedirect(false);
	      super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
