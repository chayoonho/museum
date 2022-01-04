<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="/script/notice.js"></script>

<article>
	<h2 class="subTitle">공지사항</h2>
	
	
	
			
	<form name="frm" method="post">
	
		<!-- 검색 -->
		<div class="search-container">
			<input type="text" placeholder="제목" name="key" value="${key}" class="input_search">
			<input type="image" src="img/icons8-search-30.png" class="img_search" onclick="search_notice()">
		</div>
		
		<table class="table_list">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList}" var="noticeDto">
					<tr>
						<td>${noticeDto.num}</td>
						<td style="text-align: left;"><a href="noticeDetail?num=${noticeDto.num}">${noticeDto.title}</a></td>
						<td>${noticeDto.member_id}</td>
						<td><fmt:formatDate value="${noticeDto.writedate}" type="date" /></td>
						<td>${noticeDto.readcount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	
	<!--페이징-->
	<jsp:include page="../include/paging/paging.jsp">
		<jsp:param name="page" value="${paging.page}" />
		<jsp:param name="beginPage" value="${paging.beginPage}" />
		<jsp:param name="endPage" value="${paging.endPage}" />
		<jsp:param name="prev" value="${paging.prev}" />
		<jsp:param name="next" value="${paging.next}" />
		<jsp:param name="command" value="noticeList" />
	</jsp:include>
</article>

<%@ include file="../footer.jsp"%>