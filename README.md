# Server_Study
Study server web development  
비동기 통신, EL 표기법, 마이바티스 등 공부한 내용을 총 4개의 프로젝트로 담았다.

---
## actionProject
### EL표기법
EL(표현 언어, Expression Language)은 JavaServer Pages(JSP)에서 동적으로 웹 페이지를 생성하기 위해 사용되는 간단한 표현 언어이다. EL은 JSP에서 Java 코드를 간결하게 표현하고, 변수나  
속성에 접근하고, 수식을 계산하는 등의 작업을 수행하는 데 사용된다. EL은 JSTL(JSP Standard Tag Library)과 함께 사용되어 JSP 페이지를 더 간결하고 가독성이 좋게 만들어 준다.  

EL의 주요 특징과 표기법은 다음과 같다:

>1. 변수 표현식: ${} 기호를 사용하여 변수를 표현합니다. EL은 JSP 페이지에서 해당 변수의 값을 출력하거나, 값을 읽어오는 등의 작업을 수행한다.  
>2. 속성 접근: ${} 기호를 사용하여 JavaBean 객체의 속성에 접근할 수 있다. JavaBean 객체의 속성은 객체의 getter 메서드를 통해 값을 가져오거나, setter 메서드를 통해 값을 설정할 수 있는 
   멤버 변수를 말한다.  
>3. 연산: EL은 수학적인 연산을 지원하며, ${} 기호 내에서 산술 연산, 논리 연산, 비교 연산 등을 수행할 수 있다.  
>4. 컬렉션 및 맵 처리: EL은 배열, 리스트, 맵과 같은 컬렉션 객체에 접근하고, 반복문을 통해 요소를 처리하는 기능을 제공한다.

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>EL Example</title>
</head>
<body>
    <%-- 변수 설정 --%>
    <% int number = 10; %>
    
    <%-- EL 표현식을 사용하여 변수 출력 --%>
    <h1>Number: ${number}</h1>

    <%-- JavaBean 객체 생성 --%>
    <%!
        public class Person {
            private String name;
            public Person(String name) {
                this.name = name;
            }
            public String getName() {
                return name;
            }
        }
    %>
    
    <%-- EL 표현식을 사용하여 JavaBean 객체의 속성 출력 --%>
    <% Person person = new Person("Alice"); %>
    <h2>Hello, ${person.name}!</h2>
</body>
</html>
```

**스크립틀릿과 EL표기법 차이점**  
스크립틀릿(Scriptlet)과 EL(표현 언어, Expression Language)은 모두 JSP(JavaServer Pages)에서 사용되는 동적인 웹 페이지 생성을 위한 기술이지만, 사용 방식과 목적 등에서 몇 가지 
중요한 차이점이 있다.  

1. 사용 방식:  
   - 스크립틀릿: 스크립틀릿은 JSP 페이지 내에 <% %> 태그를 사용하여 Java 코드를 삽입하는 방식으로 사용된다. 즉, Java 코드와 HTML 코드가 혼합되어 있다.  
   - EL 표기법: EL 표기법은 ${} 기호를 사용하여 변수, 속성, 연산 등을 간단하게 표현하는 방식으로 사용된다. EL은 HTML 코드와 완전히 분리되어 있어서 JSP 페이지를 더 간결하고 가독성 
     이 좋게 만들어준다.  

2. 목적:  
   - 스크립틀릿: 스크립틀릿은 주로 비즈니스 로직이나 데이터 처리를 위해 사용된다. 변수 선언, 반복문, 조건문 등을 스크립트 형태로 처리한다.  
   - EL 표기법: EL 표기법은 주로 데이터 출력을 위해 사용된다. 변수의 값을 출력하거나 JavaBean 객체의 속성을 출력하는 등의 작업을 간단하게 수행한다.  

3. 가독성과 유지보수성:  
   - 스크립틀릿: 스크립틀릿은 Java 코드와 HTML 코드가 혼합되어 있기 때문에 가독성이 떨어질 수 있고, 복잡한 로직이나 많은 양의 Java 코드를 작성할 경우 유지보수가 어려워질 수 있다.  
   - EL 표기법: EL 표기법은 간단하고 직관적인 문법을 가지고 있으므로 가독성이 좋고, 단순한 출력이나 변수 접근과 같은 작업을 빠르고 쉽게 처리할 수 있다. 따라서 유지보수성이 높아진다. 

**일반적으로 가독성과 유지보수성을 고려하여 가능하면 스크립틀릿보다는 EL 표기법을 사용하는 것이 권장된다. 스크립틀릿은 데이터 처리와 비즈니스 로직을 담당하고,   
EL은 간단한 데이터 출력을 담당하는 역할로 사용하면 더 간결하고 효율적인 JSP 페이지를 작성할 수 있다.**

**Scope**  
데이터를 담을 수 있는 영역(JSP 내장객체 종류) - scope  
1.ServletContext(application scope)  
한 애플리케이션 1개 존재하는 객체
이 영역에 데이터를 담으면 애플리케이션 전역에서 사용가능하다.(공유범위가 가장 크다)
 
2.HttpSession (session scope)  
한 브라우저당 1개 존재하는 객체
이 영역에 데이터를 담으면 jsp/servlet에서 사용가능하다
값이 한번 담기면 서버가 멈추거나 브라우저가 닫힐때까지 사용가능하다

3.HttpServletRequest (request scope)  
요청 및 응답시 매번 생성되는 객체
이 영역에 데이터를 담으면 해당 request 객체를 포워딩 받는 응답 페이지에서 사용 가능하다

4.PageContext(page scope)  
현재 jsp 페이지에서만 사용가능
-공유 범위가 가장 작음

위 객체들 모두 값을 담을땐 .setAttribute("키",데이터);  
꺼낼땐 .getAttribute("키");  
값을 지울땐 .removeAttribute("키");  
EL은 공유범위가 가장 작은 scope에서부터 해당 키값을 검색한다.  
**page->request->session->application 순으로 속성을 찾는다.**  
만약 모든 영역에서 찾지못한다면? 아무것도 출력되지 않음(오류발생하지 않음)  

**각각 Scope에 데이터 담기** 
```java
request.setAttribute("scope", "request영역");
session.setAttribute("scope", "session영역");
ServletContext application = request.getServletContext();
application.setAttribute("scope", "application영역");
```
```jsp
<%
	 	//PageScope에 값 담기 가장 작은 범위기 때문에 page에서 담는다.
	 	pageContext.setAttribute("scope","page영역");
