package msh.CustomerService.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.controller.Myutil;
import msh.CustomerService.domain.NoticeVO;
import msh.CustomerService.model.NoticeDAO;
import msh.CustomerService.model.NoticeDAO_imple;
import pys.member.domain.MemberVO;

public class NoticeTempEditAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if( loginuser != null && "admin".equalsIgnoreCase(loginuser.getUserid())) {
			String searchType = request.getParameter("searchType");
			String searchWord = request.getParameter("searchWord");
			String str_currentShowPageNo = request.getParameter("currentShowPageNo");
			
			if(loginuser != null) {
				String userid = loginuser.getUserid();
				request.setAttribute("userid", userid);
			}
			if (searchType == null) {
				searchType = "";
			}
	
			if (searchWord == null) {
				searchWord = "";
			}
	
			if (searchWord != null) {
				searchWord = searchWord.trim();
			}
			
			String seq = request.getParameter("seq");
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("seq", seq);
			paraMap.put("searchType", searchType);
			paraMap.put("searchWord", searchWord);
			
			NoticeDAO ndao = new NoticeDAO_imple();
			
			// 임시 글 내용 조회 
			NoticeVO temp_noticevo = ndao.getNoticeTemp_DetailView(paraMap);
			
			int totalCount = 0; // 총 게시물 건수
			int sizePerPage = 10;
			int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
			int totalPage = 0; // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
	
			totalCount = ndao.totalTempCount();
			totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
	
			if (str_currentShowPageNo == null) {
				currentShowPageNo = 1;
			}
	
			else {
				try {
					currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
					if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
						currentShowPageNo = 1;
					}
				} catch (NumberFormatException e) {
					currentShowPageNo = 1;
				}
			} // end of else{------------------------
	
			int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호
			int endRno = startRno + sizePerPage - 1; // 끝 행번호
	
			paraMap.put("startRno", String.valueOf(startRno));
			paraMap.put("endRno", String.valueOf(endRno));
	
			 // 글 목록
			List<NoticeVO> temp_postList = ndao.getTemp_NoticeList(paraMap);
			request.setAttribute("temp_postList", temp_postList);
			
			// 페이지 정보
			request.setAttribute("currentShowPageNo", currentShowPageNo);
			request.setAttribute("sizePerPage", sizePerPage);
			request.setAttribute("totalCount", totalCount);
	
			 // ===== 페이지바 만들기 ===== //
			int blockSize = 10;
			int loop = 1;
			int pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;
	
			String pageBar = "<ul style='list-style:none;'>";
			String url = "NoticeWrite.bk";
	
			// === [맨처음][이전] 만들기 === //
			if (pageNo != 1) {
				pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a style='color:black;' href='" + url + "?searchType="
						+ searchType + "&searchWord=" + searchWord + "&currentShowPageNo=1'>[맨처음]</a></li>";
				pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a style='color:black;' href='" + url + "?searchType="
						+ searchType + "&searchWord=" + searchWord + "&currentShowPageNo=" + (pageNo - 1)
						+ "'>[이전]</a></li>";
			}
	
			while (!(loop > blockSize || pageNo > totalPage)) {
	
				if (pageNo == currentShowPageNo) {
					pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:black; padding:2px 4px;'>"
							+ pageNo + "</li>";
				}
	
				else {
					pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a style='color:black;' href='" + url
							+ "?searchType=" + searchType + "&searchWord=" + searchWord + "&currentShowPageNo=" + pageNo
							+ "'>" + pageNo + "</a></li>";
				}
	
				loop++;
				pageNo++;
	
			} // end of while-------------------------
	
			// ===== [다음][마지막] 만들기 ===== //
			if (pageNo <= totalPage) {
				pageBar += "<li class='icon_text' style='display:inline-block; width:50px; font-size:8pt;'><a class='material-icons-outlined icon_img' style='font-size: 12pt; color:black;' href='" + url + "?searchType="
						+ searchType + "&searchWord=" + searchWord + "&currentShowPageNo=" + pageNo + "'>[다음]</a></li>";
				pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a style='color:black;' href='" + url + "?searchType="
						+ searchType + "&searchWord=" + searchWord + "&currentShowPageNo=" + totalPage + "'>[마지막]</a></li>";
			}
	
			pageBar += "</ul>";
	
			request.setAttribute("pageBar", pageBar);
		    // 현재 URL 저장
		    String noticeBackUrl = Myutil.getCurrentURL(request);
	
		    session.setAttribute("noticeBackUrl", request.getContextPath() + noticeBackUrl);
		
			request.setAttribute("temp_noticevo", temp_noticevo);
			super.setViewPage("/WEB-INF/msh.CustomerService/NoticeEditTemp.jsp");
		}//end of if( loginuser != null && "admin".equalsIgnoreCase(loginuser.getUserid())) {---
		
		else {
	         // 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우 
	         String message = "관리자만 접근이 가능합니다.";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	      //   super.setRedirect(false);
	         super.setViewPage("/WEB-INF/msg.jsp");
	    }
	}

}
