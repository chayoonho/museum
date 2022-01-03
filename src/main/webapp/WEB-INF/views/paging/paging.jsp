<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		body {
			/* text-align: center; */
		}
		
		#paging {
			font-size: 110%;
		}
		
		a {
			text-decoration: none;
			color: black;
		}
	</style>
</head>
<body>
	<div id="paging" align="center">
		<c:url var="action" value="${param.command}" />
		<c:if test="${param.prev}">
			<a href="${action}&page=${param.beginPage-1}">◀</a>&nbsp;
		</c:if>
		<c:forEach begin="${param.beginPage}" end="${param.endPage}" var="index">
			<c:choose>
				<c:when test="${param.page==index}">
					<span style="color: black; font-weight: bold;">${index}&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="${action}&page=${index}">${index}</a>&nbsp;
			</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${param.next}">
			<a href="${action}&page=${param.endPage+1}">▶</a>&nbsp;
		</c:if>
	</div>
</body>
</html>