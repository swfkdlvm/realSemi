package msh.CustomerService.model;

import java.util.List;
import java.util.Map;

import msh.CustomerService.domain.NoticeVO;

public interface NoticeDAO {
	
	//글 전체 갯수 구하기 
	int totalPspecCount() throws Exception;
	
	//공지사항 글 목록 가져오기
	List<NoticeVO> getNoticeList(Map<String, String> paraMap) throws Exception;

	//공지사항 글쓰기
	int add_notice(NoticeVO nvo) throws Exception;

	//공지사항 각각의 글 상세보기
	NoticeVO getNoticeDetailView(Map<String, String> paraMap) throws Exception;

	//공지사항 글 하나 삭제하기
	int del_notice(int seq) throws Exception;

	//공지사항 조회수 1 올리기
	int getNoticeDetailViewCnt(String seq) throws Exception;

	//공지사항 글 수정 하기
	int edit_notice(NoticeVO nvo) throws Exception;

	//검색하기
	List<NoticeVO> getNotisearch(Map<String, String> paraMap) throws Exception;
	
	//검색한 글의 총 갯수
	int SearchtotalCount(Map<String, String> paraMap) throws Exception;

	//임시 저장하기
	int add_temp_notice(NoticeVO nvo) throws Exception;

	//임시저장 글목록 가져오기
	List<NoticeVO> getTemp_NoticeList(Map<String, String> paraMap) throws Exception;

	//임시 글 내용 조회
	NoticeVO getNoticeTemp_DetailView(Map<String, String> paraMap) throws Exception;

	//임시 글 갯수 조회하기
	int totalTempCount() throws Exception;

	//임시 글 삭제하기
	int del_temp_notice(int seq) throws Exception;

	
}
