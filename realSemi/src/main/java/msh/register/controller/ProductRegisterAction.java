package msh.register.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import msh.register.controller.*;
import msh.register.domain.*;
import msh.register.model.*;

public class ProductRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		RegisterDAO rdao = new RegisterDAO_imple();
		     
		String method = request.getMethod();

		if(!"POST".equals(method)) {  //GET이라면
	         //카테고리 목록을 조회해오기
			List <ProductRegisterVO> categorynum = rdao.selectRegisterlist();

			request.setAttribute("categorynum", categorynum);
			
	        super.setRedirect(false);
	        super.setViewPage("/WEB-INF/msh.productRegister/productRegister_before.jsp");      
		 }
	           
	     else{ //POST이라면
	                
	    	 MultipartRequest mtrequest = null;
	              
	             
	         ServletContext svlCtx = session.getServletContext();
	         String uploadFileDir = svlCtx.getRealPath("/image");
	              
	              
	         try {
	        	 mtrequest = new MultipartRequest(request, uploadFileDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	         }
	         catch(IOException e){
	             request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
	             request.setAttribute("loc", request.getContextPath()+"/productregister.bk" );
	             super.setRedirect(false);
	             super.setViewPage("/WEB-INF/msg.jsp");
	             return; // 종료   
	         }
	         // === 첨부 이미지 파일, 제품설명서 파일을 올렸으니 그 다음으로 제품정보를 (제품명, 정가, 제품수량,...) DB의 tbl_product 테이블에 insert 를 해주어야 한다.  ===
	         
	         String fk_cnum = mtrequest.getParameter("fk_cnum"); //카테고리 번호
	         String pname = mtrequest.getParameter("pname"); //제품명
	         String pnum = mtrequest.getParameter("pnum");
	         String pimage = mtrequest.getFilesystemName("pimage");//제품이미지1
	         String pqty = mtrequest.getParameter("pqty");  //제품 재고량
	         String price = mtrequest.getParameter("price");//제품 판매가
	         String pdetail= mtrequest.getParameter("pdetail");
	          // !!!! 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어코드) 작성하기 !!!! // 
	          String pcontent = mtrequest.getParameter("pcontent");
	          pcontent = pcontent.replaceAll("<", "&lt;");
	          pcontent = pcontent.replaceAll(">","&gt;");  
	          pcontent = pcontent.replaceAll("\r\n", "<br>");
	              
	          pdetail = pdetail.replaceAll("<", "&lt;");
	          pdetail = pdetail.replaceAll(">","&gt;");
	          pdetail = pdetail.replaceAll("\r\n", "<br>");
	              
	          int pnum2 = rdao.getPnumOfProduct(); //제품번호 채번 해오기 채번이라는 거는 행을 추가할떄 nextval이 예를 78이면 다음으로 79로 넘어가기에 테이블 둘다 똑같이 78을 주기위해 자바를 이용한다.
	              
	          ProductRegisterVO pvo = new ProductRegisterVO();
	          pvo.setPnum(pnum2); ///-- 제품번호(Primary Key)
	          pvo.setPname(pname); //제품명
	          pvo.setFk_cnum(Integer.parseInt(fk_cnum)); //카테고리코드(Foreign Key)의 시퀀스번호 참조
	          pvo.setPimage(pimage); //제품이미지1
	          pvo.setPqty(Integer.parseInt(pqty)); //제품 재고량
	          pvo.setPrice(Integer.parseInt(price)); //제품 정가
	          pvo.setPcontent(pcontent); //제품 판매가(힐인해서 팔것이므로)
	          pvo.setPdetail(pdetail); //제품설명

	          String message = "";
	          String loc = "";
	              
	          try {
	          // tbl_product 테이블에 제품정보 insert 하기 
	        	  int n = rdao.productInsert(pvo);
	              message = "제품등록 성공!!!!";
	              loc = request.getContextPath()+"/registersuccess.bk";
	          }catch(SQLException e) {
	               e.printStackTrace();
	               message = "DB장애로 인해 제품등록 실패!";
	               loc = request.getContextPath()+"/productregister.bk";
	          }
	              
	          request.setAttribute("message", message);
	          request.setAttribute("loc", loc); 
	          super.setViewPage("/WEB-INF/msg.jsp");
	      }//end of else{------------------
	            
	} 
	
}
	         
	         
	     


		
