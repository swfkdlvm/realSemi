package msh.NonMemberOrder.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import msh.NonMemberOrder.domain.NonMemberCartVO;
import msh.NonMemberOrder.domain.NonMemberInfoVO;
import msh.NonMemberOrder.domain.NonMemberOrderVO;
import util.security.*;
import msh.NonMemberOrder.domain.NonMemberOrderVO;
import msh.NonMemberOrder.model.NonMemberOrderDAO;
import msh.NonMemberOrder.model.NonMemberOrderDAO_imple;
import msh.event.domain.EventVO;
import pys.member.domain.MemberVO;
import pys.myshop.domain.CartVO;
import pys.myshop.domain.ProductVO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
public class NonMemberOrderDAO_imple implements NonMemberOrderDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public NonMemberOrderDAO_imple() {
		
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

	//새로운 비회원 목록 추가하기
	@Override
	public int add_NonMember(NonMemberOrderVO nvo) throws Exception {
	    int result = 0;

	    try {
	    	conn = ds.getConnection();

	        String sql = " INSERT INTO tbl_NONMEMBER_info(seq, NAME, phoneNumber, POSTCODE, ADDRESS, DETAILADDRESS, EXTRAADDRESS, ODRDATE, status, pwd, ordernum) "
	                   + " VALUES(tbl_NONMEMBER_info_Seq.nextval, ?, ?, ?, ?, ?, ?, SYSDATE, DEFAULT, ?, ?) ";

	        pstmt = conn.prepareStatement(sql);

	        pstmt.setString(1, nvo.getName());
	        pstmt.setString(2, nvo.getPhoneNumber());
	        pstmt.setString(3, nvo.getPostcode());
	        pstmt.setString(4, nvo.getAddress());
	        pstmt.setString(5, nvo.getDetailaddress());
	        pstmt.setString(6, nvo.getExtraaddress());
	        pstmt.setString(7, Sha256.encrypt(nvo.getPwd()));
	        pstmt.setString(8, nvo.getOrdernum());
	        result = pstmt.executeUpdate();

	    } finally {
	        close();
	    }

	    return result;
	}

