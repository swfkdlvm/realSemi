package pys.myshop.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import pys.myshop.domain.CartVO;
import pys.myshop.domain.CategoryVO;
import pys.myshop.domain.ImageVO;
import pys.myshop.domain.ProductVO;
import pys.myshop.domain.PurchaseReviewsVO;

public interface ProductDAO {


	
	// 카테고리 리스트
	List<CategoryVO> getCategoryList() throws SQLException;
	
	//딜리버리 화면 처음 띄울때 스페셜 상품 보여주기
	List<ProductVO> selectproductdefault() throws SQLException;
	
	//카테고리를 눌럿을때 메뉴리스트 보여주기
	List<ProductVO> menuList(String cnum) throws SQLException;
	
	// 장바구니에 넣어주는 메소드 
	int addCart(Map<String, String> paraMap) throws SQLException;
	
	// 장바구니에 넣어줘서 조회하기
	List<CartVO> selectProductCart(String userid) throws SQLException;
	
	// 주문총액 합계
	Map<String, String> selectCartSumPricePoint(String userid) throws SQLException;
	
	// 주문수량 변경
	int updateCart(Map<String, String> paraMap)throws SQLException;
	
	// 장바구니에서 삭제하기
	int delCart(String cartno)throws SQLException;
	
	// 특정 유저의 장바구니 상세테이블 개수 알아오기
	Map<String, String> countCart(String userid)throws SQLException;
	
	// 로그인한 사용자가 특정 제품을 구매했는지 여부를 알아오는 것 구매했다라면 true, 구매하지 않았다면 false 를 리턴함.
	boolean isOrder(Map<String, String> paraMap)throws SQLException;
	
	// 상품 후기 등록 메소드
	int addReview(PurchaseReviewsVO reviewsvo)throws SQLException;
	
	// 좋아요 투표하기
	int likeAdd(Map<String, String> paraMap)throws SQLException;
	
	// 싫어요 투표하기
	int dislikeAdd(Map<String, String> paraMap)throws SQLException;
	
	// 좋아요 싫어요 카운트 하기
	Map<String, Integer> getLikeDislikeCnt(String pnum)throws SQLException;
	
	// 리뷰 리스트 보여주기
	List<PurchaseReviewsVO> reviewList(String fk_pnum)throws SQLException;
	
	// 리뷰 지우기
	int reviewDel(String review_seq)throws SQLException;
	
	// 리뷰 수정하기
	int reviewUpdate(Map<String, String> paraMap)throws SQLException;

	List<Map<String, String>> selectStoreMap()throws SQLException;


	
	
	
	
	
	
}
