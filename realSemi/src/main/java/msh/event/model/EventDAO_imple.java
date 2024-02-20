package msh.event.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import msh.event.domain.*;


public class EventDAO_imple implements EventDAO {
	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public EventDAO_imple() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
		    
		} catch(NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기 
	private void close() {
		try {
			if(rs != null)    {rs.close();    rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close();  conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//모든 이벤트 목록 총 개수 구하기
	@Override
	public int totalPspecCount() throws Exception {
		
		int totalCount = 0;
	      
	    try {
	    	conn = ds.getConnection();
	         
	        String sql = " select count(*)"
	                   + " from event ";
	                  
	         
	        pstmt = conn.prepareStatement(sql);
	         
	        rs = pstmt.executeQuery();
	        rs.next();
	         
	        totalCount = rs.getInt(1);

	    } finally {
	    	close();
	    }
	    return totalCount;
	}
	
	//이벤트 썸네일 이미지,기간,번호 전부 가져오기
	@Override
	public List<EventVO> selectEventlist(Map<String, String> paraMap) throws Exception {

		List<EventVO> eventList = new ArrayList<>();
	    
	    try {
	       conn = ds.getConnection();
	       
	       String sql = " select eventimg,eventdate, eventno "
		       		  + " from event "
		       		  + " WHERE eventno between ? and ? ";
	       
	       pstmt = conn.prepareStatement(sql);
	       
	       pstmt.setString(1, paraMap.get("start"));
	       pstmt.setString(2, paraMap.get("end"));
	       
	       rs = pstmt.executeQuery();
	       
	       while(rs.next()) {
	          
	    	   EventVO evo = new EventVO();
	          
	           evo.setEventimg(rs.getString(1));
	           evo.setEventdate(rs.getString(2));
	           evo.setEventno(rs.getInt(3));
	           eventList.add(evo);        
	       }// end of while
	         
	    } finally {
	    	close();
	    }
	      
	    return eventList;
	}

	//현재 진행하는 이벤트의 썸네일 이미지,기간,번호만 전부 가져오기
	@Override
	public List<EventVO> eventimgPresent() throws Exception {
		List<EventVO> eventpresentlist = new ArrayList<>();
	    
	    try {
	       conn = ds.getConnection();
	       
	       String sql = " SELECT eventno, eventimg, eventdate "
	       		      + " FROM event "
	       		      + " WHERE LENGTH(eventdate) < 12 OR "
	       		      + " (LENGTH(eventdate) >= 12 AND  TO_DATE(SUBSTR(eventdate, 12, 21),'YYYY-MM-DD') > SYSDATE ) "; 
	    		   
	       
	       pstmt = conn.prepareStatement(sql);
			
		   rs = pstmt.executeQuery();
			
		   while(rs.next()) {
			   
			   EventVO evtvo = new EventVO();
			   
			   evtvo.setEventno(rs.getInt(1));
			   evtvo.setEventimg(rs.getString(2));
			   evtvo.setEventdate(rs.getString(3));			
			   
			   eventpresentlist.add(evtvo);
		   }// end of while(rs.next())-----------------
			
		} finally {
			close();
		}
		
		return eventpresentlist;
	}



	//이벤트 번호를 가지고서 이벤트 글 상세보기 
	@Override
	public EventVO selectOneProductByPnum(String eventno) throws SQLException {

		EventVO pvo = null;
	   
	    try {
	    	conn = ds.getConnection();
	      
	    	String sql =  " select eventno, eventimgdetail, eventitle, eventdate "
		      		   +  " from event "
		      		   +  " where eventno = ? ";
		      
		     pstmt = conn.prepareStatement(sql);
		      
		     pstmt.setString(1, eventno);
  
	         rs = pstmt.executeQuery();
	      
	         if(rs.next()) {
	         
	        	 pvo = new EventVO();
	        	 pvo.setEventno(rs.getInt("eventno"));           
	        	 pvo.setEventimgdetail(rs.getString("eventimgdetail"));      
	        	 pvo.setEventitle(rs.getString("eventitle"));
	        	 pvo.setEventdate(rs.getString("eventdate"));   
             
	         }// end of while(rs.next())-------------------------	      
	      
	   } finally {
	      close();
	   }
	   return pvo;            
	   
	}// end of public ProductVO selectOneProductByPnum(String pnum) throws SQLException--------

}

