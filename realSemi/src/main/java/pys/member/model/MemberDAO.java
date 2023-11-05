package pys.member.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import pys.member.domain.MemberVO;

public interface MemberDAO {

	// 회원가입을 해주는 메소드 (tbl_member 테이블에 insert)
	int registerMember(MemberVO member) throws SQLException;

	// ID 중복검사 (tbl_member 테이블에서 userid 가 존재하면 true 를 리턴해주고, userid 가 존재하지 않으면 false 를 리턴한다) 
	boolean idDuplicateCheck(String userid) throws SQLException;

	// email 중복검사 (tbl_member 테이블에서 email 이 존재하면 true 를 리턴해주고, email 이 존재하지 않으면 false 를 리턴한다)   
	boolean emailDuplicateCheck(String email) throws SQLException;

	// 입력받은 paraMap 을 가지고 한명의 회원정보를 리턴시켜주는 메소드(로그인 처리) 
	MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException;
	
	//// 회원정보 수정시 email 중복검사 (tbl_member 테이블에서 다른 사용자가 email 이 존재하면 true 를 리턴해주고, email 이 존재하지 않으면 false 를 리턴한다)
	boolean emailDuplicateCheck2(Map<String, String> paraMap) throws SQLException;
	
	// 회원 정보 변경하기
	int updateMember(MemberVO member) throws SQLException;
	
	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 회원에 대한 총 페이지 수 알아오기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;
	
	// **** 페이징처리를 한 모든 회원 또는 검색한 회원 목록 보여주기 **** //
	List<MemberVO> select_Member_paging(Map<String, String> paraMap) throws SQLException;
	
	// 회원리스트에서 회원 한명 정보보기
	MemberVO showonemember(String userid) throws SQLException;

	
	
	
	
	
	
	
}
