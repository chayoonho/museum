<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%@ include file="../admin_subMenu.jsp" %>

<article>
	<br>
	<h2>특별 전시 수정</h2>
	<form name="frm" method="post" action="museum.do">
		<input type="hidden" name="command" value="exhibitionUpdate">
		<input type="hidden" name="num" value="${exhbnDto.num}">
		<table class="table_form">
			<tr>
				<th>전시명</th>
				<td><input type="text" name="title" value="${exhbnDto.title}"></td>
			</tr>
			<tr>
				<th>전시 장소</th>
				<td><input type="text" name="place" value="${exhbnDto.place}"></td>
			</tr>
			<tr>
				<th>전시 시작일</th>
				<td><input type="date" name="startdate" value="${exhbnDto.startdate}"></td>
			</tr>
			<tr>
				<th>전시 종료일</th>
				<td><input type="date" name="enddate" value="${exhbnDto.enddate}"></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="img" accept="image.*"></td>
			</tr>
			<tr>
				<th>상세 내용</th>
				<td><textarea name="detail_content" rows="8" cols="65">${exhbnDto.detail_content}</textarea></td>
			</tr>
		</table>
		<input class="btn" type="button" value="수정" onClick="update_exhibition('${exhbnDto.num}')">
		<input class="btn" type="button" value="취소" onClick="location.href='museum.do?command=adminExhibitionList'">
	</form>
</article>

<%@ include file="../../footer.jsp"%>