%>
```
**각각 Scope에 담긴 데이터 꺼내기**  
```jsp
pageScope에 담긴 값: ${scope} 또는 ${pageScope.scope}  
requestScope에 담긴 값: ${requestScope.scope}
sessionScope에 담긴 값: ${sessionScope.scope }
applicationScope에 담긴 값: ${applicationScope.scope }
```

### EL연산
1. 산술연산
```jsp
		*EL 연산<br><br>
		10 + 3 = ${big+small }<br>
		10 - 3 = ${big-small }<br>
		10 X 3 = ${big*samll }<br>
		10 / 3 = ${big/small } 또는 ${big div small }<br>
		10 % 3 = ${big%small } 또는 ${big mod small }<br>
```
2. 숫자간 대소 비교 연산  
```jsp
		*EL 연산방식<br>
		10 > 3 : ${big > small } 또는 ${big gt small }<br>
		10 < 3 : ${big < small } 또는 ${big lt small }<br>
		10 >= 3 : ${big >= small } 또는 ${big ge small }<br>
		10 <= 3 : ${big <= small } 또는 ${big le small }<br>
```
3. 동등 비교 연산  
```jsp
    *EL연산 방식<br>
		10과 3이 일치합니까?: ${big == small} 또는 ${big eq small }<br>
		big에 담긴 값이 10과 일치합니까?: ${big == 10} 또는 ${big eq 10 }<br>
		
		sOne과 sTwo가 일치합니까?: ${sOne == sTwo} 또는 ${sOne eq sTwo }<br>
		<!-- EL에서의 == 비교는 자바에서의 equals()메소드의 기능을 한다 -->
		sOne과 sTwo가 일치하지 않습니까?: ${sOne != sTwo } 또는 ${sOne ne sTwo }<br>
		
		sOne에 담긴 값과 "안녕" 이 일치합니까?: ${sOne == "안녕" } 또는 ${sOne eq '안녕' }<br>
		<!-- EL에서 문자열 리터럴 제시시 홑따옴표 쌍따옴표 둘다 가능 -->
```
4. 객체가 null인지 또는 list가 비어있는지 확인하는 연산  
```jsp
    *EL연산<br>
		pOne이 null입니까?: ${pOne == null } 또는 ${empty pOne }<br>
		pTwo이 null입니까?: ${pTwo == null } 또는 ${empty pTwo }<br>
		pOne이 null이 아닙니까?: ${pOne != null } 또는 ${not empty pOne }<br>
		
		lOne이 비어있습니까?: ${empty lOne }<br>
		lTwo이 비어있습니까?: ${empty lTwo }<br>
```
5. 논리 연산자
```jsp
    *EL연산<br>
		AND 연산 ${true && true } 또는 ${true and true } <br>
		OR 연산 ${true || true } 또는 ${true or true } <br>
```

### include
또 다른 페이지를 포함하고자 할때 사용하는 방식  
반드시 시작태그와 종료태그를 같이 사용해야한다 (xml 기술)  
단, 시작태그와 종료태그 사이에 넣을 값이 없다면 하나로 표기하는 방법<태그/>이렇게 표현한다.  
```jsp
  특징1: include 하고 있는 페이지에 선언된 변수를 공유하지 않는다(동일한 이름의 변수 선언 가능)
  <jsp:include page="footer.jsp"/>

  특징2: 포함시 include하는 페이지로 값을 전달할 수 있다.
  <jsp:include page="footer.jsp">
		<jsp:param value="bye" name="hi"/>
	</jsp:include> 
