package pys.myshop.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pys.member.domain.MemberVO;
import pys.myshop.domain.CartVO;
import pys.myshop.domain.CategoryVO;
import pys.myshop.domain.ProductVO;
import pys.myshop.domain.PurchaseReviewsVO;

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

	// 장바구니에 넣어주는 메소드 
	@Override
	public int addCart(Map<String, String> paraMap) throws SQLException {
		int n = 0;
		
		try {
			
			conn = ds.getConnection();
			
		
			String sql = " select cartno "
					   + " from tbl_cart "
					   + " where fk_userid = ? and fk_pnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid") );
			pstmt.setString(2, paraMap.get("pnum") );
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 어떤 제품을 추가로 장바구니에 넣고자 하는 경우
				sql = " update tbl_cart set oqty = oqty + 1 "
					+ " where cartno = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt("CARTNO"));
				
				n = pstmt.executeUpdate();
					
			}
			else {
				// 장바구니에 존재하지 않는 새로운 제품을 넣고자 하는 경우
				sql = " insert into tbl_cart(cartno, fk_userid, fk_pnum, oqty, registerday) "
					+ " values(seq_tbl_cart_cartno.nextval, ?, ?, 1, default) ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("userid"));
				pstmt.setInt(2, Integer.parseInt(paraMap.get("pnum")));
				
				
				n = pstmt.executeUpdate();
				
			}
			
		} finally {
			close();
		}
			
		
		
		
		return n;
		
	}// end of public int addCart(Map<String, String> paraMap) throws SQLException

	// 장바구니에 넣어주고 조회하기
	@Override
	public List<CartVO> selectProductCart(String userid) throws SQLException {
		
		List<CartVO> cartList = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql =  " select C.cartno, C.fk_userid, C.fk_pnum, C.oqty, P.pname, P.pimage, P.price,P.pdetail,P.pqty "
						+ " from ( select cartno, fk_userid, fk_pnum, oqty, registerday "
						+ "        from tbl_cart "
						+ "        where fk_userid = ?) C "
						+ " JOIN tbl_product P "
						+ " ON C.fk_pnum = P.pnum "
						+ " ORDER BY C.cartno DESC ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				
				if(cnt == 1) {
					cartList = new ArrayList<>();
					
				}
				int cartno = rs.getInt("CARTNO");  
				String fk_userid = rs.getString("FK_USERID"); 
				int fk_pnum = rs.getInt("FK_PNUM"); 
				int oqty = rs.getInt("OQTY"); 
				String pname = rs.getString("PNAME");  
				String pimage = rs.getString("PIMAGE"); 
				int price = rs.getInt("PRICE");
				String pdetail = rs.getString("PDETAIL");
				int pqty = rs.getInt("pqty");
				
				ProductVO prodvo = new ProductVO();
				prodvo.setPnum(fk_pnum);
				prodvo.setPname(pname);
				prodvo.setPimage(pimage);
				prodvo.setPrice(price);
				prodvo.setPdetail(pdetail);
				prodvo.setPqty(pqty);
				
				// ***** !!!! 중요함 !!!! ***** //
				
				prodvo.setTotalPriceTotalPoint(oqty);
				// ***** !!!! 중요함 !!!! ***** //
				
				CartVO cvo = new CartVO();
				cvo.setCartno(cartno);
				cvo.setFk_userid(fk_userid);
				cvo.setFk_pnum(fk_pnum);
				cvo.setOqty(oqty);
				cvo.setProd(prodvo);
				
				cartList.add(cvo);
				
			}//end of while
			
			
			
		} finally {
			close();
		}
		
		return cartList;
		
	}


	@Override
	public Map<String, String> selectCartSumPricePoint(String userid) throws SQLException {
		
		Map<String, String> sumMap = new HashMap<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select  nvl(sum(C.oqty * P.price),0) AS SUMTOTALPRICE "
					   + " from ( select fk_pnum, oqty "
					   + "        from tbl_cart "
					   + "        where fk_userid = ?) C "
					   + " JOIN tbl_product P "
					   + " ON C.fk_pnum = P.pnum ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			sumMap.put("SUMTOTALPRICE", rs.getString("SUMTOTALPRICE"));
			
			
			
		} finally {
			close();
		}
		
		
		return sumMap;
		
	}

	// 장바구니 수량변경
	@Override
	public int updateCart(Map<String, String> paraMap) throws SQLException {
		
		int n = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " update tbl_cart set oqty = ? "
	                  + " where cartno = ? ";
	                  
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, paraMap.get("oqty") );
	         pstmt.setString(2, paraMap.get("cartno") );
	         
	         n = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
	      return n;
	}

	// 장바구니에서 삭제하기
	@Override
	public int delCart(String cartno) throws SQLException {
		int n = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " delete from tbl_cart "
	                  + " where cartno = ? ";
	                  
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, cartno);
	         
	         n = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
	      return n;
	}//end of public int delCart(String cartno) throws SQLException {

	
	
	// 특정 유저의 장바구니 상세테이블 개수 알아오기
	@Override
	public Map<String, String> countCart(String userid) throws SQLException {
		int cnt = 0;
		Map<String, String> countMap = new HashMap<>();

		try {
			conn = ds.getConnection();
			
			String sql = " select pname "
					   + " from "
					   + "( "
					   + " select * "
					   + " from tbl_cart "
					   + " where fk_userid = ? "
					   + " )C JOIN tbl_product P "
					   + " ON C.fk_pnum = P.pnum ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				countMap.put("pname", rs.getString("PNAME"));
				cnt++;
				
			}
			countMap.put("cnt", String.valueOf(cnt));
			
			
		} finally {
			close();
		}
		
		
		return countMap;
		
	}// 특정 유저의 장바구니 상세테이블 개수 알아오기
	
	// 로그인한 사용자가 특정 제품을 구매했는지 여부를 알아오는 것 구매했다라면 true, 구매하지 않았다면 false 를 리턴함.
		@Override
		   public boolean isOrder(Map<String, String> paraMap) throws SQLException {
		      
		      boolean bool = false;
		      
		      try {
		         conn = ds.getConnection();
		         
		         String sql = " select D.odrseqnum " + 
		                    " from tbl_orderdetail D JOIN tbl_order O " + 
		                    " on D.fk_odrcode = O.odrcode " + 
		                    " where D.fk_pnum = ? and O.fk_userid = ? ";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, paraMap.get("fk_pnum"));
		         pstmt.setString(2, paraMap.get("fk_userid"));
		         
		         rs = pstmt.executeQuery();
		         
		         bool = rs.next();
		         
		      } finally {
		         close();
		      }
		      
		      return bool;
		   }

		// 상품 후기 등록
		@Override
		public int addReview(PurchaseReviewsVO reviewsvo) throws SQLException {
			
			int n = 0;
		      
		      try {
		         conn = ds.getConnection();
		         
		         String sql = " insert into tbl_purchase_reviews(review_seq, fk_userid, fk_pnum, contents, writeDate) "
		                  + " values(seq_purchase_reviews.nextval, ?, ?, ?, default) ";
		                  
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, reviewsvo.getFk_userid());
		         pstmt.setInt(2, reviewsvo.getFk_pnum());
		         pstmt.setString(3, reviewsvo.getContents());
		         
		         n = pstmt.executeUpdate();
		         
		      } finally {
		         close();
		      }
		      
		      return n;
			
		}// end of public int addReview(PurchaseReviewsVO reviewsvo) throws SQLException

		//좋아요 투표하기
		@Override
		public int likeAdd(Map<String, String> paraMap) throws SQLException {
			
			int n = 0;
		      
		      try {
		         conn = ds.getConnection();
		         
		         conn.setAutoCommit(false); // 수동커밋으로 전환 
		         
		         String sql = " delete from tbl_product_dislike " + 
		                      " where fk_userid = ? and fk_pnum = ? ";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, paraMap.get("userid") );
		         pstmt.setString(2, paraMap.get("pnum"));
		         
		         pstmt.executeUpdate();

		         
		         sql = " insert into tbl_product_like(fk_userid, fk_pnum) " + 
		                " values(?, ?) ";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, paraMap.get("userid") );
		         pstmt.setString(2, paraMap.get("pnum"));
		         
		         n = pstmt.executeUpdate();
		                  
		         if(n == 1) {
		            conn.commit();
		         }
		         
		      } catch(SQLIntegrityConstraintViolationException e) {
		         conn.rollback();
		      } finally {
		         conn.setAutoCommit(true); // 자동커밋으로 전환 
		         close();
		      }
		      
		      return n;
		}// end of public int likeAdd(Map<String, String> paraMap) throws SQLException
		
		// 싫어요 투표하기
		@Override
		public int dislikeAdd(Map<String, String> paraMap) throws SQLException {
			int n = 0;
		      
		      try {
		         conn = ds.getConnection();
		         
		         conn.setAutoCommit(false); // 수동커밋으로 전환 
		         
		         String sql = " delete from tbl_product_like " + 
		                      " where fk_userid = ? and fk_pnum = ? ";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, paraMap.get("userid") );
		         pstmt.setString(2, paraMap.get("pnum"));
		         
		         pstmt.executeUpdate();

		         
		         sql = " insert into tbl_product_dislike(fk_userid, fk_pnum) " + 
		                " values(?, ?) ";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, paraMap.get("userid") );
		         pstmt.setString(2, paraMap.get("pnum"));
		         
		         n = pstmt.executeUpdate();
		                  
		         if(n == 1) {
		            conn.commit();
		         }
		         
		      } catch(SQLIntegrityConstraintViolationException e) {
		         conn.rollback();
		      } finally {
		         conn.setAutoCommit(true); // 자동커밋으로 전환 
		         close();
		      }
		      
		      return n;
		}//end of public int dislikeAdd(Map<String, String> paraMap) throws SQLException


		@Override
		public Map<String, Integer> getLikeDislikeCnt(String pnum) throws SQLException {
			Map<String, Integer> map = new HashMap<>();
		      
		      try {
		         conn = ds.getConnection();
		         
		         String sql = " select ( select count(*) "+
		                    "          from tbl_product_like "+
		                    "          where fk_pnum = ? ) AS LIKECNT "+
		                    "      , ( select count(*) "+
		                    "          from tbl_product_dislike "+
		                    "          where fk_pnum = ? ) AS DISLIKECNT "+
		                    " from dual ";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, pnum);
		         pstmt.setString(2, pnum);
		         
		         rs = pstmt.executeQuery();
		         
		         rs.next();
		         
		         map.put("likecnt", rs.getInt(1));
		         map.put("dislikecnt", rs.getInt(2));
		         
		      } finally {
		         close();
		      }
		      
		      return map;
		}//end of public int dislikeAdd(Map<String, String> paraMap) throws SQLException

		//리뷰 리스트 보기
		@Override
		public List<PurchaseReviewsVO> reviewList(String fk_pnum) throws SQLException {
			
			List<PurchaseReviewsVO> reviewList = new ArrayList<>();
		      
		      try {
		         conn = ds.getConnection();
		         
		         String sql = " select review_seq, fk_userid, name, fk_pnum, contents, to_char(writeDate, 'yyyy-mm-dd hh24:mi:ss') AS writeDate "+
		                    " from tbl_purchase_reviews R join tbl_member M "+
		                    " on R.fk_userid = M.userid  "+
		                    " where R.fk_pnum = ? "+
		                    " order by review_seq desc ";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, fk_pnum);
		         
		         rs = pstmt.executeQuery();
		         
		         while(rs.next()) {
		            String contents = rs.getString("contents");
		            String name = rs.getString("name");
		            String writeDate = rs.getString("writeDate");
		            String fk_userid = rs.getString("fk_userid");
		            int review_seq = rs.getInt("review_seq");
		                                    
		            PurchaseReviewsVO reviewvo = new PurchaseReviewsVO();
		            reviewvo.setContents(contents);
		            
		            MemberVO mvo = new MemberVO();
		            mvo.setName(name);
		            
		            reviewvo.setMvo(mvo);
		            reviewvo.setWriteDate(writeDate);
		            reviewvo.setFk_userid(fk_userid);
		            reviewvo.setReview_seq(review_seq);
		            
		            reviewList.add(reviewvo);
		         }         
		         
		      } finally {
		         close();
		      }
		      
		      return reviewList;   
		}//end of public List<PurchaseReviewsVO> reviewList(String fk_pnum) throws SQLException

		// 리뷰 지우기
		@Override
		public int reviewDel(String review_seq) throws SQLException {

			int n = 0;
		      
		      try {
		         conn = ds.getConnection();
		         
		         String sql = " delete from tbl_purchase_reviews "
		                  + " where review_seq = ? ";
		                  
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, review_seq);
		         
		         n = pstmt.executeUpdate();
		         
		      } finally {
		         close();
		      }
		      
		      return n;
		}//end of public int reviewDel(String review_seq) throws SQLException

		// 리뷰 수정하기
		@Override
		public int reviewUpdate(Map<String, String> paraMap) throws SQLException {
			int n = 0;
		      
		      try {
		         conn = ds.getConnection();
		         
		         String sql = " update tbl_purchase_reviews set contents = ? "
		        		 	+ "                                ,writeDate = sysdate "
		                    + " where review_seq = ? ";
		                  
		         pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setString(1, paraMap.get("contents"));
		         pstmt.setString(2, paraMap.get("review_seq"));
		         
		         n = pstmt.executeUpdate();
		         
		      } finally {
		         close();
		      }
		      
		      return n;
		}//end of public int reviewUpdate(Map<String, String> paraMap) throws SQLException


		@Override
		public List<Map<String, String>> selectStoreMap() throws SQLException {
			List<Map<String, String>> storeMapList = new ArrayList<>();
		      
		      try {
		         conn = ds.getConnection();
		         
		         String sql = " select storeID, storeName, storeUrl, storeImg, storeAddress, lat, lng, zindex " + 
		                    " from tbl_map " + 
		                    " order by zindex asc ";
		         
		         pstmt = conn.prepareStatement(sql);
		         
		         rs = pstmt.executeQuery();
		         
		         while(rs.next()) {
		            Map<String, String> map = new HashMap<>();
		            map.put("STOREID", rs.getString("STOREID"));
		            map.put("STORENAME", rs.getString("STORENAME"));
		            map.put("STOREURL", rs.getString("STOREURL"));
		            map.put("STOREIMG", rs.getString("STOREIMG"));
		            map.put("STOREADDRESS", rs.getString("STOREADDRESS"));
		            map.put("LAT", rs.getString("LAT"));
		            map.put("LNG", rs.getString("LNG"));
		            map.put("ZINDEX", rs.getString("ZINDEX"));
		                        
		            storeMapList.add(map); 
		         }
		         
		      } finally {
		         close();
		      }
		      
		      return storeMapList;
		}


}
