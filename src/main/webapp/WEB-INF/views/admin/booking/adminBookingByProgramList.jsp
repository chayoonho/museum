<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<script src="js/admin_booking.js"></script>
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%@ include file="../admin_subMenu.jsp" %>

<article>
	<h2>프로그램별 신청자 관리</h2>
	
	<form name="frm" method="post">
		<div class="box_btn">
		</div>
		<table class="table_list">
			<tr>
				<th style="width: 5%;">번호</th>
				<th style="width: 17%;">프로그램명</th>
				<th style="width: 8%;">예약자</th>
				<th style="width: 10%;">전화번호</th>
				<th style="width: 15%;">이메일</th>
				<th style="width: 10%;"></th>
			</tr>
			
			<c:forEach items="${bookingList}" var="bookingDto">
				<tr>
					<td> 
						${bookingDto.num}
					</td>
					<td style="text-align: left;">
						<a href="museum.do?command=bookingDetail&num=${bookingDto.num}">${bookingDto.program_num}</a>
					</td>
					<td>
						${bookingDto.member_id}
					</td>
					<td>
						${bookingDto.phone}
					</td>
					<td>
						${bookingDto.email}
					</td>
					<td>
						<input type="button" class="btn_table" name="update" value="변경" onclick="go_update_booking('${bookingDto.num}');">
						<input type="button" class="btn_table" name="delete" value="취소" onclick="go_cancel_booking('${bookingDto.num}');">
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
		<jsp:param name="command" value="museum.do?command=adminBookingList" />
	</jsp:include>
</article>

<%@ include file="../../footer.jsp"%>