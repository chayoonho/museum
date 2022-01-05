<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<%@ include file="../mypage/mypage_subMenu.jsp" %>
<script src="/script/booking.js"></script>

<article>
	<h2 class="menu_title">프로그램 예약 수정</h2>
	<br>
	<h3>프로그램 정보</h3>
	<form name="frmbooking" method="post" >
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
				<td colspan='5'>${programDto.startdate} - ${programDto.enddate}</td>
			</tr>
			<tr>
				<th>장소</th>
				<td>${programDto.place}</td>
				<th>대상</th>
				<td>${programDto.target}</td>
				<th>참가비</th>
				<td>${programDto.entry_fee} 원</td>
			</tr>
			<tr>
				<th>상세설명</th>
				<td colspan="5">${programDto.detail_content}</td>
			</tr>
			<tr>
		</table>
		<br>
		<h3>예약자 정보</h3>
		<input type="hidden" name="num" value="${bookingDto.num}">
		<input type="hidden" name="program_num" value="${bookingDto.program_num}">
		
		<span style="color: red; font-weight: bold;">*</span> 표시는 필수 입력사항입니다.
		<input type="hidden" name="member_id" value="${bookingDto.member_id}">		
		<table class="table_form">
			<tr>
				<th>예약자 아이디(예약번호)</th>
				<td style="padding: 0 10px;">${bookingDto.member_id}&nbsp;(${bookingDto.num})</td>
				
				<th>신청자 이름 <span style="color: red; font-weight: bold;">*</span></th>
				<td><input type="text" name="name" value="${bookingDto.name}"></td>
			</tr>
			<tr>
				<th>전화번호 <span style="color: red; font-weight: bold;">*</span></th>
				<td><input type="text" name="phone" value="${bookingDto.phone}"></td>
				<th>이메일</th>
				<td><input type="email" name="email" value="${bookingDto.email}"></td>
			</tr>
			<tr>
				<th>개인 정보 수집 동의여부 <span style="color: red; font-weight: bold;">*</span></th>
				<td colspan="3">
					<input type="radio" name="personal_info_yn" value="0" checked="checked">동의안함 
					<input type="radio"	name="personal_info_yn" value="1" >동의함
				</td>
			</tr>
			
		</table>
		
		<input class="btn" type="button" value="변경하기" onClick="go_update_save_booking()"> 
		<input class="btn" type="reset" value="초기화" onClick="reset()">
		<input class="btn" type="button" value="돌아가기" onClick="go_mov_booking()">
	</form>
</article>
<%@ include file="../footer.jsp"%>
