<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<%@ include file="mypage_subMenu.jsp" %>

<article>
	<h2>내가 작성한 글 - 고객의 소리</h2>
	<form method="post" action="museum.do" name="mypageFrm">
		<table class="table_list">
			<tr>
				<th style="width: 10%;">번호</th>
				<th style="width: 35%;">제목</th>
				<th style="width: 10%;">작성자</th>
				<th style="width: 15%;">작성일</th>
				<th style="width: 10%;">답변 유무</th>
			</tr>
			<c:forEach items="${vocList}" var="vocDto">
				<tr>
					<td>
						<a href="museum.do?command=vocDetail&num=${vocDto.num}">${vocDto.num}</a>
					</td>
					<td>
						<a href="museum.do?command=vocDetail&num=${vocDto.num}">${vocDto.title}</a>
					</td>
					<td>
						${vocDto.member_id}
					</td>
					<td>
						<fmt:formatDate value="${vocDto.writedate}" type="date"/>
					</td>
					<td>
						<c:choose>
							<c:when test="${vocDto.reply_yn=='0' }">미답변</c:when>
							<c:when test="${vocDto.reply_yn=='1' }">답변</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	
	<div class="box_btn">
		<input type="button" class="btn" name="add" value="글쓰기" onclick="location.href='museum.do?command=vocWriteForm'">
	</div>
	
	<jsp:include page="/paging/paging.jsp">
		<jsp:param name="page" value="${paging.page}" />
		<jsp:param name="beginPage" value="${paging.beginPage}" />
		<jsp:param name="endPage" value="${paging.endPage}" />
		<jsp:param name="prev" value="${paging.prev}" />
		<jsp:param name="next" value="${paging.next}" />
		<jsp:param name="command" value="museum.do?command=mypageVocList" />
	</jsp:include>
</article>

<%@ include file="../footer.jsp"%>