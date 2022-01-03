<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<article>
	<c:if test="${empty loginUser}">
		<jsp:forward page='museum.do?command=loginForm&prev=vocWrite'/>
	</c:if>
	<h2>고객의 소리 글 등록</h2>
	<form name="vocWrite" method="post" action="museum.do?" >
		<input type="hidden" name="command" value="vocWrite">
		<table class="table_form">
			<tr>
				<th>작성자</th>
				<td style="padding: 0 10px;">${loginUser.id}
					<input type="hidden" name="member_id" value="${loginUser.id}">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="70" rows="15" name="content"></textarea></td>
			</tr>
		</table>
		<input type="submit" class="btn" value="등록" onclick="return go_save_voc()"> 
		<input type="button" class="btn" value="취소" onclick="location.href='museum.do?command=vocList'">
	</form>	
</article>
<%@ include file="../footer.jsp"%>