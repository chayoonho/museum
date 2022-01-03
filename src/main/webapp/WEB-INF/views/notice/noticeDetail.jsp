<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<article>
	<h1 class="menu_title">공지사항</h1>
	<form method="post" name="frm">
		<table class="table_detail">
			<tr>
				<th class="table_title" colspan="3">${noticeDto.title}</th>
			</tr>
			<tr class="tr_underline">
				<td>작성일&nbsp;&nbsp;&nbsp;
					<fmt:formatDate value="${noticeDto.writedate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate>
				</td>
				<td>작성자&nbsp;&nbsp;&nbsp;${noticeDto.member_id}</td>
				<td>조회수&nbsp;&nbsp;&nbsp;${noticeDto.readcount}</td>
			</tr>
			<tr>
				<td colspan="3"><label>${noticeDto.content}</label></td>
			</tr>
		</table>
		<input type="button" value="목록으로" class="btn" onClick="location.href ='museum.do?command=noticeList'"> 
	</form>
</article>

<div class="clear"></div>
<%@ include file="../footer.jsp"%>
