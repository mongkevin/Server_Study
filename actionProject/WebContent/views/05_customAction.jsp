<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL 이란?</h1>
	<p>
		JSP Standard Tag Library의 약자로 JSP에서 사용되는 커스텀 액션 태그로<br>
		공통적으로 사용되는 코드들의 집합을 보다 쉽게 사용할 수 있도록 태그화 해서 표준으로 제공하는 라이브러리
	</p>
	
	<hr>
	
	<h3>*라이브러리 다운로드 후 추가하기</h3>
	1)https://tomcat.apache.org/download-taglibs.cgi <br>
	2)Standard-1.2.5 - jar파일 4개 다 다운받기<br>
	3)WEB-INF/lib에 추가하기<br>
	
	<h3>* JSTL 선언 방법</h3>
	
	<p>
		JSTL을 선언하는 방법 - 사용하고자 하는 jsp 페이지 상단에 <br>
		taglib지시어를 이용하여 선언한다<br><br>
		
		&lt;%@ taglib prefix="접두어" uri="라이브러리 파일상의 url주소" %&gt;
	</p>
	
	<hr>
	
	<h3>JSTL 분류</h3>
	
	<h4>1.JSTL Core Library</h4>
	<p>
		변수와 조건문, 반복문 등의 로직과 관련된 문법을 제공한다.
	</p>
	
	<a href="06_core.jsp">core Library</a><br>
	
	<br>
	
	<h4>2.JSTL Formatting Library</h4>
	<p>
		숫자, 날짜 및 시간 데이터의 출력 형식을 지정할 때 사용하는 문법을 제공
	</p>
	<a href="07_fomatting.jsp">formatting library</a>
	<br>
	
	<h4>3.JSTL Function Library</h4>
	<p>
		EL구문 안에서 사용할 수 있는 메소드들 제공
	</p>
	<a href="08_functions.jsp">functions Library</a>
</body>
</html>