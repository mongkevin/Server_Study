package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.model.vo.Person;

/**
 * Servlet implementation class ELServlet
 */
@WebServlet("/el.do")
public class ELServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ELServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * 데이터를 담을 수 있는 영역(JSP 내장객체 종류) - scope
		 * 1.ServletContext(application scope)
		 * 한 애플리케이션 1개 존재하는 객체
		 * 이 영역에 데이터를 담으면 애플리케이션 전역에서 사용가능하다.(공유범위가 가장 크다)
		 * 
		 * 2.HttpSession (session scope)
		 * 한 브라우저당 1개 존재하는 객체
		 * 이 영역에 데이터를 담으면 jsp/servlet에서 사용가능하다
		 * 값이 한번 담기면 서버가 멈추거나 브라우저가 닫힐때까지 사용가능하다
		 * 
		 * 3.HttpServletRequest (request scope)
		 * 요청 및 응답시 매번 생성되는 객체
		 * 이 영역에 데이터를 담으면 해당 request 객체를 포워딩 받는 응답 페이지에서 사용 가능하다
		 * 
		 * 4.PageContext(page scope)
		 * 현재 jsp 페이지에서만 사용가능
		 * -공유 범위가 가장 작음
		 * 
		 * 위 객체들 모두 값을 담을땐 .setAttribute("키",데이터);
		 * 				  꺼낼땐 .getAttribute("키");
		 * 				  값을 지울땐 .removeAttribute("키");
		 * */
		
		//requestScope에 값을 담기
		request.setAttribute("classRoom", "E강의장");
		request.setAttribute("student", new Person("김길동","남자"));
		
		//sessionScope에 값을 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy", "KH정보교육원");
		session.setAttribute("lecture", new Person("홍길동","여자"));
		
		//request영역과 session 영역에 값을 키값으로 데이터 담아보기
		request.setAttribute("scope", "request영역");
		session.setAttribute("scope", "session영역");
		
		//applicationScope에 값 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application영역");
		
		request.getRequestDispatcher("views/01_EL.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
