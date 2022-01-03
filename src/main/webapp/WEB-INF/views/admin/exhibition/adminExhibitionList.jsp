<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%@ include file="../admin_subMenu.jsp" %>

<article>
	<h2>특별 전시 관리</h2>
	
	<form name="frm" method="post">
		<div class="box_btn">
			<input type="button" class="btn" name="add" value="등록" onClick="location.href='museum.do?command=exhibitionAddForm'">
		</div>
		<table class="table_list">
			<tr>
				<th style="width: 10%;">번호</th>
				<th style="width: 38%;">전시명</th>
				<th style="width: 16%; text-align: left;">전시 장소</th>
				<th style="width: 20%;">전시 기간</th>
				<th style="width: 20%;"></th>
			</tr>
			
			<c:forEach items="${ExhibitionList}" var="exhbnDto">
				<tr>
					<td> 
						${exhbnDto.num}
					</td>
					<td style="text-align: left;">
						<a href="museum.do?command=exhibitionSpecialDetail&num=${exhbnDto.num}">${exhbnDto.title}</a>
					</td>
					<td style="text-align: left;">
						${exhbnDto.place}
					</td>
					<td>
						<fmt:formatDate value="${exhbnDto.startdate}" type="date" dateStyle="short"/>
						~
						<fmt:formatDate value="${exhbnDto.enddate}" type="date" dateStyle="short"/>
					</td>
					<td>
						<input type="button" class="btn_table" name="update" value="수정" onClick="location.href='museum.do?command=exhibitionUpdateForm&num=' + '${exhbnDto.num}'">
						<input type="button" class="btn_table" name="delete" value="삭제" onClick="delete_exhibition('${exhbnDto.num}')">
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
		<jsp:param name="command" value="museum.do?command=adminExhibitionList&kind=4" />
	</jsp:include>
</article>

<%@ include file="../../footer.jsp"%>