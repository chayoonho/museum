<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%@ include file="../admin_subMenu.jsp" %>

<article>
	<h2>공지사항 관리</h2>
	
	<form name="frm" method="post">
		<div class="box_btn">
			<input type="button" class="btn" name="add" value="등록" onclick="location.href='museum.do?command=noticeWriteForm'">
		</div>
		<table class="table_list">
			<tr>
				<th style="width: 8%;">번호</th>
				<th style="width: 25%;">제목</th>
				<th style="width: 10%;">작성자</th>
				<th style="width: 14%;">작성일</th>
				<th style="width: 8%;">조회수</th>
				<th style="width: 15%;"></th>
			</tr>
			
			<c:forEach items="${noticeList}" var="noticeDto">
				<tr>
					<td> 
						${noticeDto.num}
					</td>
					<td style="text-align: left;">
						<a href="museum.do?command=noticeDetail&num=${noticeDto.num}">${noticeDto.title}</a>
					</td>
					<td>
						${noticeDto.member_id}
					</td>
					<td>
						<fmt:formatDate value="${noticeDto.writedate}" type="date"/>
					</td>
					<td>
						${noticeDto.readcount}
					</td>
					<td>
						<input type="button" class="btn_table" name="update" value="수정"  onclick="go_update_notice('${noticeDto.num}')">
						<input type="button" class="btn_table" name="delete" value="삭제" onclick="go_delete_notice('${noticeDto.num}')">
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
		<jsp:param name="command" value="museum.do?command=adminNoticeList" />
	</jsp:include>
</article>

<%@ include file="../../footer.jsp"%>