package pys.myshop.model;

import java.sql.SQLException;
import java.util.List;

import pys.myshop.domain.CategoryVO;
import pys.myshop.domain.ImageVO;
import pys.myshop.domain.ProductVO;

public interface ProductDAO {


	
	// 카테고리 리스트
	List<CategoryVO> getCategoryList() throws SQLException;
	
	//딜리버리 화면 처음 띄울때 스페셜 상품 보여주기
	List<ProductVO> selectproductdefault() throws SQLException;
	
	//카테고리를 눌럿을때 메뉴리스트 보여주기
	List<ProductVO> menuList(String cnum) throws SQLException;
	
	
	
	
}
