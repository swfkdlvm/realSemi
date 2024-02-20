package msh.register.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import msh.register.domain.ProductRegisterVO;

public interface RegisterDAO {

	//제품의 카테고리 분류 가져오기
	List<ProductRegisterVO> selectRegisterlist() throws Exception;
	
	// tbl_product 테이블에 제품정보 insert 하기 
	int productInsert(ProductRegisterVO pvo) throws SQLException;

	//제품번호 채번 해오기 
	int getPnumOfProduct() throws SQLException;


	
	
	
	
	
}
