<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<article>
	<h2 class="subTitle">고객의 소리</h2>
	<div class="box_btn">
		<input type="button" value="글쓰기" class="btn" onclick="location.href='museum.do?command=vocWriteForm'">
	</div>
	<form name="frm" method="post">
		<table class="table_list">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>답변 유무</th>
				<c:forEach items="${VocList}" var="VocDto">
					<tr>
						<td>${VocDto.num}</td>
						<td style="text-align: left;">
							<a href="museum.do?command=vocDetail&num=${VocDto.num}">${VocDto.title}</a>
						</td>
						<td style="text-align: left;">${VocDto.content}</td>
						<td><fmt:formatDate value="${VocDto.writedate}" type="date" /></td>
						<td>
							<c:choose>
								<c:when test="${VocDto.reply_yn=='0' }">미답변</c:when>
								<c:when test="${VocDto.reply_yn=='1' }">답변</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tr>
		</table>
	</form>
	
	<!--페이징-->
	<jsp:include page="/paging/paging.jsp">
		<jsp:param name="page" value="${paging.page}" />
		<jsp:param name="beginPage" value="${paging.beginPage}" />
		<jsp:param name="endPage" value="${paging.endPage}" />
		<jsp:param name="prev" value="${paging.prev}" />
		<jsp:param name="next" value="${paging.next}" />
		<jsp:param name="command" value="museum.do?command=vocList" />
	</jsp:include>
	
</article>

<%@ include file="../footer.jsp"%>