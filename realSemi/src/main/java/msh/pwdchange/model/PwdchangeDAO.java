package msh.pwdchange.model;

import java.sql.SQLException;
import java.util.Map;

public interface PwdchangeDAO {

	//비밀번호 휴면해제 및 변경
	int updatehumyun(Map<String, String> paraMap) throws SQLException ;

}