```
**스크립틀릿의 include와 차이점이 있다.**  
include에 적용되는 방식과 목적 등에서 몇 가지 중요한 차이점이 있다.  

1. 사용 방식:
   - 스크립틀릿: 스크립틀릿은 JSP 페이지 내에 <% %> 태그를 사용하여 Java 코드를 삽입하는 방식으로 사용된다. 즉, Java 코드와 HTML 코드가 혼합되어 있습니다. include 문은  
     JSP 파일을 포함할 때도 스크립틀릿 방식으로 사용된다.  
   - EL 표기법: EL 표기법은 ${} 기호를 사용하여 변수, 속성, 연산 등을 간단하게 표현하는 방식으로 사용된다. EL 표기법은 데이터 출력 등의 단순한 작업에 사용된다.  

2. 목적:
   - 스크립틀릿: 스크립틀릿은 주로 비즈니스 로직이나 데이터 처리를 위해 사용됩니다. 변수 선언, 반복문, 조건문 등을 스크립트 형태로 처리합니다. include 문은 다른 JSP 파일의 내용을  
      현재 JSP 파일에 포함시키는 용도로 사용됩니다.  
   - EL 표기법: EL 표기법은 주로 데이터 출력을 위해 사용된다. 변수의 값을 출력하거나 JavaBean 객체의 속성을 출력하는 등의 작업을 간단하게 수행한다.  

3. 적용 방식:
   - 스크립틀릿: include 문은 다른 JSP 파일을 포함시키기 위해 스크립틀릿 방식으로 사용된다. 즉, 다른 JSP 파일을 포함하려면 `<%@ include file="fileName.jsp" %>`와 같은 스크립틀릿 
    문법을 사용합니다.
   - EL 표기법: EL은 include 기능을 직접 제공하지 않는다. 대신, JSP 표준 태그 라이브러리(JSTL)의 `<c:import>` 태그를 사용하여 다른 JSP 파일을 포함시키는 것이 일반적이다.

**스크립틀릿을 사용한 include**
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Include using Scriptlet</title>
</head>
<body>
    <%-- Include using Scriptlet --%>
    <%@ include file="included.jsp" %>
</body>
</html>
```

**EL 표기법을 사용한 include**
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Include using EL</title>
</head>
<body>
    <jsp:include page="footer.jsp"/>
    <%-- Include using JSTL c:import --%>
    <c:import url="included.jsp" />
</body>
</html>
```

두 개의 JSP 파일 모두 "included.jsp" 파일의 내용을 현재 JSP 파일에 포함시킨다. 스크립틀릿은 `<%@ include file="fileName.jsp" %>` 문법으로, EL 표기법은 `<c:import>` 태그로도   
include를 수행한다.
**중요한 차이점은 스크립틀릿으로 include를 한 페이지의 script를 그대로 사용 가능하지만 EL표기법으로 include를 하면 사용이 불가능하다.**

### forward  
forward는 url은 유지한채로 페이지 이동(위임)
```jsp
  <jsp:forward page="footer.jsp">
		<jsp:param value="안녕" name="test"/>
	</jsp:forward>
```

### JSTL
JSP Standard Tag Library의 약자로 JSP에서 사용되는 커스텀 액션 태그로  
공통적으로 사용되는 코드들의 집합을 보다 쉽게 사용할 수 있도록 태그화 해서 표준으로 제공하는 라이브러리이다.
JSTL은 JSP 페이지 내에서 Java 코드보다 더 간결하고 가독성이 좋은 코드를 작성할 수 있도록 지원하며, 자주 반복되는 로직이나 데이터 처리를 표준화된 태그로 쉽게 처리할 수 있다.  

JSTL에는 다음과 같은 주요 태그들이 포함되어 있다:

1. Core 태그 라이브러리: 기본적인 제어 구문을 제공하는 태그 라이브러리로, 반복문, 조건문 등을 담당한다.  
2. Formatting 태그 라이브러리: 날짜, 시간, 숫자 등의 형식을 포맷팅하는 데 사용되는 태그 라이브러리이다.  
3. SQL 태그 라이브러리: 데이터베이스와의 상호 작용을 위한 태그 라이브러리로, 데이터베이스에서 데이터를 조회, 수정, 삭제하는 등의 작업을 수행한다.  
4. XML 태그 라이브러리: XML 문서를 처리하는 데 사용되는 태그 라이브러리로, XML 파싱, 변환 등의 작업을 수행한다.  

JSTL의 주요 특징과 장점은 다음과 같다:  

- 가독성과 유지보수성: JSTL을 사용하면 복잡한 Java 코드 없이 간결하고 읽기 쉬운 태그를 통해 작업을 수행할 수 있으므로 가독성과 유지보수성이 높아진다.  
- 재사용성: JSTL은 자주 사용되는 로직을 태그로 래핑하여 쉽게 재사용할 수 있도록 한다.  
- 표준화: JSTL은 JSP 스펙의 일부로 표준화되어 있으므로 대부분의 JSP 컨테이너(예: Apache Tomcat, WildFly)에서 지원된다.  
- 로직과 프레젠테이션의 분리: JSTL을 활용하여 비즈니스 로직과 프레젠테이션 로직을 분리하여 MVC 아키텍처를 보다 체계적으로 구현할 수 있다.  

**다운방법**  
1)https://tomcat.apache.org/download-taglibs.cgi  
2)Standard-1.2.5 - jar파일 4개 다 다운받기  
3)WEB-INF/lib에 추가하기  

**JSTL 선언 방법**  
JSTL을 선언하는 방법 - 사용하고자 하는 jsp 페이지 상단에 taglib지시어를 이용하여 선언한다.  

```jsp
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> //core 선언
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> //formatting 선언
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> //function 선언
<!DOCTYPE html>
<html>
<head>
    <title>JSTL Example</title>
