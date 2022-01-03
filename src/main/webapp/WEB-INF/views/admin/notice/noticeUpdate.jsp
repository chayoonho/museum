<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%@ include file="../admin_subMenu.jsp" %>

<article>
	<h2>공지사항 수정</h2>
	
	<form name="frm" method="post">
		<input type="hidden" name="num" value="${noticeDto.num}">
		<table class="table_form">
			<tr>
				<th>작성자</th>
				<th>${noticeDto.member_id}</th>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="title" size="60" size="47" maxlength="100" value="${noticeDto.title}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5"><textarea name="content" rows="8" cols="65">${noticeDto.content}</textarea></td>
			</tr>
		</table>
		<input class="btn" type="button" value="수정" onClick="go_update_save_notice();">           
		<input class="btn" type="button" value="취소" onClick="location.href='museum.do?command=adminNoticeList'">
	</form>
</article>

<%@ include file="../../footer.jsp"%>