<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%@ include file="../admin_subMenu.jsp" %>

<script src="admin/js/admin_voc.js"></script>

<article>
	<h2>고객의 소리 관리</h2>
	
	<form name="frm" method="post">
		<table class="table_list">
			<tr>
				<th style="width: 8%;">번호</th>
				<th style="width: 25%;">제목</th>
				<th style="width: 10%;">작성자</th>
				<th style="width: 14%;">작성일</th>
				<th style="width: 8%;">답변 여부</th>
				<th style="width: 15%;"></th>
			</tr>
			
			<c:forEach items="${VocList}" var="vocDto">
				<tr>
					<td> 
						${vocDto.num}
					</td>
					<td style="text-align: left;">
						<a href="museum.do?command=vocDetail&num=${vocDto.num}">${vocDto.title}</a>
					</td>
					<td>
						${vocDto.member_id}
					</td>
					<td>
						<fmt:formatDate value="${vocDto.writedate}" type="date"/>
					</td>
					<td>
						<c:choose>
							<c:when test="${vocDto.reply_yn=='0' }">
								<span style="color: red;">미답변</span>
							</c:when>
							<c:when test="${vocDto.reply_yn=='1' }">답변</c:when>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${vocDto.reply_yn=='0' }">
								<input type="button" class="btn_table" name="" value="답변" onClick="location.href='museum.do?command=vocDetail&num=' + ${vocDto.num}">
							</c:when>
							<c:when test="${vocDto.reply_yn=='1' }">
								<input type="button" class="btn_table" name="" value="수정" onClick="location.href='museum.do?command=vocDetail&num=' + ${vocDto.num}">
							</c:when>
						</c:choose>
						<input type="button" class="btn_table" name="" value="삭제" onClick="go_voc_admin_delete(${vocDto.num})">
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
		<jsp:param name="command" value="museum.do?command=adminVocList" />
	</jsp:include>
</article>

<%@ include file="../../footer.jsp"%>