</head>
<body>
    <%-- JSTL Core 태그를 사용하여 반복문 처리 --%>
    <c:forEach var="i" begin="1" end="5">
        <p>Iteration ${i}</p>
    </c:forEach>

    <%-- JSTL Core 태그를 사용하여 조건문 처리 --%>
    <c:if test="${2 > 1}">
        <p>2 is greater than 1</p>
    </c:if>
</body>
</html>
```

**JSTL Functions Library**
```jsp
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <c:set var="str" value="Hello World"/>
	str : ${str } <br>
	
	문자열의 길이: ${fn:length(str) }글자<br>
	문자열의 길이: ${str.length() }글자<br><!-- 자바 메소드 방식 -->
	
	모두 대문자로 출력: ${fn: toUpperCase(str) }<br>
	모두 소문자로 출력: ${fn: toLowerCase(str) }<br>
	
	World의 시작 인덱스: ${fn:indexOf(str,"World")}<br>
	World를 Bye로 변환: ${fn: replace(str,"World","Bye") }<br>
	
	str에 World가 포함되어 있나요?: ${fn: contains(str,"World") }<br>
	<c:if test="${fn:contains(str,'World') }">
		<h2>포함되어 있어요</h2>
	</c:if>
```

### JSTL Core Library 
1. 변수(속성)  
변수 선언(<c:set var="변수명" value="리터럴" scope="스코프영역지정(생략가능)")>)  
-변수를 선언하고 초기값을 대입해두는 기능 제공  
-해당 변수를 어떤 스코프 영역에 담아둘것인지 지정가능하다(생략시 기본값은 pageScope)  
-해당 scope 영역에 setAttribute라는 메소드를 이용하여 key+value를 지정하는 것이라고 생각하면 된다.  
-c:set을 통해 선언된 변수는 EL표기법을 통해 접근 가능하다(스크립팅원소로는 접근 불가)  
		
주의 사항  
-변수의 타입을 변도로 지정하지 않음  
-반드시 해당 변수에 담고자하는 초기값 속성을 세팅해야한다(선언과 동시에 초기화)  
```jsp
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
```
2. 조건문 - if(<c:if test="조건식">)  
-JAVA의 단일 if문과 비슷한 형식  
-조건식을 test라는 속성에 el 표기법으로 작성하여야한다.
```jsp
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
```
3. 조건문 choose(<c:choose> <c:when>, <c:otherwise>)  
-JAVA의 if-else, if-else if문 또는 switch문과 비슷한 역할을 하는 태그  
-각 조건들을 c:choose의 하위요소로 c:when을 통해서 작성
```jsp
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
```
4. 반복문 - forEach  
for loop문 - (<c:forEach var="변수명"  
	 	begin="초기값" end="끝 값" step="증가시킬값(생략가능)">)  
향상된 for문 - (<c:forEach var="변수명" items="순차적으로 접근할 배열 또는 컬렉션"  
	 	varStatus="현재 접근된 요소의 상태값을 보관할 변수명(생략가능)">)  
-> step : 지정하지 않으면 기본값 1  
-> varStatus : 현재 접근된 요소의 상태값을 보관할 변수명(생략가능)
```jsp
	 <c:forEach var="i" begin="1" end="5">
	 	반복확인: ${i }<br>
	 </c:forEach>
	 
	 <c:forEach var="i" begin="1" end="10" step="2">
	 	반복확인: ${i }<br>
	 </c:forEach>
	 
	 <!-- 태그 안에서 변수 활용 -->
	<c:forEach var="i" begin="1" end="6">
		<h${i }>태그안에서도 적용 가능</h${i }>
	</c:forEach>

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
```
5. 반복문 - forTokens
<c:forTokens var="각값을 담을 변수" items="분리시키고자하는 문자열" delims="구분자">  
-구분자를 통해서 분리된 각각의 문자열에 순차적으로 접근하면서 반복 수행  
-JAVA의 split("구분자") 또는 StringTokenizer와 비슷한 역할
```jsp
	<c:set var="device" value="컴퓨터,휴대폰,TV,에어컨/냉장고.세탁기"/>
	
	<ul>
		<c:forTokens var="d" items="${device }" delims=",/.">
			<li>${d }</li>
		</c:forTokens>
	</ul>
