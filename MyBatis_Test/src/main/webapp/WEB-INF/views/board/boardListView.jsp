​<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">게시글 전체 리스트</h1>
	<table border="1" width="700" align="center">
		<thead>
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="b" items="${ list }">
				<tr>
					<td>${ b.boardNo }</td>
					<td>${ b.boardTitle }</td>
					<td>${ b.boardWriter }</td>
					<td>${ b.count }</td>
					<td>${ b.createDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<div align="center">
		<c:if test="${ pi.currentPage ne 1 }">
			<a href="list.bo?currentPage=${ pi.currentPage - 1 }">[이전]</a>
		</c:if>
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<a href="list.bo?currentPage=${ p }">[${ p }]</a>
		</c:forEach>
		<c:if test="${ pi.currentPage ne pi.maxPage }">
			<a href="list.bo?currentPage=${ pi.currentPage + 1 }">[다음]</a>
		</c:if>
	</div>
</body>
</html>

