<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<%@ include file="mypage_subMenu.jsp" %>
<script src="/script/booking.js"></script>
<article>
	<h2>나의 예약</h2>
	<form name="frm" method="post">
		<table class="table_list">
			<tr>
				<th>예약번호</th>
				<th>프로그램 번호</th>
				<th>예약자</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>예약 변경</th>
			</tr>
			<c:forEach items="${bookingList}" var="bookingDto">
				<tr>
					<td>
						<a href="bookingDetail?num=${bookingDto.num}">${bookingDto.num}
							<input type="hidden" name="program_num" value="${bookingDto.program_num}">
						</a>
					</td>
					<td>
						<a href="programDetail?num=${bookingDto.program_num}">${bookingDto.program_num}</a>
					</td>	
					<td>${bookingDto.name}</td>
					<td>${bookingDto.phone}</td>
					<td>${bookingDto.email}</td>
					<td>
						<input type="button" class="btn_table" value="예약 변경" onClick="go_update_booking(${bookingDto.num})">
						<input type="button" class="btn_table" value="예약 취소" onClick="go_cancel_booking(${bookingDto.num})">
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<br>
	<br>
<%-- 	<!--페이징-->
	<jsp:include page="../include/paging/paging.jsp">
		<jsp:param name="page" value="${paging.page}" />
		<jsp:param name="beginPage" value="${paging.beginPage}" />
		<jsp:param name="endPage" value="${paging.endPage}" />
		<jsp:param name="prev" value="${paging.prev}" />
		<jsp:param name="next" value="${paging.next}" />
		<jsp:param name="command" value="bookingList" />
	</jsp:include> --%>
</article>

<%@ include file="../footer.jsp"%>