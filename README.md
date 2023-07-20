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
		10과 3이 일치합니까?: &{big == small} 또는 ${big eq small }<br>
		big에 담긴 값이 10과 일치합니까?: &{big == 10} 또는 ${big eq 10 }<br>
		
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

**JSTL Core Library**  
1. 변수(속성)  
변수 선언(<c:set var="변수명" value="리터럴" scope="스코프영역지정(생략가능)")>)  
-변수를 선언하고 초기값을 대입해두는 기능 제공  
-해당 변수를 어떤 스코프 영역에 담아둘것인지 지정가능하다(생략시 기본값은 pageScope)  
-해당 scope 영역에 setAttribute라는 메소드를 이용하여 key+value를 지정하는 것이라고 생각하면 된다.  
-c:set을 통해 선언된 변수는 EL표기법을 통해 접근 가능하다(스크립팅원소로는 접근 불가)  
		
주의 사항  
-변수의 타입을 변도로 지정하지 않음  
-반드시 해당 변수에 담고자하는 초기값 속성을 세팅해야한다(선언과 동시에 초기화)  
