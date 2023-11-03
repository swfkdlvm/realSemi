package kjy.myshop.model;

import java.sql.SQLException;
import java.util.*;

import kjy.myshop.domain.CategoryVO;
import kjy.myshop.domain.ProductVO;

public interface ProductDAO {

	// 카테고리 리스트
	List<CategoryVO> getCategoryList() throws SQLException;

	// 딜리버리 화면 처음 띄울때 스페셜 상품 보여주기
	List<ProductVO> selectproductdefault() throws SQLException;

	// 메뉴리스트 보여주기
	List<ProductVO> menuList(String cnum) throws SQLException;

	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기
	ProductVO selectOneProduct(String pnum) throws SQLException;
	
	
	
	
}
