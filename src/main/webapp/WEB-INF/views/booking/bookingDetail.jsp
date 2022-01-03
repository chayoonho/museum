<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<%@ include file="../mypage/mypage_subMenu.jsp" %>

<article>
	<h2 class="menu_title">프로그램 예약 상세정보</h2>
	<br>
	<h3>프로그램 정보</h3>

	<form name="frmbooking" method="post">
		<input type="hidden" name="num" value="${bookingDto.num}"> 
		<table class="table_view">
			<tr>
				<th>프로그램 번호</th>
				<td>${bookingDto.program_num}</td>
				<th>프로그램명</th>
				<td colspan="3">${programDto.title}</td>
			</tr>
			<tr>
				<th>주제/내용</th>
				<td colspan="5">${programDto.content}
			<tr>
			<tr>
				<th>기간</th>
				<td colspan='5'>${programDto.startdate}- ${programDto.enddate}</td>
			</tr>
			<tr>
				<th>장소</th>
				<td>${programDto.place}</td>
				<th>대상</th>
				<td>${programDto.target}</td>
				<th>참가비</th>
				<td>${programDto.entry_fee}원</td>
			</tr>
			<tr>
				<th>상세설명</th>
				<td colspan="5">${programDto.detail_content}</td>
			</tr>
			<tr>
		</table>
		<br>
		<h3>예약자 정보</h3>
		<table class="table_view">
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
		
		<input class="btn" type="button" value="돌아가기" onClick="go_mov_booking()">
	</form>
</article>

<%@ include file="../footer.jsp"%>