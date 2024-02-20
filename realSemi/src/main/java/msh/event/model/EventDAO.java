package msh.event.model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import msh.event.domain.EventVO;

public interface EventDAO {

	//모든 이벤트 목록 총 개수 구하기
	int totalPspecCount() throws Exception;
		
	//모든 이벤트 썸네일 이미지,기간,번호 전부 가져오기
	List<EventVO> selectEventlist(Map<String, String> paraMap) throws Exception;

	//현재 진행하는 이벤트의 썸네일 이미지,기간,번호만 전부 가져오기
	List<EventVO> eventimgPresent() throws Exception;

	//이벤트 번호를 가지고서 이벤트 글 상세보기 
	EventVO selectOneProductByPnum(String eventno) throws SQLException; 

	





}
