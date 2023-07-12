<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>include</h3>
	<p>또 다른 페이지를 포함하고자 할때 사용하는 방식</p>
	<h4>1.기존의 include 지시어를 이용하는 방식(정적 include방식 - 컴파일시 포함)</h4>
	<%-- 
	<%@include file="footer.jsp" %>
	<br><br>
	
	특징: include하고 있는 페이지에 선언된 변수 사용 가능 <br>
	include한 페이지의 year 값: <%=year %><br><br>
	
	현재 페이지에서 동일한 변수를 선언할 수 없음
	<%String year = "2024"; %>
	--%>
	
	<hr>
	
	<h4>2.JSP 표준 액션 태그를 이용한 방식(동적 include 방식 - 런타임 시 포함)</h4>
	
	<!-- 
		반드시 시작태그와 종료태그를 같이 사용해야한다 (xml 기술)
		단, 시작태그와 종료태그 사이에 넣을 값이 없다면 하나로 표기하는 방법<태그/>이렇게 표현한다.
	 -->
	<jsp:include page="footer.jsp"/>
	<br><br>
	특징1: include 하고 있는 페이지에 선언된 변수를 공유하지 않는다(동일한 이름의 변수 선언 가능)<br>
	<%String year = "2024"; %>
	<br>
	특징2: 포함시 include하는 페이지로 값을 전달할 수 있다.<br>
	<jsp:include page="footer.jsp">
		<jsp:param value="bye" name="hi"/>
	</jsp:include> 
	 
	<br>
	<jsp:include page="footer.jsp">
		<jsp:param value="hello" name="test"/>
	</jsp:include>
	
	<br><br>
	<a href="/actionProject">인덱스로</a>
</body>
</html>