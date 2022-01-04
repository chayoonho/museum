<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<%@ include file="mypage_subMenu.jsp" %>

<article>
	<br>
	<h2>회원 정보</h2>
	<form method="post" action="mypageInfo" name="mypageFrm">
		<table class="table_view">
			<tr>
				<th>성명</th>
				<td>${loginUser.name}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${loginUser.id}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${loginUser.email}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${loginUser.phone}</td>
			</tr>
		</table>
		
		<div class="btn_box">
			<input type="button" class="btn" value="회원정보 수정" class="cancel" onclick="location.href='memberEditForm'">
			<input type="button" class="btn" value="회원탈퇴" class="cancle" onclick="location.href='memberDeleteForm'">
		</div>
		<div class="clear"></div>
	</form>
</article>

<%@ include file="../footer.jsp"%>