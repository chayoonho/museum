<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/program.css">

<article>
	<h1 class="menu_title">프로그램 정보</h1>
	<form name="frm">
		<div class="content_detail">
			<div class="content_img">
				<img src="img/${programDto.img}"  style="width: 90%;" onerror="this.src='/img/img_noImage.jpg'">
			</div>
			<hr style="border: 1px solid black;">
			<div class="content_view">
				<div class="content_info">
					<ul>
						<li>
							<p class="status">${programDto.status}</p>
						</li>
						<li>
							<p class="title">${programDto.title}</p>
						</li>
						<li>
							<strong>주제/내용</strong>
							<p><pre>${programDto.content}</pre></p>
						</li>
						<li>
							<strong>기간</strong>
							<p>
								<fmt:formatDate value="${programDto.startdate}" type="date" />
								&nbsp;~&nbsp;
								<fmt:formatDate value="${programDto.enddate}" type="date" />
							</p>
						</li>
						<li>
							<strong>장소</strong>
							<p>${programDto.place}</p>
						</li>
						<li>
							<strong>대상</strong>
							<p>${programDto.target}</p>
						</li>
						<li>
							<strong>참가비</strong>
							<p>${programDto.entry_fee} 원</p>
						</li>
					</ul>
				</div>
				<hr style="border: 1px solid black;">
				<div class="content_desc">
					<p>${programDto.detail_content}</p>
				</div>
			</div>
		</div> 

		<div class="clear"></div>
		<div class="box_btn">
			<c:if test='${loginUser.admin_yn=="0"}'>
				<input type="button" value="예약하기" class="btn" onclick="go_booking(${programDto.num});">
			</c:if>
			<input type="button" value="목록" class="btn" onclick="location.href='programList'">
		</div>
	</form>
</article>

<%@ include file="../footer.jsp"%>