```
6. 쿼리스트링 관련 - url,param  
<c:url var="" value+"요청할 url">   
<c:param name="키값" value="벨류값" >  
<c:param name="키값" value="벨류값" >  
...  
			
</c:url>  
		
-url 경로를 생성하고, 쿼리스트링을 정의할 수 있는 태그  
-넘겨야할 쿼리스트링이 길 경우 사용하면 편하다.  
```jsp
	<a href="list.do?cPage=1&num2">기존 방식</a>

	<c:url var="query" value="list.do">
		<c:param name="cPage" value="1"/>
		<c:param name="num" value="10"/>
		<c:param name="name" value="test"/>
		<c:param name="gender" value="m"/>
	</c:url>

	<a href="${query }">c:url을 이용한 방식</a>
```
>href="list.do?cPage=1&num2"와 같이 URL 주소에 파라미터를 추가하여 다른 페이지로 데이터를 전달하는 것을 "쿼리 파라미터(Query Parameter)"를 사용하여 데이터를 전달한다고 한다.  
>- "list.do": 요청을 처리할 서블릿 또는 JSP 파일의 경로를 가리킨다.  
>- "?": URL 주소와 쿼리 파라미터를 구분하는 기호이다.  
>- "cPage=1&num2": 실제로 넘겨지는 파라미터들로, "cPage=1"과 "num2"라는 파라미터가 URL을 통해 서버로 전달된다.
>  
>쿼리 파라미터를 사용하면 클라이언트가 웹 서버로 데이터를 전달하거나 요청하는 경우에 유용하게 사용된다.
>이를 통해 웹 서버는 클라이언트의 요청에 따라 적절한 처리를 수행하고 응답을 반환할 수 있다.   
>서버 측에서는 해당 파라미터를 추출하여 필요한 작업을 처리할 수 있다.

### JSTL Formatting Library 
1. formatNumber
숫자데이터의 포맷(형식) 지정
-표현하고자 하는 숫자 데이터의 형식을 통화기호, %등 원하는 쓰임에 맞게 지정하는 태그
<fmt:formatNumber value="출력할 값" groupingUsed="true/false(기본값 true)"
			type="percent/currency" currencySimbol="$" />
	(groupingUsed, type, currentSymbol들은 생략 가능한 속성)
```jsp
	<c:set var="num1" value="123456789"/>
	<c:set var="num2" value="0.75"/>
	<c:set var="num3" value="50000"/>
	
	그냥 출력: ${num1 }<br>
	세자리마다 구분하여 출력: <fmt:formatNumber value="${num1 }"/><br>
	숫자 그대로 출력: <fmt:formatNumber value="${num1 }" groupingUsed="false"/><br>
	<!-- 
		formatNumber: 3자리마다,가 찍힌다
		groupingUsed: 기본값은 true (,구분자 찍히게)
	 -->
	
	percent: <fmt:formatNumber value="${num2 }" type="percent"/><br>
	<!-- 소수점을 백분율로 보여준다 -->
	
	currency: <fmt:formatNumber value="${num3 }" type="currency"/><br>
	<!-- 
		통화(돈) 단위로 보여진다. 지금 사용하고 있는 컴퓨터의 로컬정보에 의해서 정해진다.
		groupingUsed 기본값이 true이기 때문에 3자리마다,구분도 되어있다.
	 -->
	
	currency $: <fmt:formatNumber value="${num3 }" 
									type="currency" currencySymbol="$"/><br>
	<!-- 
		currencySymbol="$" : 통화기호 문자의 종류 지정
	 -->
```
2. formatDate
날짜 및 시간 데이터의 포맷(형식) 지정  
단 java.util.Date 객체를 사용해야한다.
```jsp
	<c:set var="current" value="<%=new java.util.Date() %>"/>
	
	그냥 출력: ${current }<br>
	
	<ul>
		<li>
			현재 날짜: <fmt:formatDate value="${current }" type="date"/>
			<!-- type 속성은 생략가능, 생략시 기본값이 "date" 날짜를 출력 -->
		</li>
		<li>
			현재 시간: <fmt:formatDate value="${current }" type="time"/>
			<!-- type: time 시간을 출력 -->
		</li>
		<li>
			현재 날짜 및 시간: <fmt:formatDate value="${current }" type="both"/>
			<!-- type: both 날짜, 시간을 모두 출력 -->
		</li>
		<li>
			medium: <fmt:formatDate value="${current }" type="both" 
										dateStyle="medium" timeStyle="medium"/>
			<!-- 기본 길이 형식 -->
		</li>
		<li>
			long: <fmt:formatDate value="${current }" type="both" 
										dateStyle="long" timeStyle="long"/>
		</li>
		<li>
			full: <fmt:formatDate value="${current }" type="both" 
										dateStyle="full" timeStyle="full"/>
		</li>
		<li>
			short: <fmt:formatDate value="${current }" type="both" 
										dateStyle="short" timeStyle="short"/>
		</li>
		<li>
			customizing: <fmt:formatDate value="${current }" type="both" 
										pattern="yyyy-MM-dd(E) a HH:mm:ss"/>
			<!-- pattern 속성을 통해 형식을 지정할 수 있음 -->
		</li>
	</ul>
	<!-- 
		-dateStyle과 timeStyle을 동일하게 맞출 필요 없음
		-customizing에서 형식
		yyyy : 년도
		MM : 월
		dd : 일
		E : 요일
		a : 오전/오후
		HH : 시
		mm : 분
		ss : 초
	 -->
