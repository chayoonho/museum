<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<%@ include file="../mypage/mypage_subMenu.jsp" %>
<script src="/script/booking.js"></script>	

<article>
	<h2 class="menu_title">프로그램 예약 변경 확인</h2>
	<br>
	<h3>예약변경이 완료되었습니다. 변경된 사항을 확인해주세요!</h3>
	<h4><span style="color:red;">프로그램 번호를 클릭하면 프로그램 상세 내용으로 이동합니다.</span></h4>
	<form name="frmbooking" method="post">
		<input type="hidden" name="num" value="${bookingDto.num}"> 
		<%-- <input type="hidden" name="program_num" value="${bookingDto.program_num}"> --%>
			
		<table class="table_view">
			<tr>
				<th>프로그램 번호</th>
				<td><a href="programDetail&num=${bookingDto.program_num}">
				${bookingDto.program_num}</a></td>
			</tr>
			<tr>
				<th>예약자 아이디</th>
				<td>${bookingDto.member_id}</td>
				<th>신청자 이름</th>
				<td>${bookingDto.name}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${bookingDto.phone}</td>
				<th>이메일</th>
				<td>${bookingDto.email}</td>
			</tr>
		</table>
		
		<c:choose>
			<c:when test="${loginUser.admin_yn=='0'}">
				<input class="btn" type="button" value="돌아가기" onClick="location.href='bookingList'">
			</c:when>
			<c:when test="${loginUser.admin_yn=='1'}">
				<input class="btn" type="button" value="돌아가기" onClick="location.href='adminBookingList'">
			</c:when>
		</c:choose>
	</form>
</article>

<%@ include file="../footer.jsp"%>