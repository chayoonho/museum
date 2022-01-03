<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/relic.css">

<script src="js/relic.js"></script>

<article>
	<h2 class="subTitle">소장품 검색</h2>
	
	<!-- 검색 -->
	<div class="search-container">
	  <form name="frm" method="post">
	  	<input type="hidden" id="category" value="1">
	    <input type="text" placeholder="소장품명" name="search" class="input_search">
	    <input type="image" src="img/icons8-search-30.png" class="img_search" onclick="search_relic()">
	  </form>
	</div>
	
	<div class="content" style="">
		<p class="list_total_count">
			총 <span id="totalCount">${relicList[0].totalCount}</span> 건이 검색되었습니다.
		</p>
		<div class="card-wrap">
			<ul id="card1">
				<c:forEach items="${relicList}" var="relicDto">
					<li class="card">
						<a href="museum.do?command=collectionDetail&id=${relicDto.id}">
							<img src="${relicDto.imgThumUriL}" alt="${relicDto.nameKr} 대표이미지">
						</a>
						<div class="txt">
							<a href="museum.do?command=collectionDetail&id=${relicDto.id}">${relicDto.nameKr}</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<br>
	<br>
</article>
<!--페이징-->
<jsp:include page="/paging/paging.jsp">
	<jsp:param name="page" value="${paging.page}" />
	<jsp:param name="beginPage" value="${paging.beginPage}" />
	<jsp:param name="endPage" value="${paging.endPage}" />
	<jsp:param name="prev" value="${paging.prev}" />
	<jsp:param name="next" value="${paging.next}" />
	<jsp:param name="command" value="museum.do?command=collectionList" />
</jsp:include>

<%@ include file="../footer.jsp"%>