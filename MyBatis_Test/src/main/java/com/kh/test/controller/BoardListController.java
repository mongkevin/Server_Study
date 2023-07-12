package com.kh.test.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/boardList.bo")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage")); 
		int listCount = sqlSession.selectOne("boardMapper.selectListCount");
		int boardLimit = 5; 
		int pageLimit = 3;
		int maxPage = (int)(Math.ceil((double)listCount / boardLimit)); 
		int startPage = ((currentPage-1) / pageLimit) * pageLimit + 1;
		int endPage = startPage + pageLimit-1;

		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage,boardLimit,listCount,pageLimit,maxPage,startPage,endPage);
		
	    int limit = boardLimit;
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		ArrayList<Board> bList = sqlSession.selectList("boardMapper.selectList",null,rowBounds);
				
		request.setAttribute("list", bList);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("views/board/boardListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
