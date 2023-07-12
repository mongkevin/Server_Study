package com.kh.notice.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListController
 */
@WebServlet("/list.no")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//공지사항 전체 리스트를 조회해와서 request에 담아 위임한다.(포워딩)
			
		//리스트 목록 가지고 와서 출력문으로 출력해보기
		List<Notice> noticeList = new NoticeService().selectList();
		Iterator<Notice> iterator = noticeList.iterator();
		
		StringBuilder sb = new StringBuilder();
		while(iterator.hasNext()) {
			Notice notice = iterator.next();
			sb.append("<tr>\n");
			sb.append("<td>" + notice.getNoticeNo() + "</td>\n");
			sb.append("<td>" + notice.getNoticeTitle() + "</td>\n");
			sb.append("<td>" + notice.getNoticeWriter() + "</td>\n");
			sb.append("<td>" + notice.getCount() + "</td>\n");
			sb.append("<td>" + notice.getCreateDate() + "</td>\n");
			sb.append("<tr>\n");
		}
//		<tr>
//        <td>2</td>
//        <td>안녕하세요 등업부탁드립니다</td>
//        <td>김탈퇴</td>
//        <td>0</td>
//        <td>2001-10-05</td>
//        </tr>
		request.setAttribute("noticeList", noticeList);
		
		request.getRequestDispatcher("views/notice/noticeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
