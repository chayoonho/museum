<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<article>
	<div id="shareTicketDetail">
		<h3 class="menu_title">해당 게시판은 금전 거래를 금지합니다</h3><br>
		<form method="post" name="frm">
			<input type="hidden" name="num" value="${ShareTicketDto.num}">
			<table class="table_detail">
				<tr>
				</tr>
				<tr>
					<td class="table_title" colspan="2">${ShareTicketDto.title}</td>
				</tr>
				<tr class="tr_underline">
					<td>작성자&nbsp;&nbsp;&nbsp;${ShareTicketDto.member_id}</td>
					<td>
						나눔여부&nbsp;&nbsp;&nbsp;
						<c:choose>
							<c:when test="${ShareTicketDto.share_yn == '0'}"><td>대기중</td></c:when>
							<c:otherwise>
								<td><span style="color: red;">나눔완료</span></td>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="2">${ShareTicketDto.content}</td>
				</tr>
			</table>

			<div class="clear"></div>
			<div id="buttons">			
				<input type="button" value="목록" class="btn" onclick="location.href ='museum.do?command=ticketList'">									
				<c:if test="${loginUser.id == ShareTicketDto.member_id || loginUser.admin_yn=='1'}">
					<c:if test='${loginUser.admin_yn=="0"}'>
						<input type="button" value="수정" class="btn" onclick="location.href='museum.do?command=ticketUpdateForm&num=${ShareTicketDto.num}'">	
					</c:if>
					<input type="button" value="삭제" class="btn" onclick="go_delete_ticket(${ShareTicketDto.num})">	
				</c:if>						
			</div>
		</form>
		
		<form action="museum.do" method="post" name="frm2">
			<input type="hidden" name="command" value="replyWrite">
			<input type="hidden" name="ticket_num" value="${num}">
			<input type="hidden" name="num" value="${num}">
			<table class="table_list">
				<tr><th>작성자</th><th>작성일시</th><th>내용</th><th></th></tr>
				<tr align="center">
					<td width="100">
						<input type="hidden" name="userid" value="${loginUser.id}">${loginUser.id}
					</td>
					<td width="100"><fmt:formatDate value="${now}"	pattern="MM/dd HH:mm"></fmt:formatDate></td>
					<td width="670"><input type="text" name="content" size="80"></td>
					<td width="100"><input type="submit" value="등록" class="btn_table" onclick="return go_reply_submit();"></td>
				</tr> <!-- 작성자, 날짜시간, 작성란, 버튼 -->
				
				<c:forEach var="replyTicket" items="${ReplyTicketDto}">
					<tr align="center">
						<input type="hidden" name="replyTicketNum" value="${replyTicket.num }">	
						<td>
							<input type="hidden" name="member_id" value="${replyTicket.member_id}">${replyTicket.member_id}
						</td>
						<td><fmt:formatDate value="${replyTicket.writedate}" pattern="MM/dd HH:mm"></fmt:formatDate></td>
						<td align="left">${replyTicket.content}</td>
						<td>
							<c:if test="${replyTicket.member_id == loginUser.id || loginUser.admin_yn == '1'}">
								<input type="button" class="btn_table" value="삭제" onclick="go_reply_delete(${replyTicket.num}, ${num});">
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
	</div>
</article>

<%@ include file="../footer.jsp"%>
