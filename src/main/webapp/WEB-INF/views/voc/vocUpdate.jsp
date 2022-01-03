<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<article>
	<h1 class="menu_title">고객의 소리 수정</h1>
	<form name="frm" method="post">
		<input type="hidden" name="num" value="${VocDto.num}">
		<table class="table_form">
			<tr>
				<th>작성자</th>
				<td style="padding: 0 10px;">${VocDto.member_id}<input type="hidden" name="member_id" value="${VocDto.member_id}"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="title" value="${VocDto.title}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="8" cols="65">${VocDto.content}</textarea></td>
			</tr>
		</table>
		<input type="button" class="btn" value="수정" onClick="go_voc_update();">           
		<input type="button" class="btn" value="취소" onClick="location.href='museum.do?command=vocList'">
	</form>
</article>
<%@ include file="../footer.jsp" %>