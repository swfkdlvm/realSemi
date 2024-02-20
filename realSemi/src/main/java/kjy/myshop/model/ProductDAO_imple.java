package kjy.myshop.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pys.member.domain.MemberVO;
import pys.myshop.domain.*;
import util.security.AES256;
import util.security.SecretMyKey;

public class ProductDAO_imple implements ProductDAO {
	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	// 생성자
	public ProductDAO_imple() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
	    
		    aes = new AES256(SecretMyKey.KEY);
		    // SecretMyKey.KEY 은 우리가 만든 암호화/복호화 키이다.
		    
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
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
	public List<ProductVO> selectproductdefault(String cnum) throws SQLException {
		
		List<ProductVO> productList = new ArrayList<>();
		
		try {
	          conn = ds.getConnection();
	          
	          String sql = " select pnum, pname, price, pdetail, pimage "  
	                     + " from tbl_product "
	                     + " where fk_cnum = " + cnum;
	                    
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
			
			String sql = " SELECT pnum,cname, pname, pimage, pcontent, pdetail "
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
				pvo.setPnum(rs.getInt("PNUM"));
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

	
	// 주문코드[명세서번호](시퀀스 seq_tbl_order 값)을 채번해오는 것.
	@Override
	public int get_seq_tbl_order() throws SQLException {

		int seq = 0;
	      
	    try {
	    	conn = ds.getConnection();
	          
	        String sql = " select seq_tbl_order.nextval AS seq "
	        		   + " from dual";
	          
	        pstmt = conn.prepareStatement(sql);
	          
	        rs = pstmt.executeQuery();
	          
	        rs.next();
	          
	        seq = rs.getInt("seq");
	          
	   } finally {
	        close();
	   }
	      
	     return seq;
	     
	}// end of public int get_seq_tbl_order() throws SQLException----------

	
	
	// ===== Transaction 처리하기 ===== // 
    // 2. 주문 테이블에 채번해온 주문전표, 로그인한 사용자, 현재시각을 insert 하기(수동커밋처리)
    // 3. 주문상세 테이블에 채번해온 주문전표, 제품번호, 주문량, 주문금액을 insert 하기(수동커밋처리)
    // 4. 제품 테이블에서 제품번호에 해당하는 잔고량을 주문량 만큼 감하기(수동커밋처리) 
        
    // 5. 장바구니 테이블에서 str_cartno_join 값에 해당하는 행들을 삭제(delete)하기(수동커밋처리)
    // >> 장바구니에서 주문을 한 것이 아니라 특정제품을 바로주문하기를 한 경우에는 장바구니 테이블에서 행들을 삭제할 작업은 없다. << 
        
    // 6. **** 모든처리가 성공되었을시 commit 하기(commit) **** 
    // 7. **** SQL 장애 발생시 rollback 하기(rollback) **** 
	@Override
	public int orderAdd(Map<String, Object> paraMap) throws SQLException {
		
		int isSuccess = 0;
		int n1=0, n2=0, n3=0, n4=0;
		
		try {
			conn = ds.getConnection();
			
			conn.setAutoCommit(false); // 수동커밋으로 전환
			
			// 2. 주문 테이블에 채번해온 주문전표, 로그인한 사용자, 현재시각을 insert 하기(수동커밋처리)
			String sql = " insert into tbl_order(odrcode, fk_userid, odrtotalPrice, deliveryAddress, mobile, orderRequest, odrdate) "
					   + " values(?, ?, ?, ?, ?, ?,default) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)paraMap.get("odrcode")); // 맵에 담겨서 온 밸류 값이 Object 여서 빨간줄이 나옴
			pstmt.setString(2, (String)paraMap.get("userid"));
			pstmt.setInt(3, Integer.parseInt((String)paraMap.get("sum_totalPrice")) );
			pstmt.setString(4, (String)paraMap.get("deliveryAddress"));
			pstmt.setString(5, (String)paraMap.get("mobile"));
			pstmt.setString(6, (String)paraMap.get("orderRequest"));
			
			n1 = pstmt.executeUpdate();
		//	System.out.println("~~~~~~ 확인용 n1 : " + n1);
		//	~~~~~~ 확인용 n1 : 1
			
			
			// 3. 주문상세 테이블에 채번해온 주문전표, 제품번호, 주문량, 주문금액을 insert 하기(수동커밋처리)
			if(n1 == 1) {
				// 주문코드(명세서번호) --> (String)paraMap.get("odrcode")
				String[] pnum_arr = (String[]) paraMap.get("pnum_arr"); // 제품번호
				String[] oqty_arr = (String[]) paraMap.get("oqty_arr"); // 주문량
				String[] totalPrice_arr = (String[]) paraMap.get("totalPrice_arr");// 주문가격
				
				int cnt = 0;
				for(int i=0; i<pnum_arr.length; i++) {
					sql = " insert into tbl_orderdetail(odrseqnum, fk_odrcode, fk_pnum, oqty, odrprice, deliverStatus)"
						+ " values(seq_tbl_orderdetail.nextval, ?, to_number(?), to_number(?), to_number(?), default) ";

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, (String)paraMap.get("odrcode"));
					pstmt.setString(2, pnum_arr[i]);
					pstmt.setString(3, oqty_arr[i]);
					pstmt.setString(4, totalPrice_arr[i]);
					
					pstmt.executeUpdate();
					cnt++;
				}// end of for----------------------------
				
				if(cnt == pnum_arr.length) {
					n2=1;
				}
			//		System.out.println("~~~~~~ 확인용 n2 : " + n2);
				//	~~~~~~ 확인용 n2 : 1
				
			}// end of if(n1 == 1)--------------------------------
			
			
			// 4. 제품 테이블에서 제품번호에 해당하는 잔고량을 주문량 만큼 감하기(수동커밋처리) 
		    if(n2 == 1) {
		    	String[] pnum_arr = (String[]) paraMap.get("pnum_arr"); // 제품번호
				String[] oqty_arr = (String[]) paraMap.get("oqty_arr"); // 주문량
		    	
				int cnt = 0;
				for(int i=0; i<pnum_arr.length; i++) {
					sql= " update tbl_product set pqty = pqty - ? "
					   + " where pnum = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(oqty_arr[i]));
					pstmt.setString(2, pnum_arr[i]);
					
					pstmt.executeUpdate();
					cnt++;
				}// end of for----------------------------
		    	
				if(cnt == pnum_arr.length) {
					n3=1;
				}
				
				//	System.out.println("~~~~~~ 확인용 n3 : " + n3);
				//	~~~~~~ 확인용 n3 : 1
				
		    }// end of if(n2 == 1)--------------------------------
			
			
			// 5. 장바구니 테이블에서 str_cartno_join 값에 해당하는 행들을 삭제(delete)하기(수동커밋처리)
			// >> 장바구니에서 주문을 한 것이 아니라 특정제품을 바로주문하기를 한 경우에는 장바구니 테이블에서 행들을 삭제할 작업은 없다. << 
			if(n3 == 1 && paraMap.get("cartno_arr") != null) {
			/*	
				sql = " delete from tbl_cart"
					+ " where cartno in (?) ";
			*/		
				// !!! 중요 in 절은 위와 같이 위치홀더 ? 를 사용하면 안됨. !!! //
				
				
				String[] cartno_arr = (String[]) paraMap.get("cartno_arr"); // 배열로 받아서 스트링타입으로 바꿔준다.
				// cartno_arr 은 ["11","8","7"]
				
				String cartno_join = String.join("','", cartno_arr); // "11','8','7"
				
				cartno_join = "'"+cartno_join+"'"; // "'11','8','7'"
				
			//	System.out.println("~~~~ 확인용 cartno_join => " + cartno_join);
				// ~~~~ 확인용 cartno_join => '11','8','7'
				
				sql = " delete from tbl_cart"
					+ " where cartno in ("+ cartno_join +") ";
				// !!! 중요 in 절은 위와 같이 직접 변수로 처리해야 함. !!! //
				// String.join(",", cartno_arr) 은 "11,8,7" 이러한 것이다.
				// 조심할 것은 in 에 사용되어지는 cartno 컬럼의 타입이 number 타입이라면 괜찮은데
				// 만약에 cartno 컬럼의 타입이 varchar2 타입이라면 "11,8,7" 과 같이 되어지면 오류가 발생한다. 
				// 그래서 cartno 컬럼의 타입이 varchar2 타입이라면 "11,8,7" 을 "'11','8','7'" 과 같이 변경해주어야 한다. 
				
				pstmt = conn.prepareStatement(sql);
				n4 = pstmt.executeUpdate(); // delete 이기 때문에 반복문을 돌린 횟수(==배열의 길이)만큼의 숫자를 반환함
				
				//	System.out.println("~~~~~~ 확인용 n4 : " + n4);
				//	~~~~~~ 확인용 n4 : 3
				
				if(n4 == cartno_arr.length) {
					n4 = 1;
				}
			}
			
			
			
		    // 6. **** 모든처리가 성공되었을시 commit 하기(commit) **** 
			if(n1*n2*n3*n4 == 1) {
				
				conn.commit();
				
				conn.setAutoCommit(true); // 자동커밋으로 전환
				
		//		System.out.println("~~~~~~ 확인용 n1*n2*n3*n4* : " + n1*n2*n3*n4);
				//	~~~~~~ 확인용 n1*n2*n3*n4*n5 : 1
				
				isSuccess = 1;
			}
			
		} catch(SQLException e) {
			
			// 8. **** SQL 장애 발생시 rollback 하기(rollback) ****
			conn.rollback();
			
			conn.setAutoCommit(true); // 자동커밋으로 전환
			
			isSuccess = 0;
			
		} finally {
			close();
		}
		
		return isSuccess;
		
	}// end of public int orderAdd(Map<String, Object> paraMap) throws SQLException--------- 

	
	// 주문한 제품에 대해 email 보내기시 email 내용에 넣을 주문한 제품번호들에 대한 제품정보를 얻어오는 것.
	@Override
	public List<ProductVO> getJumunProductList(String pnumes) throws SQLException {

		List<ProductVO> jumunProductList = new ArrayList<>();
	      
		try {
			conn = ds.getConnection();
	         
	        String sql = " select pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail "+
	                     " from tbl_product "+
	                     " where pnum in("+ pnumes +") ";
	         
	        pstmt = conn.prepareStatement(sql);
	         
	        rs = pstmt.executeQuery();
	                  
	        while(rs.next()) {
	                        
	        	int pnum = rs.getInt("pnum");
	            String pname = rs.getString("pname");
	            int fk_cnum = rs.getInt("fk_cnum");
	            String pimage = rs.getString("pimage");
	            int pqty = rs.getInt("pqty");
	            int price = rs.getInt("price");
	            String pcontent = rs.getString("pcontent");
	            String pdetail = rs.getString("pdetail");
	            
	            ProductVO productvo = new ProductVO(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail); 
	            
	            jumunProductList.add(productvo);
	            
	        } // end of while----------------------------------
	                  
		} finally {
			close();
		}
	      
		return jumunProductList;
		
	}// end of public List<ProductVO> getJumunProductList(String pnumes) throws SQLException

	
	// *** 페이징 처리를 위해서 먼저 주문개수를 알아오기 *** //
	// 1. 일반 사용자로 로그인한 경우는 자신이 주문한 갯수를 알아오고,
	// 2. 관리자(admin)로 로그인한 경우 모든 사용자들의 주문한 갯수를 조회해온다.
	@Override
	public int getTotalCountOrder(String userid) throws SQLException {
		
		int totalCountOrder = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*) AS CNT "
					   + " from tbl_order A JOIN tbl_orderdetail B "
					   + " ON A.odrcode = B.fk_odrcode ";
			
			if("admin".equals(userid)) { // admin 으로 로그인한 경우
				pstmt = conn.prepareStatement(sql);
			}
			else { // admin이 아닌 일반사용자로 로그인한 경우
				sql += " WHERE A.fk_userid = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
			}
			
			rs = pstmt.executeQuery();
			rs.next();
			
			totalCountOrder = rs.getInt("CNT");
			
		} finally {
			close();
		}
		
