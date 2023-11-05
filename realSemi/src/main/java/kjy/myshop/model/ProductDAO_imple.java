package kjy.myshop.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kjy.myshop.domain.*;
import kjy.myshop.domain.*;

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

	   
	// 카테고리 리스트
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
	}// end of public List<CategoryVO> getCategoryList() throws SQLException----
	   
	   
	// 스페셜팩 화면 처음 띄울때 스페셜 상품 보여주기
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

	
	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기
	// 메뉴 상세 페이지에서 카테고리 정보도 넘겨야하기 때문에 카테고리 테이블과 JOIN함
	@Override
	public ProductVO selectOneProduct(String pnum) throws SQLException {
		
		ProductVO pvo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " SELECT cname, pname, pimage, pcontent, pdetail "
					+ "FROM "
					+ "( "
					+ "select pnum, pname, pimage, pcontent, pdetail, fk_cnum "
					+ "from tbl_product "
					+ "where pnum = ? "
					+ ")P JOIN tbl_category C "
					+ "ON P.fk_cnum = C.cnum ";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				pvo = new ProductVO();
				
				pvo.setPname(rs.getString("PNAME")); 		// 제품명
				pvo.setPimage(rs.getString("PIMAGE"));   	// 제품이미지 파일명
				pvo.setPcontent(rs.getString("PCONTENT"));  // 제품 설명
				pvo.setPdetail(rs.getString("PDETAIL"));    // 제품 구성
				
				CategoryVO cvo = new CategoryVO();
				cvo.setCname(rs.getString("CNAME")); // 스펙명
				pvo.setCategvo(cvo);
				
			}// end of while(rs.next())-------------- 
			
		} finally {
			close();
		}
		
		return pvo;
		
	}

	
	
	
	
	

	
}
