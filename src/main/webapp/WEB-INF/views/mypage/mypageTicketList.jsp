<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<%@ include file="mypage_subMenu.jsp" %>

<article>
	<h2>내가 작성한 글 - 티켓 나눔터</h2>
	<form method="post" action="museum.do" name="mypageFrm">
		<table class="table_list">
			<tr>
				<th style="width: 10%;">번호</th>
				<th style="width: 30%;">제목</th>
				<th style="width: 20%;">작성자</th>
				<th style="width: 20%;">작성일</th>
			</tr>
			<c:forEach items="${ShareTicketList}" var="ShareTicketDto">
				<tr>
					<td>
						<a href="museum.do?command=shareTicketDetail&num=${ShareTicketDto.num}">${ShareTicketDto.num}</a>
					</td>
					<td>
						<a href="museum.do?command=shareTicketDetail&num=${ShareTicketDto.num}">${ShareTicketDto.title}</a>
					</td>
					<td>
						${ShareTicketDto.member_id}
					</td>
					<td>
						<fmt:formatDate value="${ShareTicketDto.writedate}" type="date"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	
	<div class="box_btn">
		<input type="button" class="btn" name="add" value="글쓰기" onclick="location.href='museum.do?command=ticketWriteForm'">
	</div>
	
	<jsp:include page="/paging/paging.jsp">
		<jsp:param name="page" value="${paging.page}" />
		<jsp:param name="beginPage" value="${paging.beginPage}" />
		<jsp:param name="endPage" value="${paging.endPage}" />
		<jsp:param name="prev" value="${paging.prev}" />
		<jsp:param name="next" value="${paging.next}" />
		<jsp:param name="command" value="museum.do?command=mypageTicketList" />
	</jsp:include>
</article>

<%@ include file="../footer.jsp"%>