	// 비회원 장바구니에 추가하기
	@Override
	public int nonmember_addCart(Map<String, String> paraMap) throws SQLException {
		int n = 0;
		
		try {
			
			conn = ds.getConnection();
			
		
			String sql = " select cartno "
					   + " from tbl_nonmember_cart "
					   + " where fk_ordernum= ? and fk_pnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("ordernum") );
			pstmt.setString(2, paraMap.get("pnum") );
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 어떤 제품을 추가로 장바구니에 넣고자 하는 경우
				sql = " update tbl_nonmember_cart set oqty = oqty + 1 "
					+ " where cartno = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt("CARTNO"));
				
				n = pstmt.executeUpdate();
					
			}
			else {
				// 장바구니에 존재하지 않는 새로운 제품을 넣고자 하는 경우
				sql = " insert into tbl_nonmember_cart(cartno, fk_ordernum, fk_pnum, oqty, registerday) "
					+ " values(tbl_nonmember_cart_Seq.nextval, ?, ?, 1, default) ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("ordernum"));
				pstmt.setInt(2, Integer.parseInt(paraMap.get("pnum")));
				
				n = pstmt.executeUpdate();	
			}
			
		} finally {
			close();
		}
		return n;
	}

	//비회원 유저의 장바구니 목록 가져오기 
	@Override
	public List<NonMemberCartVO> nonmember_selectProductCart(String ordernum) throws SQLException{
		List<NonMemberCartVO> cartList = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select C.cartno, C.fk_ordernum, C.fk_pnum, C.oqty, P.pname, P.pimage, P.price,P.pdetail,P.pqty "
							+ " from ( select cartno, fk_ordernum, fk_pnum, oqty, registerday "
							+ "        from tbl_nonmember_cart "
							+ "        where fk_ordernum = ? ) C "
							+ " JOIN tbl_product P "
							+ " ON C.fk_pnum = P.pnum "
							+ " ORDER BY C.cartno DESC ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt == 1) {
					cartList = new ArrayList<>();
				}
				String cartno = rs.getString("CARTNO");  
				String fk_ordernum = rs.getString("FK_ORDERNUM"); 
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
				prodvo.setTotalPriceTotalPoint(oqty);

				NonMemberCartVO cvo = new NonMemberCartVO();
				cvo.setCartno(cartno);
				cvo.setFk_pnum(fk_pnum);
				cvo.setFk_ordernum(fk_ordernum);
				cvo.setOqty(oqty);
				cvo.setProd(prodvo);
				
				cartList.add(cvo);
			}//end of while

		} finally {
			close();
		}
		
		return cartList;
	}

	//장바구니 다 합친 금액 구하기
	@Override
	public Map<String, String>  nonmember_selectCartSumPrice(String ordernum) throws SQLException{
		Map<String, String> sumMap = new HashMap<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select  nvl(sum(C.oqty * P.price),0) AS SUMTOTALPRICE "
					   + " from ( select fk_pnum, oqty "
					   + "        from tbl_nonmember_cart "
					   + "        where fk_ordernum = ? ) C "
					   + " JOIN tbl_product P "
					   + " ON C.fk_pnum = P.pnum ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			sumMap.put("SUMTOTALPRICE", rs.getString("SUMTOTALPRICE"));
			
		} finally {
			close();
		}
		
		return sumMap;
	}

	//장바구니 하나 삭제하기
	@Override
	public int  nonmember_delCart(String cartno) throws SQLException{
		int n = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " delete from tbl_nonmember_cart "
	                    + " where cartno = ? ";
	                  
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, cartno);
	         
	         n = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
	      return n;
	}

	//장바구니 갯수 업데이트하기 
	@Override
	public int nonmember_updateCart(Map<String, String> paraMap) throws SQLException {
		int n = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " update tbl_nonmember_cart set oqty = ? "
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

	//비회원 정보 가져오기
	@Override
	public List<NonMemberInfoVO> selectNonmemberInfo(String ordernum) throws SQLException{
		
		List<NonMemberInfoVO> infoList = new ArrayList<>();
	    
	    try {
	       conn = ds.getConnection();
	       
	       String sql = " select seq, name, phonenumber, postcode, address, detailaddress, extraaddress, odrdate, ordernum "
	       		      + " from tbl_nonmember_info "
	    		      + " where ordernum = ? ";
	       
	       pstmt = conn.prepareStatement(sql);
	       
	       pstmt.setString(1, ordernum);

	       
	       rs = pstmt.executeQuery();
	       
	       while(rs.next()) {
		       String seq = rs.getString("seq");
		   	   String name = rs.getString("name");
		   	   String phonenumber = rs.getString("phonenumber");
		   	   String postcode = rs.getString("postcode");
		   	   String address = rs.getString("address");
		   	   String detailaddress = rs.getString("detailaddress");
		   	   String extraaddress = rs.getString("extraaddress");
		   	   String odrdate = rs.getString("odrdate");
		   	   String ordernum1 = rs.getString("ordernum");
		   	   
		   	   NonMemberInfoVO cvo = new NonMemberInfoVO();
	          
		       cvo.setSeq(seq);
		  	   cvo.setName(name);
		  	   cvo.setPhonenumber(phonenumber);
		  	   cvo.setPostcode(postcode);
		  	   cvo.setAddress(address);
		  	   cvo.setDetailaddress(detailaddress);
		  	   cvo.setExtraaddress(extraaddress);
		  	   cvo.setOdrdate(odrdate);
		  	   cvo.setOrdernum(ordernum1);
		  	   infoList.add(cvo);
	            
	         }// end of while----------
	         
	      } finally {
	         close();
	      }
	      
	      return infoList;

	}

	//비회원 주문내역 넣기
	@Override
	public int nonmember_addOrder(Map<String, String> paraMap) throws SQLException {
	    int n = 0;

	    try {
	        conn = ds.getConnection();

	        // 장바구니에 존재하지 않는 새로운 제품을 넣고자 하는 경우
	        String sql = " INSERT INTO tbl_nonmember_order(seq, fk_pnum, oqty, price, pname, name, phonenumber, deliveryaddress,fk_ordernum,status,paymentdate) "
	                   + " VALUES(tbl_nonmember_order_Seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, default,?) ";
	        
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setInt(1, Integer.parseInt(paraMap.get("fk_pnum")));
	        pstmt.setInt(2, Integer.parseInt(paraMap.get("oqty")));
	        pstmt.setInt(3, Integer.parseInt(paraMap.get("price")));
	        pstmt.setString(4, paraMap.get("pname"));
	        pstmt.setString(5, paraMap.get("name"));
	        pstmt.setString(6, paraMap.get("phonenumber"));
	        pstmt.setString(7, paraMap.get("deliveryaddress"));
	        pstmt.setString(8, paraMap.get("fk_ordernum"));
	        pstmt.setString(9, paraMap.get("paymentdate"));
	       
	        n = pstmt.executeUpdate();
	    } finally {
	        close();
	    }

	    return n;
	}

	//(관리자전용)결제 완료된 비회원 주문 수 전부 가져오기. 
	@Override
	public int Nonmember_TotalCountOrder() throws SQLException{
		int totalCountOrder = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*) AS CNT "
					   + " from tbl_nonmember_order ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			rs.next();
			
			totalCountOrder = rs.getInt("CNT");
			
		} finally {
			close();
		}
		
		return totalCountOrder;
	}

	//(관리자전용)결제 완료된 비회원 주문 목록 전부 가져오기
	@Override
	public List<Map<String, String>> getNonmber_orderList(Map<String, String> paraMap) throws SQLException{
		List<Map<String, String>> Nonmber_order_map_List = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " SELECT rno , fk_ordernum , fk_pnum, oqty, price, name "
					   + "      , status , pname, pimage, deliveryaddress, phonenumber,paymentdate "
					   + " FROM "
					   + " ( "
					   + " SELECT ROW_NUMBER() OVER(ORDER BY B.seq DESC) AS RNO "
					   + "      , B.fk_ordernum, B.name  "
					   + " 		, B.deliveryaddress, B.phonenumber "
					   + "      , B.fk_pnum, B.oqty, B.price, B.paymentdate "
					   + "      , CASE B.status "
					   + "             WHEN 0 THEN '주문완료' "
					   + "             WHEN 1 THEN '배송중' "
					   + "             WHEN 2 THEN '배송완료' "
					   + "        END AS status "
					   + "      , C.pimage, C.pname "
					   + " from tbl_nonmember_order B JOIN tbl_product C "
					   + " ON B.fk_pnum = C.pnum "
			 		   + " )V "
				       + " WHERE V.RNO BETWEEN ? AND ? ";
			
			pstmt = conn.prepareStatement(sql);
		/*
			=== 페이징처리의 공식 ===
			where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
		*/
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = 10; // 한 페이지당 화면상에 보여줄 주문내역의 개수는 10 으로 한다.
			
			// 관리자로 로그인한 경우
			pstmt.setInt(1, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
			pstmt.setInt(2, (currentShowPageNo * sizePerPage));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String rno = rs.getString("rno");
				String fk_ordernum  = rs.getString("fk_ordernum");
				String fk_pnum = rs.getString("fk_pnum");
				String oqty = rs.getString("oqty");
				String price = rs.getString("price");
				String name = rs.getString("name");	
				String status = rs.getString("status");
				String pname = rs.getString("pname");
				String pimage = rs.getString("pimage");
				String deliveryaddress = rs.getString("deliveryaddress");
				String phonenumber = rs.getString("phonenumber");
				String paymentdate = rs.getString("paymentdate");
			    String formattedDate = formatOrderDate(paymentdate);


				Map<String, String> odrmap = new HashMap<>();
				odrmap.put("rno", rno);
				odrmap.put("fk_ordernum", fk_ordernum);
				odrmap.put("fk_pnum", fk_pnum);
				odrmap.put("oqty", oqty);
				odrmap.put("price", price);
				odrmap.put("name", name);
				odrmap.put("status", status);
				odrmap.put("pname", pname);
				odrmap.put("pimage", pimage);
				odrmap.put("PRICE", price);
				odrmap.put("deliveryaddress", deliveryaddress);
				odrmap.put("phonenumber", phonenumber);
				odrmap.put("formattedDate", formattedDate);
				
				Nonmber_order_map_List.add(odrmap);

			}// end of while--------------------------------------------------------------------------
			
		} finally {
			close();
		}
		
		return Nonmber_order_map_List;
		
	}
	
	 private static String formatOrderDate(String paymentdate) {
		 try {
			 SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	         Date date = inputFormat.parse(paymentdate);

	         SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년MM월dd일HH시mm분ss초");
	         return outputFormat.format(date);
	      } catch (ParseException e) {
	         e.printStackTrace(); // 날짜 변환 오류 처리
	         return "날짜 변환 오류";
	      }
	 }

	//(관리자전용)비회원 결제 목록 배송중으로 바꾸기
	@Override
	public int NonMember_updateDeliverStart(String fk_ordernum) throws SQLException{
		int n = 0;
		      
		try {
			conn = ds.getConnection();
		         
			String sql = " update tbl_nonmember_order set status = 1 "
					   + " where fk_ordernum in("+fk_ordernum+")"; 
		         
			pstmt = conn.prepareStatement(sql); 
		    n = pstmt.executeUpdate();
		         
		} finally {
			close();
		}     
			return n;
	}

	//(관리자전용)비회원 정보 목록 가져오기
	@Override
	public NonMemberInfoVO nonmember_odrcodeMemberInfo(String key) throws SQLException{
		NonMemberInfoVO mvo = null;
			
		try {
			conn = ds.getConnection();
		                  
			String sql = " select name, phonenumber, postcode, address, detailaddress, extraaddress " +
						 " from tbl_nonmember_info " +
						 " where ordernum = ? ";
		         
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, key);
		         
			rs = pstmt.executeQuery();
		         
			boolean isExists = rs.next();
		         
			if(isExists) {
				mvo = new NonMemberInfoVO();
				mvo.setName(rs.getString(1));
				mvo.setPhonenumber(rs.getString(2)); 
				mvo.setPostcode(rs.getString(3));
				mvo.setAddress(rs.getString(4));
				mvo.setDetailaddress(rs.getString(5));
				mvo.setExtraaddress(rs.getString(6));
			}
		         
		} finally {
			close();
		}      
			return mvo;   
	}

	//(관리자전용)비회원 결제 목록 배송완료로 바꾸기
	@Override
	public int NonMember_updateDeliverEnd(String fk_ordernum) throws SQLException {
		int n = 0;
		      
			try {
				conn = ds.getConnection();
		         
				String sql = " UPDATE tbl_nonmember_order SET status = 2, deliverdate =  TO_TIMESTAMP(CURRENT_TIMESTAMP, 'YYYYMMDDHH24MISS') "
			               + " WHERE fk_ordernum IN (" + fk_ordernum + ") ";
		         
				pstmt = conn.prepareStatement(sql); 
		         
				n = pstmt.executeUpdate();
		         
			} finally {
				close();
			}
		      
			return n;
	}

	//(유저의 조회전용) 비회원 주문 목록 가져오기
	@Override
	public List <NonMemberOrderVO> nonmemberOrder_search(Map<String, String> paraMap) throws SQLException{
		List <NonMemberOrderVO> ndaolist =  new ArrayList<>();
		try {
			conn = ds.getConnection();
	                  
			String sql = " select B.name, B.pname, B.oqty, B.deliverdate, B.deliveryaddress, C.phonenumber, B.status, C.pwd " +
					     " from tbl_nonmember_order B JOIN tbl_nonmember_info C " +
						 " ON B.fk_ordernum = C.ordernum " +
					     " where ordernum = ? and pwd = ? ";
	         
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("ordernum"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")));
	         
			rs = pstmt.executeQuery();

			    while(rs.next()) {
			    	String name = rs.getString("name");
			   	    String pname = rs.getString("pname");
			   	    String oqty = rs.getString("oqty");
			   	    String deliverdate = rs.getString("deliverdate");
			   	    String address = rs.getString("deliveryaddress");
			   	    String phoneNumber = rs.getString("phonenumber");
			   	    String status = rs.getString("status");
			   	    String pwd = rs.getString("pwd");
			   	   
			   	    NonMemberOrderVO ndao = new NonMemberOrderVO();
		          
			        ndao.setName(name);
			        ndao.setPname(pname);
					ndao.setOqty(oqty);
					ndao.setDeliverdate(deliverdate);
					ndao.setAddress(address);
					ndao.setPhoneNumber(phoneNumber); 
					ndao.setStatus(status);
					ndao.setPwd(pwd);

			  	    ndaolist.add(ndao);
			    }//end of while(rs.next()) {
		} finally {
			close();
		}
	      
		return ndaolist;   
	}

			
		
}