package msh.CustomerService.model;

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

import msh.CustomerService.domain.NoticeVO;
import msh.event.domain.EventVO;

public class NoticeDAO_imple implements NoticeDAO {

		
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public NoticeDAO_imple() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
		    
		}catch(NamingException e) {
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

	//글 전체 갯수 구하기 
	@Override
	public int totalPspecCount() throws Exception {
		int totalCount = 0;
	      
	    try {
	    	conn = ds.getConnection();
	         
	        String sql = " select count(*)"
	                   + " from tbl_notice";
     
	        pstmt = conn.prepareStatement(sql);
	         
	        rs = pstmt.executeQuery();
	        rs.next();
	         
	        totalCount = rs.getInt(1);
	    } finally {
	    	close();
	    }
	      
	    return totalCount;
	}

	//공지사항 글 목록 가져오기
	@Override
	public List<NoticeVO> getNoticeList(Map<String, String> paraMap) throws Exception{
		
		List<NoticeVO> postList = new ArrayList<>();
	    
		try {
	    	 conn = ds.getConnection();
	       
	         String sql = " SELECT rno, seq, subject, readcount, TO_CHAR(regdate, 'yyyy-mm-dd hh24:mi:ss') AS regdate "
	        		+ " FROM ( "
	    		    + "  SELECT rownum AS RNO, seq, subject, readcount, regdate "
	    		    + "  FROM ( "
	    		    + "    SELECT seq, subject, readcount, regdate "
	    		    + "    FROM tbl_notice "
	    		    + "    WHERE status = 1 "
	    		    + "    ORDER BY seq " + ("asc".equals(paraMap.get("sortOrder")) ? "asc" : "desc")
	    		    + "  ) "
	    		    + " ) V "
	    		    + " WHERE RNO BETWEEN ? AND ? ";
 
		        pstmt = conn.prepareStatement(sql);

		        pstmt.setString(1, paraMap.get("startRno"));
	        pstmt.setString(2, paraMap.get("endRno"));
	       
	        rs = pstmt.executeQuery();
	       
	        while(rs.next()) {
	          
	    	    NoticeVO nvo = new NoticeVO();
	    	   
	    	    nvo.setRno(rs.getInt(1));
	            nvo.setSeq(rs.getInt(2));
	            nvo.setSubject(rs.getString(3));
	            nvo.setReadcount(rs.getInt(4));
	            nvo.setRegdate(rs.getString(5));
	            postList.add(nvo);
	            
	        }// end of while

	    } finally {
	         close();
	    }
	      return postList;
	}
	
	//공지사항 글쓰기
	@Override
	public int add_notice(NoticeVO nvo) throws Exception{
		int result = 0;
	      
	    try {
	    	conn = ds.getConnection();
	         
	        String sql =  " insert into tbl_notice(seq, subject, content , readCount , regDate , status) "
	         		   +  " values(tbl_notice_seq.NEXTVAL, ? , ?  , default , SYSDATE , default) ";
	         
	        pstmt = conn.prepareStatement(sql);
	         
	        pstmt.setString(1, nvo.getSubject());
	        pstmt.setString(2, nvo.getContent());        
    
	        result = pstmt.executeUpdate();
	         
	    } finally {
	    	close();
	    }  
	    return result;
	}

	//공지사항 각각의 글 상세보기
	@Override
	public NoticeVO getNoticeDetailView(Map<String, String> paraMap) throws Exception {
		NoticeVO noticevo = new NoticeVO();
			
		try {
			conn = ds.getConnection();
		       
		    String sql = " select prev_seq, prev_subject, seq, subject, content, readcount, regdate, next_seq, next_subject "
		        	   + " from ( "
		        	   + "     select lag(seq) over(order by seq desc) as prev_seq, "
		        	   + "            lag(subject) over(order by seq desc) as prev_subject, "
		        	   + "            seq, subject, content, readcount, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regdate, "
		        	   + "            lead(seq) over(order by seq desc) as next_seq, "
		        	   + "            lead(subject) over(order by seq desc) as next_subject "
		        	   + "     from tbl_notice "
		        	   + "     where status = 1 "
		        	   + " ) V "
		        	   + " where V.seq = ? " ;

		       
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, paraMap.get("seq"));
		       
		    rs = pstmt.executeQuery();
  
		    if (rs.next()) {
		    	noticevo.setPrev_seq(rs.getString("prev_seq"));
		        noticevo.setPrev_subject(rs.getString("prev_subject"));
		        noticevo.setSeq(rs.getInt("seq"));
		        noticevo.setSubject(rs.getString("subject"));
		        noticevo.setContent(rs.getString("content"));
		        noticevo.setReadcount(rs.getInt("readcount"));
		        noticevo.setRegdate(rs.getString("regdate"));
		        noticevo.setNext_seq(rs.getString("next_seq"));
		        noticevo.setNext_subject(rs.getString("next_subject"));
		     }
		}finally {
			close();
		}      
		return noticevo;
	}

	//공지사항 글 하나 삭제하기
	@Override
	public int del_notice(int seq) throws Exception{
		int result = 0;
	      
	    try {
	    	conn = ds.getConnection();
	         
	        String sql = " DELETE FROM tbl_notice "
	         		   + " WHERE seq = ? ";
		         
		         pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setInt(1, seq);      
 
		         result = pstmt.executeUpdate();
		         
		      } finally {
		         close();
		      }   
		      return result;
		}

	//공지사항 조회수 1 올리기
	@Override
	public int getNoticeDetailViewCnt(String seq) throws Exception{
		int result = 0;
			
		try {
			conn = ds.getConnection();
		         
		    String sql = " UPDATE tbl_notice "
	         		   + " SET readcount = readcount+1 "
	         		   + " WHERE seq = ? ";	         
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, seq);      
	        result = pstmt.executeUpdate();
	    } finally {
	    	 close();
	    }
	     return result;
	}

	//공지사항 글 수정 하기
	@Override
	public int edit_notice(NoticeVO nvo) throws Exception{
		int result = 0;
		
		try {
			conn = ds.getConnection();
	         
	        String sql = " UPDATE tbl_notice "
	         		   + " SET content = ? , subject = ? "
	         		   + " WHERE seq = ? ";	         
	        pstmt = conn.prepareStatement(sql);
	         
	        pstmt.setString(1, nvo.getContent());      
	        pstmt.setString(2, nvo.getSubject());
	        pstmt.setInt(3, nvo.getSeq());
	         
	        result = pstmt.executeUpdate();
	         
	     } finally {
	    	 close();
	     }
	      return result;
	}

	//검색하기
	@Override
	public List<NoticeVO> getNotisearch(Map<String, String> paraMap) throws Exception{
		List<NoticeVO> postList = new ArrayList<>();
	    
		try {
			conn = ds.getConnection();

		    String sql = " SELECT rno, seq, subject, readcount, TO_CHAR(regdate, 'yyyy-mm-dd hh24:mi:ss') AS regdate "
		               + " FROM ( "
		               + "     SELECT rownum AS RNO, seq, subject, readcount, regdate "
		               + "     FROM ( "
		               + "         SELECT seq, subject, readcount, regdate "
		               + "         FROM tbl_notice "
		               + "         WHERE status = 1 ";

		    if (paraMap.get("searchType").equals("subject") && !paraMap.get("searchWord").isEmpty()) {
		    	sql += " AND lower(subject) LIKE '%' || ? || '%' ";
		    } else if (paraMap.get("searchType").equals("content") && !paraMap.get("searchWord").isEmpty()) {
		        sql += " AND lower(content) LIKE '%' || ? || '%' ";
		    } else if (paraMap.get("searchType").equals("subject_content") && !paraMap.get("searchWord").isEmpty()) {
		        sql += " AND (lower(subject) LIKE '%' || ? || '%' OR lower(content) LIKE '%' || ? || '%') ";
		    }

		    	 sql+= "    	  ORDER BY seq DESC "
		            + "        ) "
		            + "   ) V "
		            + " WHERE RNO BETWEEN ? AND ? ";

		    pstmt = conn.prepareStatement(sql);

		    int parameterIndex = 1;

		    if (paraMap.get("searchType").equals("subject") || paraMap.get("searchType").equals("content") ||
		        paraMap.get("searchType").equals("subject_content")) {
		            pstmt.setString(parameterIndex++, paraMap.get("searchWord"));
		    if (paraMap.get("searchType").equals("subject_content")) {
		            pstmt.setString(parameterIndex++, paraMap.get("searchWord"));
		        }
		    }

		    pstmt.setInt(parameterIndex++, Integer.parseInt(paraMap.get("startRno")));
		    pstmt.setInt(parameterIndex, Integer.parseInt(paraMap.get("endRno")));

		    rs = pstmt.executeQuery();
		    while (rs.next()) {
		    	NoticeVO nvo = new NoticeVO();

		        nvo.setRno(rs.getInt(1));
		        nvo.setSeq(rs.getInt(2));
		        nvo.setSubject(rs.getString(3));
		        nvo.setReadcount(rs.getInt(4));
		        nvo.setRegdate(rs.getString(5));
		        postList.add(nvo);
		    }

		} finally {
			close();
		}

		return postList;
	}

	//검색한 글의 총 갯수
	@Override
	public int SearchtotalCount(Map<String, String> paraMap) throws Exception{
		int totalCount = 0;

	    try {
	        conn = ds.getConnection();

	        String sql = "SELECT count(*) FROM tbl_notice WHERE status = 1";

	        if (paraMap.containsKey("searchType") && paraMap.containsKey("searchWord")) {
	        	if (paraMap.get("searchType").equals("subject") && !paraMap.get("searchWord").isEmpty()) {
	        		sql += " AND lower(subject) LIKE '%' || ? || '%' ";
	            } else if (paraMap.get("searchType").equals("content") && !paraMap.get("searchWord").isEmpty()) {
	                sql += " AND lower(content) LIKE '%' || ? || '%' ";
	            } else if (paraMap.get("searchType").equals("subject_content") && !paraMap.get("searchWord").isEmpty()) {
	                sql += " AND (lower(subject) LIKE '%' || ? || '%' OR lower(content) LIKE '%' || ? || '%') ";
	            }
	        }

	        pstmt = conn.prepareStatement(sql);

	        if (paraMap.containsKey("searchType") && paraMap.containsKey("searchWord")) {
	            pstmt.setString(1, paraMap.get("searchWord"));
	            if (paraMap.get("searchType").equals("subject_content")) {
	                pstmt.setString(2, paraMap.get("searchWord"));
	            }
	        }

	        rs = pstmt.executeQuery();

	        rs.next();

	        totalCount = rs.getInt(1);

	    } finally {
	        close();
	    }

	    return totalCount;
	}

	//임시 저장하기
	@Override
	public int add_temp_notice(NoticeVO nvo) throws Exception{
		int result = 0;
	      
	      try {
	    	  conn = ds.getConnection();
	         
	          String sql =  "  insert into tbl_temp_notice(seq, subject, content , regDate) "
	         		     +  "  values(tbl_temp_notice_Seq.NEXTVAL, ? , ?  , SYSDATE ) ";
	         
	          pstmt = conn.prepareStatement(sql);
	         
	          pstmt.setString(1, nvo.getSubject());
	          pstmt.setString(2, nvo.getContent());        
  
	          result = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
	      return result;
	}

	//임시저장 글목록 가져오기
	@Override
	public List<NoticeVO> getTemp_NoticeList(Map<String, String> paraMap) throws Exception{
		List<NoticeVO> temp_postList = new ArrayList<>();
	    
	    try {
	       conn = ds.getConnection();
	       
	       String sql = " SELECT rno, seq, subject, TO_CHAR(regdate, 'yyyy-mm-dd hh24:mi:ss') AS regdate "
	    		      + " FROM ( "
	    		      + "     SELECT rownum AS RNO, seq, subject, regdate "
	    		      + "     FROM ( "
	    		      + "         SELECT seq, subject, regdate "
	    		      + "         FROM tbl_temp_notice "
	    		      + "         order by seq desc  "
	    		      + "      ) "
	    		      + " ) V "
	    		      + " WHERE RNO BETWEEN ? AND ? ";

	       
	       pstmt = conn.prepareStatement(sql);

	       pstmt.setString(1, paraMap.get("startRno"));
	       pstmt.setString(2, paraMap.get("endRno"));
	       
	       rs = pstmt.executeQuery();
	        while(rs.next()) {
	          
	        	NoticeVO nvo = new NoticeVO();
	    	    nvo.setRno(rs.getInt(1));
	            nvo.setSeq(rs.getInt(2));
	            nvo.setSubject(rs.getString(3));
	            nvo.setRegdate(rs.getString(4));
	            temp_postList.add(nvo);
	            
	        }// end of while
	         
	    } finally {
	         close();
	    }
	    return temp_postList;
	}

	//임시 글 내용 조회
	@Override
	public NoticeVO getNoticeTemp_DetailView(Map<String, String> paraMap) throws Exception{
		
		NoticeVO temp_noticevo = new NoticeVO();
		
		try {
		       conn = ds.getConnection();
		       
		       String sql = "SELECT seq, subject, content, regdate " +
		               "     FROM ( " +
		               "          SELECT seq, subject, content, TO_CHAR(regdate, 'yyyy-mm-dd hh24:mi:ss') AS regdate " +
		               "          FROM tbl_temp_notice " +
		               "     ) V " +
		               "     WHERE V.seq = ? ";

		       pstmt = conn.prepareStatement(sql);
		       
		       pstmt.setString(1, paraMap.get("seq"));
		       
		       rs = pstmt.executeQuery();
			          
		    	  
		       if (rs.next()) {
		    	   temp_noticevo.setSeq(rs.getInt("seq"));
		    	   temp_noticevo.setSubject(rs.getString("subject"));
		    	   temp_noticevo.setContent(rs.getString("content"));
		    	   temp_noticevo.setRegdate(rs.getString("regdate"));
		       }
		}finally {
			close();
		}
			      
		return temp_noticevo;
	}

	//임시 글 갯수 조회하기
	@Override
	public int totalTempCount() throws Exception {
		int totalCount = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select count(*)"
	                  + "   from tbl_temp_notice ";
   
	         pstmt = conn.prepareStatement(sql);
	         
	         rs = pstmt.executeQuery();		         
	         rs.next();
	         
	         totalCount = rs.getInt(1);

	      } finally {
	         close();
	      }
	      return totalCount;
	}

	//임시 글 삭제하기
	@Override
	public int del_temp_notice(int seq) throws Exception {
		int result = 0;
	      
	    try {
	    	conn = ds.getConnection();
	         
	        String sql =  " DELETE FROM tbl_temp_notice "
	         		   +  " WHERE seq = ? ";
		         
		        pstmt = conn.prepareStatement(sql);
		         
		        pstmt.setInt(1, seq);      

		        result = pstmt.executeUpdate();
		         
		    } finally {
		    	close();
		    }     
		      return result;
	}	


}
