package msh.NonMemberOrder.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import msh.NonMemberOrder.domain.NonMemberCartVO;
import msh.NonMemberOrder.domain.NonMemberInfoVO;
import msh.NonMemberOrder.domain.NonMemberOrderVO;

public interface NonMemberOrderDAO {

	//새로운 비회원 목록 추가하기
	int add_NonMember(NonMemberOrderVO nvo) throws Exception;
	
	//비회원 장바구니에 추가하기
	int nonmember_addCart(Map<String, String> paraMap) throws SQLException;

	//비회원 유저의 장바구니 목록 가져오기 
	List<NonMemberCartVO> nonmember_selectProductCart(String ordernum) throws SQLException;

	//장바구니 다 합친 금액 구하기
	Map<String, String> nonmember_selectCartSumPrice(String ordernum) throws SQLException;

	//장바구니 하나 삭제하기
	int nonmember_delCart(String cartno) throws SQLException;

	//장바구니 갯수 업데이트하기 
	int nonmember_updateCart(Map<String, String> paraMap)throws SQLException;

	//비회원 정보 가져오기
	List<NonMemberInfoVO> selectNonmemberInfo(String ordernum) throws SQLException;

	//비회원 주문내역 넣기
	int nonmember_addOrder(Map<String, String> paraMap) throws SQLException;

	//(관리자전용)결제 완료된 비회원 주문 수 전부 가져오기. 
	int Nonmember_TotalCountOrder() throws SQLException;

	//(관리자전용)결제 완료된 비회원 주문 목록 전부 가져오기
	List<Map<String, String>> getNonmber_orderList(Map<String, String> paraMap) throws SQLException;

	//(관리자전용)비회원 결제 목록 배송중으로 바꾸기
	int NonMember_updateDeliverStart(String fk_ordernum) throws SQLException;

	//(관리자전용)비회원 정보 목록 가져오기
	NonMemberInfoVO nonmember_odrcodeMemberInfo(String key)  throws SQLException;

	//(관리자전용)비회원 결제 목록 배송완료로 바꾸기
	int NonMember_updateDeliverEnd(String fk_ordernum) throws SQLException;

	//(유저의 조회전용) 비회원 주문 목록 가져오기
	List<NonMemberOrderVO> nonmemberOrder_search(Map<String, String> paraMap) throws SQLException;
	
}