		return totalCountOrder;
		
	}// end of public int getTotalCountOrder(String userid) throws SQLException-------
	
	
	// *** 관리자가 아닌 일반사용자로 로그인 했을 경우에는 자신이 주문한 내역만 페이징 처리하여 조회를 해오고,
	//     관리자로 로그인을 했을 경우에는 모든 사용자들의 주문내역을 페이징 처리하여 조회해온다.
	@Override
	public List<Map<String, String>> getOrderList(Map<String, String> paraMap) throws SQLException {
		
		List<Map<String, String>> order_map_List = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " SELECT odrcode, fk_userid, odrdate, odrseqnum, fk_pnum, oqty, odrprice "
					   + "      , deliverstatus, pname, pimage, price, deliveryaddress, mobile, orderrequest "
					   + " FROM "
					   + " ( "
					   + " SELECT ROW_NUMBER() OVER(ORDER BY B.FK_ODRCODE DESC, B.ODRSEQNUM ASC) AS RNO "
					   + "      , A.odrcode, A.fk_userid, to_char(A.odrdate, 'yyyy-mm-dd hh24:mi:ss') AS odrdate "
					   + " 		, A.deliveryaddress, A.mobile, nvl(A.orderrequest,'없음') AS orderrequest "
					   + "      , B.odrseqnum, B.fk_pnum, B.oqty, B.odrprice "
					   + "      , CASE B.deliverstatus "
					   + "             WHEN 1 THEN '주문완료' "
					   + "             WHEN 2 THEN '배송중' "
					   + "             WHEN 3 THEN '배송완료' "
					   + "        END AS deliverstatus "
					   + "      , C.pname, C.pimage, C.price "
					   + " from tbl_order A JOIN tbl_orderdetail B "
					   + " ON A.odrcode = B.fk_odrcode "
					   + " JOIN tbl_product C "
					   + " ON B.fk_pnum = C.pnum ";
			
			if(!"admin".equals(paraMap.get("userid"))) {
				// 관리자가 아닌 일반사용자로 로그인한 경우
				sql += " WHERE A.fk_userid = ? ";
			}
			
			sql += " )V "
				 + " WHERE V.RNO BETWEEN ? AND ? ";
			
			pstmt = conn.prepareStatement(sql);
		/*
			=== 페이징처리의 공식 ===
			where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
		*/
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = 10; // 한 페이지당 화면상에 보여줄 주문내역의 개수는 10 으로 한다.
			
			if(!"admin".equals(paraMap.get("userid"))) {
				// 관리자가 아닌 일반사용자로 로그인한 경우
				pstmt.setString(1, paraMap.get("userid"));
				pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1)); // 공식
				pstmt.setInt(3, (currentShowPageNo * sizePerPage)); // 공식
			}
			else {
				// 관리자로 로그인한 경우
				pstmt.setInt(1, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
				pstmt.setInt(2, (currentShowPageNo * sizePerPage));
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String odrcode = rs.getString("odrcode");
				String fk_userid = rs.getString("fk_userid");
				String odrdate = rs.getString("odrdate");
				String odrseqnum = rs.getString("odrseqnum");
				String fk_pnum = rs.getString("fk_pnum");
				String oqty = rs.getString("oqty");
				String odrprice = rs.getString("odrprice");
				String deliverstatus = rs.getString("deliverstatus");
				String pname = rs.getString("pname");
				String pimage = rs.getString("pimage");
				String price = rs.getString("price");
				String deliveryaddress = rs.getString("deliveryaddress");
				String mobile = rs.getString("mobile");
				String orderrequest = rs.getString("orderrequest");
				
				Map<String, String> odrmap = new HashMap<>();
				odrmap.put("ODRCODE", odrcode);
				odrmap.put("FK_USERID", fk_userid);
				odrmap.put("ODRDATE", odrdate);
				odrmap.put("ODRSEQNUM", odrseqnum);
				odrmap.put("FK_PNUM", fk_pnum);
				odrmap.put("OQTY", oqty);
				odrmap.put("ODRPRICE", odrprice);
				odrmap.put("DELIVERSTATUS", deliverstatus);
				odrmap.put("PNAME", pname);
				odrmap.put("PIMAGE", pimage);
				odrmap.put("PRICE", price);
				odrmap.put("DELIVERYADDRESS", deliveryaddress);
				odrmap.put("MOBILE", mobile);
				odrmap.put("ORDERREQUEST", orderrequest);
				
				order_map_List.add(odrmap);
				
			}// end of while--------------------------------------------------------------------------
			
		} finally {
			close();
		}
		
		return order_map_List;
		
	}// end of public List<Map<String, String>> getOrderList(Map<String, String> paraMap) throws SQLException------

	
	// 영수증전표(odrcode)소유주에 대한 사용자 정보를 조회해오는 것.
	@Override
	public MemberVO odrcodeOwnerMemberInfo(String odrcode) throws SQLException {

		MemberVO mvo = null;
		
		try {
			conn = ds.getConnection();
	                  
			String sql = " select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender " +
					     " , birthday, to_char(registerday, 'yyyy-mm-dd') AS registerday " +
					     " from tbl_member " +
					     " where userid = (select fk_userid " + 
					     "                 from tbl_order " + 
					     "                 where odrcode = ? ) ";
	         
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, odrcode);
	         
			rs = pstmt.executeQuery();
	         
			boolean isExists = rs.next();
	         
			if(isExists) {
				mvo = new MemberVO();
				mvo.setUserid(rs.getString(1));
				mvo.setName(rs.getString(2));
				mvo.setEmail(aes.decrypt(rs.getString(3))); // 복호화 
				mvo.setMobile( aes.decrypt(rs.getString(4)) ); // 복호화 
				mvo.setPostcode(rs.getString(5));
				mvo.setAddress(rs.getString(6));
				mvo.setDetailaddress(rs.getString(7));
				mvo.setExtraaddress(rs.getString(8));
				mvo.setGender(rs.getString(9));
				mvo.setBirthday(rs.getString(10));
				mvo.setRegisterday(rs.getString(11));
			}
	         
		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	      
		return mvo;   
		
	}// end of public MemberVO odrcodeOwnerMemberInfo(String odrcode) throws SQLException------

	
	// tbl_orderdetail 테이블의 deliverstatus(배송상태) 컬럼의 값을 2(배송시작)로 변경하기
	@Override
	public int updateDeliverStart(String odrcodePnum) throws SQLException {

		int n = 0;
	      
		try {
			conn = ds.getConnection();
	         
			String sql = " update tbl_orderdetail set deliverstatus = 2 "
					   + " where fk_odrcode || '/' || fk_pnum in("+odrcodePnum+")"; 
	         
			pstmt = conn.prepareStatement(sql); 
	         
			n = pstmt.executeUpdate();
	         
		} finally {
			close();
		}
	      
		return n;
		
	}// end of public int updateDeliverStart(String odrcodePnum) throws SQLException

	
	// tbl_orderdetail 테이블의 deliverstatus(배송상태) 컬럼의 값을 3(배송완료)로 변경하기
	@Override
	public int updateDeliverEnd(String odrcodePnum) throws SQLException {

		int n = 0;
	      
		try {
			conn = ds.getConnection();
	         
			String sql = " update tbl_orderdetail set deliverstatus = 3, deliverDate = sysdate "
					   + " where fk_odrcode || '/' || fk_pnum in("+odrcodePnum+")"; 
	         
			pstmt = conn.prepareStatement(sql); 
	         
			n = pstmt.executeUpdate();
	         
		} finally {
			close();
		}
	      
		return n;
		
	}// end of public int updateDeliverEnd(String odrcodePnum) throws SQLException--------

	
	
	

	
}
