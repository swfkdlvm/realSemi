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


public class NoticeSearchAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		String pageSize = request.getParameter("pageSize");
		 
		 
		if (searchType == null) {
			searchType = "";
		}

		if (searchWord == null) {
		    searchWord = "";
		}

		if (searchWord != null) {
			searchWord = searchWord.trim();
		}
		
		// 현재 페이지와 한 페이지당 보여줄 글의 개수
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);

		int totalCount = 0; // 총 게시물 건수
		int sizePerPage=10;
		
		// 한 페이지당 보여줄 게시물 건수
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
		
		NoticeDAO ndao = new NoticeDAO_imple();
		totalCount = ndao.SearchtotalCount(paraMap);
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
		List<NoticeVO> postList = ndao.getNotisearch(paraMap);
		request.setAttribute("postList", postList);

		// 페이지 정보
		request.setAttribute("currentShowPageNo", currentShowPageNo);
		request.setAttribute("sizePerPage", sizePerPage);
		request.setAttribute("totalCount", totalCount);

		 // ===== 페이지바 만들기 ===== //
		int blockSize = 10;
		int loop = 1;
		int pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;

		String pageBar = "<ul style='list-style:none; position:relative; left:286px; text-align:center;'>";
		String url = "NoticeSearch.bk";

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
		HttpSession session = request.getSession();
		session.setAttribute("noticeBackUrl", request.getContextPath() + noticeBackUrl);

		super.setViewPage("/WEB-INF/msh.CustomerService/NoticeSearch.jsp");
		
	}

}
