<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<article>
	<h2 class="subTitle">티켓 나눔터</h2>
	<div class="box_btn">
		<input type="button" value="글쓰기" class="btn" onclick="location.href='museum.do?command=ticketWriteForm'">
	</div>
	<form name="frm" method="post">
		<table class="table_list">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>나눔 상태</th>
			</tr>
			<c:forEach items="${ShareTicketList}" var="ShareTicketDto">
				<tr>
					<td>${ShareTicketDto.num}</td>
					<td style="text-align: left;">
						<a href="museum.do?command=shareTicketDetail&num=${ShareTicketDto.num}">${ShareTicketDto.title}</a>
					</td>
					<td>${ShareTicketDto.member_id}</td>
					<td><fmt:formatDate value="${ShareTicketDto.writedate}" type="date" /></td>
					<td>
						<c:choose>
							<c:when test="${ShareTicketDto.share_yn=='0' }">대기중</c:when>
							<c:when test="${ShareTicketDto.share_yn=='1' }">
								<span style="color:red;">나눔완료</span>
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	
	<!--페이징-->
	<jsp:include page="/paging/paging.jsp">
		<jsp:param name="page" value="${paging.page}" />
		<jsp:param name="beginPage" value="${paging.beginPage}" />
		<jsp:param name="endPage" value="${paging.endPage}" />
		<jsp:param name="prev" value="${paging.prev}" />
		<jsp:param name="next" value="${paging.next}" />
		<jsp:param name="command" value="museum.do?command=ticketList" />
	</jsp:include>
</article>

<%@ include file="../footer.jsp"%>