```

---
## ajaxProject
### AJAX
비동기 통신(Ajax)은 웹 페이지에서 데이터를 서버로 전송하거나 서버로부터 데이터를 받아오는 기술로, 웹 페이지를 새로고침하지 않고도 동적으로 데이터를 업데이트하고 처리할 수 있게     
해준다. "Asynchronous JavaScript and XML"의 약자로, 기존에는 전체 페이지를 다시 로드해야 했던 것과는 달리 일부분만 업데이트할 수 있어 사용자 경험을 향상시키는데 도움이 된다.  

Ajax의 주요 특징은 다음과 같다:  

1. 비동기성: Ajax는 비동기적으로 동작한다. 즉, 웹 페이지가 다른 작업을 처리하거나 서버와 통신하는 동안 사용자가 다른 동작을 수행할 수 있다. 이로 인해 페이지 전체를 새로고침할  
   필요가 없으며, 웹 페이지가 더 반응성 있고 빠르게 동작한다.  

2. XMLHttpRequest: Ajax는 XMLHttpRequest 객체를 사용하여 서버와의 데이터 교환을 수행한. 이를 통해 JavaScript 코드를 통해 서버에 데이터를 요청하고, 서버가 응답하는 데이터를  
   처리할 수 있다.    

3. JSON 또는 XML 데이터 형식: Ajax를 통해 주로 JSON 또는 XML 형식의 데이터를 주고받는다. 이를 통해 데이터를 구조화하고 파싱하기 쉬워잔다.  

4. DOM 조작: Ajax는 동적으로 데이터를 받아와서 웹 페이지의 DOM(Document Object Model)을 조작한다. 즉, 데이터를 받아와서 적절한 위치에 동적으로 추가하거나 업데이트하는 등의  
   작업을 수행한다.  

Ajax는 다양한 용도로 사용되며, 웹 페이지의 사용자 경험을 향상시키기 위해 필수적인 기술 중 하나이다. 웹 애플리케이션에서 데이터를 실시간으로 업데이트하거나, 사용자의 입력에 따라  
동적으로 데이터를 가져와서 표시하는 등의 작업에 자주 사용된다.  

비동기식의 단점  
-현재 페이지에 지속적으로 리소스가 쌓인다. - 페이지가 느려질수 있음.  
-페이지 내 복잡도가 증가한다. - 에러발생시 디버깅이 어려워진다.  
-요청 후 돌아온 응답에 대해 새로운 요소를 만들어 데이터를 출력해야한다.  
->DOM요소를 만들어 뿌려주기 때문에 해당 요소 새성 구문을 잘 알고 있어야한다.  

### JSON
JSON (JavaScript Object Notation)은 데이터를 효율적으로 저장하고 교환하기 위한 경량화된 데이터 형식이다. JSON은 사람이 읽고 쓰기 쉽고, 기계가 파싱하고 생성하기도 간단하여,   
특히 웹 환경에서 데이터를 전송하는데 많이 사용된다. JavaScript에서 객체를 생성하는 문법과 유사하여 JavaScript의 객체 리터럴과 비슷한 형식을 가지고 있다.   

JSON 형식은 다음과 같은 규칙을 따른다:  

1. 데이터는 "키:값" 형태의 쌍으로 구성된다.  
2. 데이터는 쉼표(,)로 구분한다.  
3. 객체는 중괄호({})로 묶고, 배열은 대괄호([])로 묶는다.  
4. 키는 큰따옴표("")로 감싸며, 값은 숫자, 문자열, 불리언, 배열, 객체, null을 포함할 수 있다.  

JSON은 웹 애플리케이션에서 데이터를 전송하거나 서버와 클라이언트 간에 통신할 때 주로 사용된다. AJAX를 통해 서버로부터 JSON 데이터를 비동기적으로 요청하여 웹 페이지에 동적으로   
데이터를 업데이트하는데 자주 사용된다.  

```json
{
  "name": "John Doe",
  "age": 30,
  "email": "john.doe@example.com",
  "isMember": true,
  "hobbies": ["reading", "coding", "traveling"],
  "address": {
    "city": "New York",
    "zipCode": "10001"
  },
  "extraData": null
}
```

위의 JSON 데이터 예시에서 "name", "age", "email" 등은 키이며, "John Doe", 30, "john.doe@example.com" 등은 해당 키에 대응하는 값이다. 배열은 대괄호([]) 안에 여러 값을 순서대로  
나열하여 표현하며, 객체는 중괄호({}) 안에 키-값 쌍을 나열하여 표현한다. "extraData"의 값이 null인 것처럼, JSON은 null도 포함할 수 있다.  

**JSON과 xml의 차이점**  
JSON과 XML은 모두 데이터를 저장하고 교환하기 위한 형식이지만, 몇 가지 중요한 차이점이 있다.  

1. 데이터 형식:  
   - JSON: JSON은 JavaScript Object Notation의 약자로, JavaScript에서 객체를 생성하는 문법과 유사한 형식을 가지고 있다. 데이터를 "키:값" 형태의 쌍으로 표현하며,  
     데이터 타입으로는 숫자, 문자열, 불리언, 배열, 객체, null 등을 지원한다.  
   - XML: XML은 eXtensible Markup Language의 약자로, 데이터를 태그와 속성으로 묶어 표현한다. 각 데이터를 트리 구조로 표현하며, 데이터와 태그를 직접 정의할 수 있어  
     매우 유연한 형식을 가지고 있다.  

2. 가독성:  
   - JSON: JSON은 사람이 읽고 쓰기 쉬워서, 가독성이 좋다. 특히, JavaScript와 유사한 문법을 사용하기 때문에 JavaScript 개발자들에게 친숙하다.  
   - XML: XML은 태그와 속성으로 구성되기 때문에 가독성이 JSON보다는 상대적으로 떨어질 수 있다.  

3. 크기:  
   - JSON: JSON은 XML에 비해 데이터를 더 적은 용량으로 표현할 수 있다. 이는 JSON이 더 간결하고 중복을 피할 수 있기 때문이다.  
   - XML: XML은 태그와 속성 등의 구조로 인해 더 큰 용량을 차지할 수 있다.  

4. 파싱과 처리:  
   - JSON: JSON은 JavaScript에서 내장된 메서드인 `JSON.parse()`를 사용하여 쉽게 파싱할 수 있고, 객체로 변환할 수 있다.  
   - XML: XML은 파싱을 위해 별도의 라이브러리가 필요하며, 처리 과정이 복잡할 수 있다.  

5. 지원 언어:  
   - JSON: JSON은 JavaScript에서 기본적으로 지원되지만, 다른 프로그래밍 언어에서도 많은 지원을 받는다.  
   - XML: XML은 JavaScript에서 직접 지원하지 않지만, 다양한 프로그래밍 언어에서 XML 파싱과 처리를 지원한다.  

**jQuery 방식으로 AJAX통신**
$.ajax({  
	속성명: 속성값,  
	속성명: 속성값,  
	...  
});  
		
*주요속성  
- url: 요청할 url (필수)  
- type|method: get/post (요청 전송방식 (생략시는 get이 기본값))  
- data: 요청할 전달 값   
- success: ajax통신이 성공시 행할 작업코드 (함수) function()  
- error: ajax통신이 실패시 행할 작업코드(함수) function()  
- complete: ajax통신의 성공실패 여부에 상관없이 실행할 함수 정의 function()  
		
*부수적인 속성  
- async: 서버와의 비동기 처리방식 설정 여부 (기본값 true) -동기통신도 가능하게 하는 속성  
- contentType: request의 데이터 인코딩 타입 정의  
- dataType: 서버에서 request로 오는 데이터의 데이터 형 설정, 값이 없다면 알아서 설정해준다  
		   ex) xml, json, script, html, text  
- accept: 파라미터 타입을 설정  
- beforeSend: ajax요청을 하기 전 실행되는 이벤트  
- cache: 요청 및 결과를 scope에서 갖고있지 않도록 하는 속성(기본값 true)  
- contents: jQuery에서 response의 데이터를 파싱하는 방식 정의 속성  
- crossDomain: 타 도메인 호출 가능 여부 설정 (기본 false)  
- dataFilter: response를 받았을때 정상적인 값을 return할수 있도록 데이터와 데이터 타입 설정  
- global: 기본 이벤트 사용 여부(ajaxStart, ajaxStop) 버퍼링 같이 시작과 끝을 나타낼때  
- password: 서버에 접속 권한(비밀번호)가 필요한 경우  
- processData: 서버로 보내는 값에 대한 형태 설정여부(기본데이터를 원하는 경우 false로 설정)  
- timeout: 서버요청시 응답 대기 시간(ms단위)

1. 버튼 클릭시 get방식으로 서버에 데이터 전송 및 응답
jsp에서 jQuery로 통신하는 방법
```jsp
	입력: <input type="text" id="input1">
	<button id="btn">전송</button>
	<br>
	응답: <label id="output1">현재 응답 없음</label>
	
	<script>
		$(function(){
			$("#btn").click(function(){
				//기존 동기식 통신
				//location.href ='경로'
				//location.href='jqAjax1.do?input='+$("#input1").val();
				
				//비동기 통신
				$.ajax({
					url:"jqAjax1.do",
					data:{
						input:$("#input1").val()
					},
					type:"get",
					success: function(result){
						console.log("ajax통신 성공");
						console.log(result);
						$("#output1").html(result);
					},
					error: function(){
						console.log("ajax통신 실패");
					},
					complete: function(){
						console.log("성공 실패 여부에 상관없이 실행됨");
					}
				});
			});
		});
	</script>
