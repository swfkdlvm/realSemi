package kjy.myshop.model;

import java.sql.SQLException;
import java.util.*;

import pys.member.domain.MemberVO;
import pys.myshop.domain.CategoryVO;
import pys.myshop.domain.ProductVO;

public interface ProductDAO {

	// 카테고리 리스트
	List<CategoryVO> getCategoryList() throws SQLException;

	// 딜리버리 화면 처음 띄울때 스페셜 상품 보여주기
	List<ProductVO> selectproductdefault(String cnum) throws SQLException;

	// 메뉴리스트 보여주기
	List<ProductVO> menuList(String cnum) throws SQLException;

	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기
	ProductVO selectOneProduct(String pnum) throws SQLException;

	// 주문코드[명세서번호](시퀀스 seq_tbl_order 값)을 채번해오는 것.
	int get_seq_tbl_order() throws SQLException;

	// ===== Transaction 처리하기 ===== // 
    // 2. 주문 테이블에 채번해온 주문전표, 로그인한 사용자, 현재시각을 insert 하기(수동커밋처리)
    // 3. 주문상세 테이블에 채번해온 주문전표, 제품번호, 주문량, 주문금액을 insert 하기(수동커밋처리)
    // 4. 제품 테이블에서 제품번호에 해당하는 잔고량을 주문량 만큼 감하기(수동커밋처리) 
        
    // 5. 장바구니 테이블에서 str_cartno_join 값에 해당하는 행들을 삭제(delete)하기(수동커밋처리)
    // >> 장바구니에서 주문을 한 것이 아니라 특정제품을 바로주문하기를 한 경우에는 장바구니 테이블에서 행들을 삭제할 작업은 없다. << 
        
    // 6. 회원 테이블에서 로그인한 사용자의 coin 액을 sum_totalPrice 만큼 감하고, point 를 sum_totalPoint 만큼 더하기(update)(수동커밋처리) 
    // 7. **** 모든처리가 성공되었을시 commit 하기(commit) **** 
    // 8. **** SQL 장애 발생시 rollback 하기(rollback) **** 
	int orderAdd(Map<String, Object> paraMap) throws SQLException;

	// 주문한 제품에 대해 email 보내기시 email 내용에 넣을 주문한 제품번호들에 대한 제품정보를 얻어오는 것.
	List<ProductVO> getJumunProductList(String pnumes) throws SQLException;

	
	// *** 페이징 처리를 위해서 먼저 주문개수를 알아오기 *** //
	// 1. 일반 사용자로 로그인한 경우는 자신이 주문한 갯수를 알아오고,
	// 2. 관리자(admin)로 로그인한 경우 모든 사용자들의 주문한 갯수를 조회해온다.
	int getTotalCountOrder(String userid) throws SQLException;
	
	
	// *** 관리자가 아닌 일반사용자로 로그인 했을 경우에는 자신이 주문한 내역만 페이징 처리하여 조회를 해오고,
	//     관리자로 로그인을 했을 경우에는 모든 사용자들의 주문내역을 페이징 처리하여 조회해온다.
	List<Map<String, String>> getOrderList(Map<String, String> paraMap) throws SQLException;

	// 영수증전표(odrcode)소유주에 대한 사용자 정보를 조회해오는 것.
	MemberVO odrcodeOwnerMemberInfo(String odrcode) throws SQLException;

	// tbl_orderdetail 테이블의 deliverstatus(배송상태) 컬럼의 값을 2(배송시작)로 변경하기
	int updateDeliverStart(String odrcodePnum) throws SQLException;

	// tbl_orderdetail 테이블의 deliverstatus(배송상태) 컬럼의 값을 3(배송완료)로 변경하기
	int updateDeliverEnd(String odrcodePnum) throws SQLException;
	
	

	
	
	
	
}
