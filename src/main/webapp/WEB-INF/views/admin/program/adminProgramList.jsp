<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%@ include file="../admin_subMenu.jsp" %>

<article>
	<h2>프로그램 관리</h2>
	
	<form name="frm" method="post">
		<div class="box_btn">
			<input type="button" class="btn" name="add" value="등록" onclick="location.href='museum.do?command=programWriteForm'">
			<input type="button" class="btn" name="view_all" value="전체 신청자 현황" onclick="view_booking_all_member()">
		</div>
		<table class="table_list">
			<tr>
				<th style="width: 5%;">번호</th>
				<th style="width: 7%;">현황</th>
				<th style="width: 19%;">프로그램명</th>
				<th style="width: 7%;">장소</th>
				<th style="width: 7%;">대상</th>
				<th style="width: 15%;">기간</th>
				<th style="width: 10%;"></th>
			</tr>
			
			<c:forEach items="${programList}" var="programDto">
				<tr>
					<td> 
						${programDto.num}
					</td>
					<td>
						${programDto.status}
					</td>
					<td style="text-align: left;">
						<a href="museum.do?command=programDetail&num=${programDto.num}">${programDto.title}</a>
					</td>
					<td>
						${programDto.place}
					</td>
					<td>
						${programDto.target}
					</td>
					<td style="text-align: center;">
						<fmt:formatDate value="${programDto.startdate}" type="date" dateStyle="short"/>
						~
						<fmt:formatDate value="${programDto.enddate}" type="date" dateStyle="short"/>
					</td>
					<td>
						<input type="button" class="btn_table" name="view" value="   신청자 현황   " onclick="view_booking_member('${programDto.num}')"><br>
						<input type="button" class="btn_table" name="update" value="수정" onclick="go_update_program('${programDto.num}');">
						<input type="button" class="btn_table" name="delete" value="삭제" onclick="go_delete_program('${programDto.num}');">
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
		<jsp:param name="command" value="museum.do?command=adminProgramList" />
	</jsp:include>
</article>

<%@ include file="../../footer.jsp"%>