<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%@ include file="../admin_subMenu.jsp" %>

<script src="admin/js/admin_ticket.js"></script>

<article>
	<h2>티켓 나눔터 관리</h2>
	
	<form name="frm" method="post">
		<table class="table_list">
			<tr>
				<th style="width: 8%;">번호</th>
				<th style="width: 25%;">제목</th>
				<th style="width: 10%;">작성자</th>
				<th style="width: 14%;">작성일</th>
				<th style="width: 8%;">나눔 상태</th>
				<th style="width: 15%;"></th>
			</tr>
			
			<c:forEach items="${ShareTicketList}" var="ShareTicketDto">
				<tr>
					<td> 
						${ShareTicketDto.num}
					</td>
					<td style="text-align: left;">
						<a href="museum.do?command=shareTicketDetail&num=${ShareTicketDto.num}">${ShareTicketDto.title}</a>
					</td>
					<td>
						${ShareTicketDto.member_id}
					</td>
					<td>
						<fmt:formatDate value="${ShareTicketDto.writedate}" type="date"/>
					</td>
					<td>
						<c:choose>
							<c:when test="${ShareTicketDto.share_yn=='0' }">대기중</c:when>
							<c:when test="${ShareTicketDto.share_yn=='1' }">
								<span style="color:red;">나눔완료</span>
							</c:when>
						</c:choose>
					</td>
					<td>
						<input type="button" class="btn_table" name="" value="삭제" onClick="go_delete_admin_ticket(${ShareTicketDto.num})">
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	
	<jsp:include page="/paging/paging.jsp">
		<jsp:param name="page" value="${paging.page}" />
		<jsp:param name="beginPage" value="${paging.beginPage}" />
		<jsp:param name="endPage" value="${paging.endPage}" />
		<jsp:param name="prev" value="${paging.prev}" />
		<jsp:param name="next" value="${paging.next}" />
		<jsp:param name="command" value="museum.do?command=adminVocList" />
	</jsp:include>
</article>

<%@ include file="../../footer.jsp"%>