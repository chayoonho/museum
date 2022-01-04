<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/exhibition.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="script/exhibition.js"></script>

<article>
	<h2 class="subTitle">특별 전시</h2>
	<input type="hidden" id="inputKind" name="inputKind" value="${kind}" />
	<%@ include file="exhibition_subMenu.jsp" %>
	
	
	<!-- 검색 -->
	<div class="search-container">
	  <!-- <form action="">
	    <input type="text" placeholder="Search.." name="search">
	  </form> -->
	</div>
	
	<div class="content" style="">
		<div class="card-wrap">
			<ul id="card1">
				<c:forEach items="${ExhibitionList}" var="exhibitionDto">
					<li class="card">
						<a href="exhibitionSpecialDetail?kind=${kind}&num=${exhibitionDto.num}">
							<img src="img/${exhibitionDto.img}" onerror="this.src='img/img_noImage.jpg'">
						</a>
						<div class="exhbnInfo">
							<div class="exhbntitle">
								<a href="exhibitionSpecialDetail?kind=${kind}&num=${exhibitionDto.num}">${exhibitionDto.title}</a>
							</div>
							<ul>
								<li>
									<strong>기간</strong>
									<p>
										<fmt:formatDate value="${exhibitionDto.startdate}" type="date"/>
										&nbsp;~&nbsp;
										<fmt:formatDate value="${exhibitionDto.enddate}" type="date"/>
									</p>
								</li>
								<li>
									<strong>장소</strong>
									<p>${exhibitionDto.place}</p>
								</li>
							</ul>
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
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="page" value="${paging.page}" />
	<jsp:param name="beginPage" value="${paging.beginPage}" />
	<jsp:param name="endPage" value="${paging.endPage}" />
	<jsp:param name="prev" value="${paging.prev}" />
	<jsp:param name="next" value="${paging.next}" />
	<jsp:param name="command" value="exhibitionSpecialList?kind='${kind}'" />
</jsp:include>

<%@ include file="../footer.jsp"%>