package com.kh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Reply;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BoardReplyInsertController
 */
@WebServlet("/insertReply.bo")
public class BoardReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardReplyInsertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String content = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("boardno"));
		HttpSession session = request.getSession();
		int userId = ((Member) session.getAttribute("loginUser")).getUserNo();
		
		Reply r = new Reply();
		r.setReplyContent(content);
		r.setRefBno(boardNo);
		r.setReplyWriter(String.valueOf(userId));

		int result = new BoardService().insertReply(r);

		response.getWriter().print(result);
	}

}
