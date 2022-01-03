<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<article>
	<h1>티켓나눔터 수정</h1>
	<form name="frm" method="post">
		<input type="hidden" name="num" value="${ShareTicketDto.num}">
		<table class="table_form">
			<tr>
				<th>작성자</th>
				<td style="padding: 0 10px;">${ShareTicketDto.member_id}<input type="hidden" name="member_id" value="${ShareTicketDto.member_id}"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${ShareTicketDto.title}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="8" cols="65">${ShareTicketDto.content}</textarea></td>
			</tr>
			<tr>
				<th>나눔여부</th>
				<c:choose>
					<c:when test="${ShareTicketDto.share_yn=='0'}">
						<td>
							<input type="radio" value="0" name="share_yn" checked="checked">대기중
							<input type="radio" value="1" name="share_yn" >나눔완료
						</td>
					</c:when>
					<c:when test="${ShareTicketDto.share_yn=='1'}">
						<td>
							<input type="radio" value="0" name="share_yn" >대기중
							<input type="radio" value="1" name="share_yn" checked="checked">나눔완료
						</td>
					</c:when>
				</c:choose>
			</tr>
		</table>
		<input class="btn" type="button" value="수정" onClick="go_share_ticket();">           
		<input class="btn" type="button" value="취소" onClick="location.href='museum.do?command=shareTicketDetail&num=${ShareTicketDto.num}'">
	</form>
</article>
<%@ include file="../footer.jsp" %>