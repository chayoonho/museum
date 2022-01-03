<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/relic.css">

<article>
	<div class="content_detail">
		<div class="content_img">
			<img src="${relicList[0].imgUri}">
		</div>
		<hr>
		<div class="content_view">
			<div class="content_info">
				<strong>${relicList[0].nameKr}</strong>
				<ul>
					<li>
						<strong>국적/시대</strong>
						<p>${relicList[0].nationalityName1}</p>	
					</li>
					<li>
						<strong>재질</strong>
						<p>${relicList[0].materialName1}</p>	
					</li>
					<li>
						<strong>분류</strong>
						<p>${relicList[0].purposeName1} - ${relicList[0].purposeName2} - ${relicList[0].purposeName3} - ${relicList[0].purposeName4}</p>	
					</li>
					<li>
						<strong>소장품 번호</strong>
						<p>${relicList[0].indexWord}</p>	
						<%-- <p>${relicList[0].museumName3}&nbsp;${relicList[0].relicNo}</p> --%>	
					</li>
				</ul>
			</div>
			<div class="content_desc">
				<p>${relicList[0].desc}</p>
			</div>
		</div>
	</div>
</article>

<%@ include file="../footer.jsp"%>