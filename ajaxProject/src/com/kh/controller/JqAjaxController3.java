package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.model.vo.Member;

/**
 * Servlet implementation class JqAjaxController3
 */
@WebServlet("/jqAjax3.do")
public class JqAjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		//번호로 회원 조회를 했다고 가정하고 데이터 임의로 넣기
		Member m = new Member(5, "고길동", 50, "남자");
		
//		response.getWriter().print(m);
		
//		JSONObject jobj = new JSONObject();
//		jobj.put("memberNo",m.getMemberNo());
//		jobj.put("memberName", m.getMemberName());
//		jobj.put("gender",m.getGender());
//		jobj.put("age",m.getAge());
//		
//		response.setContentType("json/application; charset=UTF-8");
//		response.getWriter().print(jobj);
		
		//GSON : Google JSON
		//GSON 라이브러리 사용
		response.setContentType("json/apllication; charset=UTF-8");
		Gson gson = new Gson();
		//gson.toJson(응답객체, 스트림)
		//변환시 전달되는 키값은 VO의 필드명으로 지정한다. 
		gson.toJson(m,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
