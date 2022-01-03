<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%@ include file="../admin_subMenu.jsp" %>

<article>
	<h2>회원 관리</h2>
	
	<table class="table_list">
		<tr>
			<th style="width: 10%;">아이디</th>
			<th style="width: 10%;">이름</th>
			<th style="width: 20%;">이메일</th>
			<th style="width: 15%;">핸드폰</th>
			<th style="width: 10%;">회원/관리자</th>
			<th style="width: 15%;"></th>
		</tr>
		
		<c:forEach items="${memberList}" var="memberDto">
			<tr>
				<td>
					${memberDto.id}
				</td>
				<td>
					${memberDto.name}
				</td>
				<td>
					${memberDto.email}
				</td>
				<td>
					${memberDto.phone}
				</td>
				<td>
					<c:choose>
						<c:when test="${memberDto.admin_yn=='0' }">회원</c:when>
						<c:when test="${memberDto.admin_yn=='1' }">관리자</c:when>
					</c:choose>
				</td>
				<td>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<jsp:include page="/paging/paging.jsp">
		<jsp:param name="page" value="${paging.page}" />
		<jsp:param name="beginPage" value="${paging.beginPage}" />
		<jsp:param name="endPage" value="${paging.endPage}" />
		<jsp:param name="prev" value="${paging.prev}" />
		<jsp:param name="next" value="${paging.next}" />
		<jsp:param name="command" value="museum.do?command=adminMemberList" />
	</jsp:include>
</article>

<%@ include file="../../footer.jsp"%>