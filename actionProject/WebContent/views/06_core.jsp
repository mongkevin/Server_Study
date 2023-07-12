<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.model.vo.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1.변수(속성)</h3>
	<pre>
		*변수 선언(&lt;c:set var="변수명" value="리터럴" scope="스코프영역지정(생략가능)")&gt;)
		-변수를 선언하고 초기값을 대입해두는 기능 제공
		-해당 변수를 어떤 스코프 영역에 담아둘것인지 지정가능하다(생략시 기본값은 pageScope)
		-해당 scope 영역에 setAttribute라는 메소드를 이용하여 key+value를 지정하는 것이라고 생각하면 된다.
		-c:set을 통해 선언된 변수는 EL표기법을 통해 접근 가능하다(스크립팅원소로는 접근 불가)
		
		*주의 사항
		-변수의 타입을 변도로 지정하지 않음
		-반드시 해당 변수에 담고자하는 초기값 속성을 세팅해야한다(선언과 동시에 초기화)
	</pre>
	
	<!-- Unknown tag (c:set) - 선언해야한다. tag.lib -->
	<c:set var="num1" value="10"/><!-- pageScope에 담긴다 -->
	<c:set var="num2" value="20" scope="request"/><!-- requestScope에 담긴다 -->
	<!-- request.setAttribute("num2",20); -->
	
	num1변수값: ${num1 }<br>
	num2변수값: ${num2 }<br>
	
	<c:set var="num3" value="${num1 + num2 }" scope="session"/>
	
	num3 값: ${num3 }<br>
	
	<!-- 
		변수명만 제시한다면 작은 범위의 스코프 영역부터 찾아지게 된다.
		불필요한 조회가 이루어질수 있으니 해당 영역을 지정하는 것을 권장한다.
	 -->
	${pageScope.num1 }<br>
	${requestScope.num2 }<br>
	${sessionScope.num3 }<br>
	${requestScope.num3 }<br><!-- 출력되지 않음 -->
	 
	<c:set var="result" scope="request">
		9999
	</c:set>
	<!-- 시작 종료태그 사이에 value를 기술 가능하다 -->
	${requestScope.result }
	
	<hr>
	 
	<pre>
		*변수 삭제(removeAttribute)
		(&lt;c:remove var="제거하고자하는 변수명" scope="스코프영역지정(생략가능)"&gt;)
	 	-해당 변수를 scope영역에서 찾아 제거하는 태그
	 	-scope영역지정 생략시 모든 영역에서 해당 키값을 찾아 제거한다.
	</pre>
	 
	삭제전 result : ${result }<br><br>
	 
	<c:set var="result" scope="session">
		1234
	</c:set>
	 
	해당 영역을 지정해서 result 삭제<br>
	<c:remove var="result" scope="request"/>
	 
	삭제후 result: ${result }<br>
	 
	모든 영역에 있는 result를 삭제<br>
	<c:remove var="result"/>
	 
	모든 영역 삭제 후 result: ${result }<br>
	
	<hr>
	
	<pre>
		*변수(데이터) 출력(&lt;c:out value="출력하고자하는 값" default="기본값(생략가능)"
											 escapeXml="true(기본값,생략가능)/false"&gt;) 
		-데이터를 출력하고자 할때 사용하는 태그
		-기본값: value에 출력하고자 하는 값이 없을 경우 기본값으로 출력할 내용물을 기술(생략가능)
		-escapeXml: 태그로써 해석해서 출력할지 여부(생략가능, 생략 시 true가 기본값)
	</pre>
	
	result: <c:out value="${result }"/><br>
	default설정 후 result: <c:out value="${result }" default="없음"/><br><br>
	
	<!-- escapeXml 테스트 -->
	<c:set var="outTest" value="<b>출력테스트</b>"/>
	<c:out value="${outTest }"/><br><!-- escapeXml 기본값이 true(태그해석 불가) -->
	<c:out value="${outTest }" escapeXml="false"/><br>
	
	<hr>
	
	<h3>2.조건문 - if(&lt;c:if test="조건식"&gt;)</h3>
	<pre>
		-JAVA의 단일 if문과 비슷한 형식
		-조건식을 test라는 속성에 el 표기법으로 작성하여야한다.
	</pre>
	
	<%-- <%if(){%> --%>
	
	<%-- <%}%> --%>
	
	<c:if test="${num1 gt num2 }">
		<b>num1이 num2보다 큽니다.</b>
	</c:if>
	
	<c:if test="${num1 le num2 }">
		<b>num1이 num2보다 작거나 같습니다.</b>
	</c:if>
	
	<c:set var="str" value="안녕하세요"/>
	
	<c:if test="${str eq '안녕하세요' }">
		<mark>Hello</mark>
	</c:if>
	
	<c:if test="${str ne '안녕하세요' }">
		<mark>Bye</mark>
	</c:if>
	
	<h3>3.조건문 choose(&lt;c:choose&gt; &lt;c:when&gt;, &lt;c:otherwise&gt;)</h3>
	
	<pre>
		-JAVA의 if-else, if-else if문 또는 switch문과 비슷한 역할을 하는 태그
		-각 조건들을 c:choose의 하위요소로 c:when을 통해서 작성
	</pre>
	<%--
		<%if(num1==20){%>
		
		<%}else if(num1==10){%>
		
		<%}else{%>
		
		<%}%>
	 --%>
	 
	 <c:choose>
	 	<c:when test="${num1 eq 20 }"><!-- if -->
	 		<mark>처음 뵙겠습니다.</mark>
	 	</c:when>
	 	<c:when test="${num1 eq 10 }"><!-- else if -->
	 		<mark>초면입니다.</mark>
	 	</c:when>
	 	<c:otherwise><!-- else -->
	 		<mark>다시 만나요.</mark>
	 	</c:otherwise>
	 </c:choose>
	 
	 <br>
	 
	 <!-- num2와 10 20이 같은지 아니면~~ -->
	 <!-- choose안에 주석을 넣으면 오류난다, 굳이 넣을려면 choose밑에 말고 더 아래에 넣이면 된다 -->
	 <c:choose>
	 	<%--이 주석은 가능, 페이지 소스를 보면 안보인다. --%>
	 	<c:when test="${num2 eq 10 }">
	 		<mark>10이랑 같아요.</mark>
	 	</c:when>
	 	<c:when test="${num2 eq 20 }">
	 		<mark>20이랑 같아요.</mark>
	 	</c:when>
	 	<c:otherwise>
	 		<mark>10도 20도 아니에요.</mark>
	 	</c:otherwise>
	 </c:choose>
	 
	 <hr>
	 
	 <h3>4.반복문 - forEach</h3>
	 <pre>
	 	for loop문 - (&lt;c:forEach var="변수명"
	 							begin="초기값" end="끝 값" step="증가시킬값(생략가능)"&gt;)
	 	향상된 for문 - (&lt;c:forEach var="변수명" items="순차적으로 접근할 배열 또는 컬렉션"
	 							varStatus="현재 접근된 요소의 상태값을 보관할 변수명(생략가능)"&gt;)
	 	-> step : 지정하지 않으면 기본값 1
	 	-> varStatus : 현재 접근된 요소의 상태값을 보관할 변수명(생략가능)	
	 </pre>
	 
	 <!-- for loop문 -->
	 
	 <%--
	 	<%for(int i=0; i<10; i++){%>
	 	
	 	<%}%>
	  --%>
	 
	 <c:forEach var="i" begin="1" end="5">
	 	반복확인: ${i }<br>
	 </c:forEach>
	 <br>
	 
	 <c:forEach var="i" begin="1" end="10" step="2">
	 	반복확인: ${i }<br>
	 </c:forEach>
	 
	 <!-- 태그 안에서 변수 활용 -->
	<c:forEach var="i" begin="1" end="6">
		<h${i }>태그안에서도 적용 가능</h${i }>
	</c:forEach>
	
	<br>
	
	<!-- 향상된 for문 -->
	<c:set var="colors"><!-- 배열과 같은 역할 -->
		red,yellow,green,blue,pink,salmon
	</c:set>
	
	colors의 값: ${colors }<br>
	
	<ul>
		<c:forEach var="c" items="${colors }">
			<li style="color:${c};">${c }</li>
		</c:forEach>
	</ul>
	
	<!-- 응용 -->
	<%
		ArrayList<Person> list = new ArrayList<>();
		list.add(new Person("송혜교","여자"));
		list.add(new Person("임지연","여자"));
		list.add(new Person("김민수","남자"));
		
		request.setAttribute("pList",list);
		//이코드는 원래 서블릿에서 작성 후 페이지로 전달하기 전에 진행할 구문
	%>
	
	<table border="1">
		<thead>
			<tr>
				<th>순번</th>
				<th>이름</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<%-- el/jstl구문으로 바꿔보기
				<%if(pList.isEmpty()){%>
					<td colspan="3">조회결과가 없습니다.</td>
				<%}else{%>
					<%for(Person p:pList){%>
						<td>각순번</td> --status.count
						<td>각이름</td>
						<td>각나이</td>
					<%}%>
				<%}>
			 --%>
			 <c:choose>
			 	<c:when test="${empty pList}">
			 		<td colspan="3">조회결과가 없습니다.</td>
			 	</c:when>
			 	<c:otherwise>
				 	<c:forEach var="p" items="${pList }" varStatus="status">
				 		<tr>
				 			<!-- index : 0부터/ count : 1부터 -->
					 		<td>${status.count}</td>
							<td>${p.name}</td>
							<td>${p.gender}</td>
						</tr>
				 	</c:forEach>
			 	</c:otherwise>
			 </c:choose>
		</tbody>
	</table>
	
	<hr>
	
	<h3>5.반복문 - forTokens</h3>
	<pre>
		&lt;c:forTokens var="각값을 담을 변수" items="분리시키고자하는 문자열" delims="구분자"&gt;
		-구분자를 통해서 분리된 각각의 문자열에 순차적으로 접근하면서 반복 수행
		-JAVA의 split("구분자") 또는 StringTokenizer와 비슷한 역할
	</pre>
	
	<c:set var="device" value="컴퓨터,휴대폰,TV,에어컨/냉장고.세탁기"/>
	
	<ul>
		<c:forTokens var="d" items="${device }" delims=",/.">
			<li>${d }</li>
		</c:forTokens>
	</ul>
	
	<hr>
	
	<h3>6.쿼리스트링 관련 - url,param</h3>
	<pre>
		&lt;c:url var="" value+"요청할 url"&gt;
			&lt;c:param name="키값" value="벨류값" &gt;
			&lt;c:param name="키값" value="벨류값" &gt;
			...
			
		&lt;/c:url&gt;
		
		-url 경로를 생성하고, 쿼리스트링을 정의할 수 있는 태그
		-넘겨야할 쿼리스트링이 길 경우 사용하면 편하다.
	</pre>
	
	<a href="list.do?cPage=1&num2">기존 방식</a>
	
	<c:url var="query" value="list.do">
		<c:param name="cPage" value="1"/>
		<c:param name="num" value="10"/>
		<c:param name="name" value="test"/>
		<c:param name="gender" value="m"/>
	</c:url>
	<br>
	
	<a href="${query }">c:url을 이용한 방식</a>
	
	<br><br>
	<a href="/actionProject">인덱스로</a>
</body>
</html>