```
servlet에서 데이터 정제과정
```java
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("input");
		
		//사용자에게 보여줄 응답 데이터
		String responseData = "입된값: "+ str + ",길이: " + str.length();
		
		//getWriter : jsp와의 통신 통로 열어주기
		//응답데이터에 한글이 포함되었다면 설정해주기
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(responseData);
	}
```

2. 버튼 킬릭시 post방식으로 서버에 데이터 전송 및 응답  
servlet에서 데이터 정제과정   
```java
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
```

3. 서버로 데이터 전송 후 조회된 객체로 응답 받기  
servlet에서 데이터 정제과정  
```java
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
```

4. 객체 여러개 응답 받기  
servlet에서 데이터 정제과정  
```java
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터베이스에서 회원 목록을 조회해왔다는 가정하기
		ArrayList<Member> list = new ArrayList<>();
		list.add(new Member(3,"김둘리",20,"남자"));
		list.add(new Member(5,"도우너",40,"남자"));
		list.add(new Member(11,"최또치",15,"여자"));
		
		response.setContentType("json/application; charset=UTF-8");
		
		new Gson().toJson(list,response.getWriter());
	}
```

---
## jspProject
### Attachment 처리 방법
용량이 크기 때문에 doPost()방식으로 처리를 한다.  
보통 첨부파일을 저장할때 이름을 바꿔서 저장을 하기에 renamePolicy를 따로 두어 사용한다. 

**JSP**  
form 태그안에 enctype="multipart/form-data"를 기입하여 첨부파일을 첨부할 수 있도록 해준다.
```jsp
		<form action="<%=contextPath %>/insert.ph" method="post" id="enroll-form" enctype="multipart/form-data">
			<!-- 파일 첨부 영역 -->
			<div id="file-area" align="center">
				<input type="file" id="file1" name="file1" onchange="loadImg(this,1);" required> <!-- 대표이미지라서 필수입력사항 -->
				<input type="file" id="file2" name="file2" onchange="loadImg(this,2);">
				<input type="file" id="file3" name="file3" onchange="loadImg(this,3);">
				<input type="file" id="file4" name="file4" onchange="loadImg(this,4);">
			</div>
			<br><br>
			
			<div align="center">
				<button type="submit">작성하기</button>
			</div>	
		</form>
