package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class JqAjaxController2
 */
@WebServlet("/jqAjax2.do")
public class JqAjaxController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		
		//ajax는 결과를 하나만 반환가능
		//요청 처리를 다했다는 가정으로 응답할 데이터
//		String resultStr = "이름: " + name + ",나이: " + age + "살";
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().print(resultStr);
		
		//만약 데이터를 따로 전달하고자 한다면? 응답데이터를 여러개 보내보기
		//이렇게 보내면 두개 데이터가 붙어서 보내지게 된다
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().print(name);
//		response.getWriter().print(age);
		
		//응답 데이터 여러개 응답하기 - JSON 형식 이용
		/*
		 *  *JSON (JavaScript Object Notation) : 자바스크립트 객체 표기법
		 *  -ajax 통신시 데이터 전송에 사용되는 포맷형식 중 하나
		 *  
		 *  -JSON 처리 시 사용되는 클래스 종류
		 *  -기본적으로 자바에서 지공하지 않는다 (라이브러리 사용)
		 *  1.JSONArray[value, value,...] : 배열 형식
		 *  2.JSONObject{key:value,key:value} : 객체 형식
		 *  
		 * */
		JSONArray jArr = new JSONArray(); //[]
		jArr.add(name);
		jArr.add(age);
		//응답할 데이터의 타입을 지정해야한다
		//text/html로 하면 문자열로 넘어간다(형식 유지 X)
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().print(jArr);
		
		//JSON 형식으로 응답하고자한다면 타입을 json/application 으로 전송해야한다.
		response.setContentType("json/application; charset=UTF-8");
		
		//배열타입으로 보내기
//		response.getWriter().print(jArr);
		
		//객체타입으로 보내기
		JSONObject jObj = new JSONObject();
		jObj.put("name", name);
		jObj.put("age", age);
		
		response.getWriter().print(jObj);
	}

}
