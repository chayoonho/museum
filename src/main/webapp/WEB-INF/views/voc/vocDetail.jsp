<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<article>
	<div id="vocDetail">
		<h3 class="menu_title">고객의 소리에 귀 기울이겠습니다</h3><br>
		
		<form method="post" name="frm">
			<input type="hidden" name="num" value="${VocDto.num}">
			<table class="table_detail">
				<tr>
					<td class="table_title" colspan="2">${VocDto.title}</td>
				</tr>
				<tr class="tr_underline">
					<td>작성자&nbsp;&nbsp;&nbsp;${VocDto.member_id}</td>					
				</tr>
				<tr>
					<td colspan="2">${VocDto.content}</td>
				</tr>
			</table>

			<div class="clear"></div>
			<div id="buttons">
				<input type="button" value="돌아가기" class="btn" onclick="location.href='museum.do?command=vocList'">
				<c:if test='${loginUser.id == VocDto.member_id || loginUser.admin_yn == "1"}'>
					<c:if test='${loginUser.admin_yn=="0"}'>
						<input type="button" value="수정" class="btn" onclick="location.href='museum.do?command=vocUpdateForm&num=${VocDto.num}'">
					</c:if>
					<input type="button" value="삭제" class="btn" onclick="go_voc_delete(${VocDto.num})">
				</c:if>
			</div>
		</form>
		
		<form action="museum.do" method="post" name="frm2">
			<input type="hidden" name="command" value="replyVoc">
			<input type="hidden" name="voc_reply" value="${num}">
			<input type="hidden" name="num" value="${VocDto.num}">
			<table class="table_list">
				<tr><th>작성자</th><th>내용</th><th></th></tr>
				
				<c:if test="${loginUser.admin_yn=='1'}">
					<tr>
						<td width="100">
							<input type="hidden" name="userid" value="${loginUser.id}">${loginUser.id}
						</td>
						<td width="670"><input type="text" name="reply" size="80"></td>
						<td width="100">
								<input type="submit" class="btn_table" value="등록" onclick="return go_voc_reply();">
						</td>
					</tr> 
				</c:if>
				
				<c:if test="${VocDto.reply_yn=='1'}">
					<tr>
						<td width="100">admin</td>
						<td width="670">${VocDto.reply}</td>
						<td width="100"></td>
					</tr> 
				</c:if>
			</table>
		</form>
	</div>
</article>

<%@ include file="../footer.jsp"%>
