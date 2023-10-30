package pys.myshop.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pys.myshop.domain.CategoryVO;
import pys.myshop.domain.ImageVO;
import pys.myshop.domain.ProductVO;

public class ProductDAO_imple implements ProductDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public ProductDAO_imple() {
		
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
	
	



	@Override
	public List<CategoryVO> getCategoryList() throws SQLException {
		List<CategoryVO> categoryList = new ArrayList<>(); 
	      
	      try {
	          conn = ds.getConnection();
	          
	          String sql = " select cnum, code, cname "  
	                    + " from tbl_category "
	                    + " order by cnum asc ";
	                    
	         pstmt = conn.prepareStatement(sql);
	               
	         rs = pstmt.executeQuery();
	                  
	         while(rs.next()) {
	            CategoryVO cvo = new CategoryVO();
	            cvo.setCnum(rs.getInt(1));
	            cvo.setCode(rs.getString(2));
	            cvo.setCname(rs.getString(3));
	            
	            categoryList.add(cvo);
	         }// end of while(rs.next())----------------------------------
	         
	      } finally {
	         close();
	      }   
	      
	      return categoryList;
	}//end of public List<CategoryVO> getCategoryList() throws SQLException 


	@Override
	public List<ProductVO> selectproductdefault() throws SQLException {
		
		List<ProductVO> productList = new ArrayList<>();
		
		try {
	          conn = ds.getConnection();
	          
	          String sql = " select pnum, pname, price, pdetail, pimage "  
	                    + " from tbl_product "
	                    + " where fk_cnum = 1 ";
	                    
	         pstmt = conn.prepareStatement(sql);
	               
	         rs = pstmt.executeQuery();
	                  
	         while(rs.next()) {
	        	 ProductVO pvo = new ProductVO();
	        	 
	        	 pvo.setPnum(rs.getInt(1));
	        	 pvo.setPname(rs.getString(2));
	        	 pvo.setPrice(rs.getInt(3));
	        	 pvo.setPdetail(rs.getString(4));
	        	 pvo.setPimage(rs.getString(5));
	        	 
	        	 productList.add(pvo);
	        	 
	        	 
	          }// end of while(rs.next())----------------------------------
	         
	      } finally {
	         close();
	      }   
		
		
		return productList;
	}

	
	//카테고리를 눌럿을때 메뉴리스트 보여주기
	@Override
	public List<ProductVO> menuList(String cnum) throws SQLException {
		
		List<ProductVO> menuList = new ArrayList<>();
		
		try {
	          conn = ds.getConnection();
	          
	          String sql = " select pnum, pname, price, pdetail, pimage "  
	                    + " from tbl_product "
	                    + " where fk_cnum = ? ";
	         
	          
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, cnum);
	         
	         rs = pstmt.executeQuery();
	                  
	         while(rs.next()) {
	        	 ProductVO pvo = new ProductVO();
	        	 
	        	 pvo.setPnum(rs.getInt(1));
	        	 pvo.setPname(rs.getString(2));
	        	 pvo.setPrice(rs.getInt(3));
	        	 pvo.setPdetail(rs.getString(4));
	        	 pvo.setPimage(rs.getString(5));
	        	 
	        	 menuList.add(pvo);
	        	 
	        	 
	          }// end of while(rs.next())----------------------------------
	         
	      } finally {
	         close();
	      }   
		
		
		return menuList;
	}


	
}
