<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/exhibition.css">

<article>
	<div class="content_detail">
		<div class="content_img">
			<img src="img/${ExhibitionDto.img}"  onerror="this.src='img/img_noImage.jpg'">
		</div>
		<hr>
		<div class="content_view">
			<div class="content_info">
				<strong>${ExhibitionDto.title}</strong>
				<ul>
					<li>
						<strong>전시명</strong>
						<p>${ExhibitionDto.title}</p>	
					</li>
					<li>
						<strong>전시장소</strong>
						<p>${ExhibitionDto.place}</p>	
					</li>
					<li>
						<strong>전시기간</strong>
						<p>
							<fmt:formatDate value="${ExhibitionDto.startdate}" type="date"/>
							&nbsp;~&nbsp;
							<fmt:formatDate value="${ExhibitionDto.enddate}" type="date"/>
						</p>
					</li>
				</ul>
			</div>
			<div class="content_desc">
				<p>${ExhibitionDto.detail_content}</p>
			</div>
		</div>
	</div>
	<input type="button" id="btnList" value="목록" onClick="location.href ='museum.do?command=exhibitionSpecialList&kind=' + '${kind}'">
</article>


<%@ include file="../footer.jsp"%>