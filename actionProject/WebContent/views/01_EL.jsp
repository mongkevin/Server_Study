<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.model.vo.Person"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL</h1>
	
	<h3>1.기존 방식대로 스크립틀릿, 표현식으로 각 영역에 있는 데이터 출력해보기</h3>
	<%
		//requestScope에 담긴 값 뽑기
		String classRoom = (String)request.getAttribute("classRoom");
		Person student = (Person)request.getAttribute("student");
		
		//sessionScope에 담긴 값 뽑기
		String academy = (String)session.getAttribute("academy");
		Person lecture = (Person)session.getAttribute("lecture");
	%>
	<p>
		학원명: <%=academy%><br> 
		강의장: <%=classRoom%><br> 
		강사 정보 <br>
			<ul>
				<li>이름: <%= lecture.getName()%></li>
				<li>성별: <%= lecture.getGender() %></li>
			</ul>
		수강생 정보<br>
			<ul>
				<li>이름: <%= student.getName() %></li>
				<li>성별: <%= student.getGender()%></li>
			</ul>
	</p>

	<hr>

	<h3>2. EL을 이용해서 해당 scope에 저장된 값 출력해보기</h3>

	<p>
		EL은 getter 메소드를 이용하여 값을 꺼내올 필요 없이 키값만 제시하면 접근 가능하다<br>
		내부적으로 해당 scope 영역에 키값에 해당하는 벨루값을 꺼내올 수 있음<br>
		존재하는 경우 해당 값을 가져온다.
	</p>

	<p>
		학원명: ${academy}<br> 
		강의장: ${classRoom}<br> 
		강사 정보<br>
		<ul>
			<li>이름: ${lecture.name}</li>
			<li>성별: ${lecture.gender}</li>
		</ul>
		<%--
			lecture에 접근했을때 해당 벨류값은 Person 객체가 되고 
			해당 객체의 필드값을 출력하고자 한다면 getter메소드가 아닌. 필드명을 사용하면 된다.
			이때 내부적으로 getter메소드가 호출되어 값을 조회해옴. 
			(때문에 getter메소드는 필수로 작성하여야한다)
		--%>
		수강생 정보<br>
			<ul>
				<li>이름: ${student.name }</li>
				<li>성별: ${student.gender }</li>
			</ul>
	</p>

	<hr>

	<h3>3.EL사용시 내장객체들에 저장된 키값이 동일할 경우</h3>
	scope 값: ${scope}<br>
	
	<!-- 
		EL은 공유범위가 가장 작은 scope에서부터 해당 키값을 검색한다.
		page->request->session->application 순으로 속성을 찾는다
		만약 모든 영역에서 찾지못한다면? 아무것도 출력되지 않음(오류발생하지 않음)
	 -->
	 <p>
	 	있나요? : ${nononono}
	 </p>
	 
	 <h3>4.직접 scope영역에 접근하여 값 출력</h3>
	 <%
	 	//PageScope에 값 담기
	 	pageContext.setAttribute("scope","page영역");
	 %>
	 
	 pageScope에 담긴 값: ${scope} 또는 ${pageScope.scope} <br>
	 requestScope에 담긴 값: ${requestScope.scope} <br>
	 sessionScope에 담긴 값: ${sessionScope.scope } <br>
	 applicationScope에 담긴 값: ${applicationScope.scope }<br><br>
	 
	 잘못된 접근 예시: session에 classRoom 접근해보기 - ${sessionScope.classRoom }<br>
	 -아무것도 출력되지 않음(classRoom은 requestScope)
	 
	 <br><br>
	 
	 <a href="/actionProject">인덱스로</a>
	 
	 
</body>
</html>