```
**Servlet**  
```java
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			//전송용량 제한
			int maxSize = 10 * 1024 *1024;
			
			//저장할 물리적인 경로 알아내기
			String savePath = request.getSession().getServletContext().getRealPath("resources/photoBoard_files/");
			
			//전달된파일명 수저작업 객체 포함시켜 업로드 작업
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//DB에 저장해야할 데이터 추출하기
			Board b = new Board();
			b.setBoardWriter(multiRequest.getParameter("userNo"));
			b.setBoardTitle(multiRequest.getParameter("title"));
			b.setBoardContent(multiRequest.getParameter("content"));
			
			//Attachment에 들어가야할 데이터도 추출하기
			//여러개의 첨부파일이 있을수 있으니 list에 담아서 가져가기
			//대표이미지는 필수 입력사항이니 최소 1개는 담기게 된다
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=4; i++) {
				String key = "file"+i;
				
				//첨부파일이 있다면 첨부파일 객체 생성 및 데이터 담기
				if(multiRequest.getOriginalFileName(key)!=null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/photoBoard_files/");
					
					//대표이미지와 상세이미지를 구분할 file_level 컬럼값 세팅하기
					if(i==1) { //대표이미지(file1을 키값으로 가진)
						at.setFileLevel(1);
					}else {//상세이미지(대표이미지가 아닌경우)
						at.setFileLevel(2);
					}
					list.add(at);
				}
			}
			int result = new BoardService().insertPhotoBoard(b,list);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "사진게시글 작성 성공");
				response.sendRedirect(request.getContextPath()+"/list.ph");
			}else {
				request.setAttribute("errorMsg", "사진게시글 작성 실패");
				request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
				
			}
		}
	}
```
**NamePolicy**  
사진 이름을 업로드되는 시점 시간에 맞춰서 설정되도록 지정해준다.
```java
public class MyFileRenamePolicy implements FileRenamePolicy{
	
	//파일명 변경 메서드 재정의하기
	//기존의 파일명을 전달받아 수정작업후 해당 파일명을 반환해주는 메서드
	
	@Override
	public File rename(File originFile) {
		
		//원본 파일명("hello.jpg")
		String originName = originFile.getName();
		
		//수정파일명 : 파일업로드된 시간(년월일시분초) + 5자리 랜덤값
		//확장자 : 그대로
		//hello.jpg -> 2023040615463012443.jpg
		
		//1.파일 업로드 시간(년월일시분초) - String currentTime
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//2.랜덤 숫자 5자리
		int ranNum = (int)(Math.random()*90000) + 10000;
		
		//3.원본파일 확장자명 추출
		//파일명에서 가장 마지막 . 기준으로 확장자 추출
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime+ranNum+ext;
		//원본 파일을 파일명 변경하여 전달
		return new File(originFile.getParent(), changeName);
	}
	
}
```
