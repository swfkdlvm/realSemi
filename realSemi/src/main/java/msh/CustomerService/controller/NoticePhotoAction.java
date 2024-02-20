package msh.CustomerService.controller;

import java.io.File;
import java.io.PrintWriter;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import common.controller.FileManager;


import common.controller.AbstractController;

public class NoticePhotoAction extends AbstractController{

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
	    String root = session.getServletContext().getRealPath("/");
	    String path = root + "resources"+File.separator+"realSemi_photo_upload";
	      
	    File dir = new File(path);
	      
	    if(!dir.exists()) {
	    	dir.mkdirs();
	    }
	      
	    try {
	    	String originalFilename = request.getHeader("file-name"); // 파일명(문자열) - 일반 원본파일명
	            
	        InputStream is = request.getInputStream(); // is는 네이버 스마트 에디터를 사용하여 사진첨부하기 된 이미지 파일임.
	            
	        String newFilename = FileManager.doFileUpload(is, originalFilename , path);
	            
	        String ctxPath = request.getContextPath(); //  /board
	         
	        String strURL = "";
	        strURL += "&bNewLine=true&sFileName="+newFilename; 
	        strURL += "&sFileURL="+ctxPath+"/resources/realSemi_photo_upload/"+newFilename;
	         
	         // === 웹브라우저 상에 사진 이미지를 쓰기 === //
	         PrintWriter out = response.getWriter();
	         out.print(strURL);
	            
	    }catch(Exception e) {
	    	e.printStackTrace();
        }
	}
	
}		
