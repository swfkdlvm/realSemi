package msh.register.model;

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
import msh.register.domain.ProductRegisterVO;

public class RegisterDAO_imple implements RegisterDAO {

	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public RegisterDAO_imple() {
		
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
	
	//제품의 카테고리 분류 가져오기
	@Override
	public List<ProductRegisterVO> selectRegisterlist() throws Exception {
		
		List<ProductRegisterVO> categorynum = new ArrayList<>();
	    
	    try {
	       conn = ds.getConnection();
	       
	       String sql =  " SELECT cname "
	       		      +  " FROM tbl_category ";

	       pstmt = conn.prepareStatement(sql);
			
	       rs = pstmt.executeQuery();
	       
	       while(rs.next()) {
	          
	    	   ProductRegisterVO rvo = new ProductRegisterVO();
	          
	    	   rvo.setCname(rs.getString(1));
	    	   categorynum.add(rvo);
	            
	       }// end of while
	         
	    } finally {
	    	close();
	    }
	      
	    return categorynum;
	}

	
	
	// tbl_product 테이블에 제품정보 insert 하기 
   @Override
   public int productInsert(ProductRegisterVO pvo) throws SQLException {
      
      int result = 0;
      
      try {
         conn = ds.getConnection();
         
         String sql =  " insert into tbl_product(pnum, pname, fk_cnum, pimage , pqty , price , pcontent, pdetail) "
         		+ " values(seq_tbl_product_pnum.nextval, ? , ? , ? , ? , ? , ? , ?) ";
         
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, pvo.getPname());
         pstmt.setInt(2, pvo.getFk_cnum());    
         pstmt.setString(3, pvo.getPimage());    
         pstmt.setInt(4, pvo.getPqty()); 
         pstmt.setInt(5, pvo.getPrice());
         pstmt.setString(6, pvo.getPcontent());
         pstmt.setString(7, pvo.getPdetail()); 
 
         
         result = pstmt.executeUpdate();
         
      } finally {
         close();
      }
      
      return result;
   }// end of public int productInsert(ProductVO pvo) throws SQLException-----

    // 제품번호 채번 해오기  
	@Override
	public int getPnumOfProduct() throws SQLException {
	      
		int pnum = 0;
	      
	    try {
	    	conn = ds.getConnection();
	         
	        String sql = " select seq_tbl_product_pnum.nextval AS PNUM "
	                   + " from dual ";
	         
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	         
	        rs.next();
	        pnum = rs.getInt(1);
	         
	    } finally {
	         close();
	    }
	      
	    return pnum;
	      
	}// end of public int getPnumOfProduct() throws SQLException-----

}
