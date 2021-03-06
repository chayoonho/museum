<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="/script/program.js"></script>
<link rel="stylesheet" type="text/css" href="/css/program.css">

<article>
	<h2 class="subTitle">프로그램 안내</h2>
	<form name="frm">
		<table class="table_program">
		
			<!-- 검색 -->
			<div class="search-container">
					<input type="text" placeholder="프로그램명" name="key" value="${key}" class="input_search">
					<input type="image" src="img/icons8-search-30.png" class="img_search" onclick="search_program()">
			</div>
			
			<c:forEach items="${programList}" var="programDto">
				<tr>
					<td rowspan="6" style="width: 330px"><a
						href="programDetail?num=${programDto.num}"> <img
							src="/img/${programDto.img}" width="300px;" height="200px;"
							onerror="this.src='img/img_noImage.jpg'">
					</a></td>
				</tr>
				<tr>
					<td class="table_title"><a
						href="programDetail?num=${programDto.num}">${programDto.title}</a>
					</td>
					<td rowspan="6"
						style="width: 10%; text-align: center; font-weight: bold"><c:choose>
							<c:when test='${programDto.status=="진행중"}'>
								<span style="color: blue; font-weight: bold;">${programDto.status}</span>
							</c:when>
							<c:when test='${programDto.status=="접수중"}'>
								<span style="color: blue; font-weight: bold;">${programDto.status}</span>
							</c:when>
							<c:when test='${programDto.status=="접수마감"}'>
								<span style="color: red; font-weight: bold;">${programDto.status}</span>
							</c:when>
							<c:otherwise>${programDto.status}</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td><strong>교육장소</strong>&nbsp;&nbsp;${programDto.place}<br>
					</td>
				</tr>
				<tr>
					<td><strong>교육대상</strong>&nbsp;&nbsp;${programDto.target}<br>
					</td>
				</tr>
				<tr>
					<td><strong>기간</strong>&nbsp;&nbsp;${programDto.startdate} -
						${programDto.enddate}<br></td>
				</tr>
				<tr>
					<td style="height: 16px"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<br> <br>
	<!--페이징-->
	<jsp:include page="../include/paging/paging.jsp">
		<jsp:param name="page" value="${paging.page}" />
		<jsp:param name="beginPage" value="${paging.beginPage}" />
		<jsp:param name="endPage" value="${paging.endPage}" />
		<jsp:param name="prev" value="${paging.prev}" />
		<jsp:param name="next" value="${paging.next}" />
		<jsp:param name="command" value="programList" />
	</jsp:include>
</article>

<%@ include file="../footer.jsp"%>