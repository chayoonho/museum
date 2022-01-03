<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%@ include file="../admin_subMenu.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		var strStatus = '${programDto.status}';
		$('#select_status').val(strStatus);
	});
</script>


<article>
	<h2>프로그램 수정</h2>
	
	<form name="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${programDto.num}">
		<table class="table_form">
			<tr>
				<th>접수현황</th>
				<td>
					<select id="select_status" name="status">
						<option value="">선택</option>
						<option value="접수중">접수중</option>
						<option value="접수마감">접수마감</option>
						<option value="접수예정">접수예정</option>
						<option value="진행중">진행중</option>
					</select>
				</td>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="title" maxlength="100" value="${programDto.title}">
				</td>
			</tr>
			<tr>
				<th>주제/내용<br>(100자 이내)</th>
				<td colspan="5">
					<input type="text" name="content" maxlength="100" value="${programDto.content}">
				</td>
			</tr>
			<tr>
				<th>시작일</th>
				<td>
					<input type="date" name="startdate" value="${programDto.startdate}">
				</td>
				
				<th>종료일</th>
				<td colspan="3">
					<input type="date" name="enddate" value="${programDto.enddate}">
				</td>
			</tr>
			<tr>
				<th>장소</th>
				<td>
					<input type="text" name="place" value="${programDto.place}">
				</td>	
				<th>대상</th>
				<td>
					<input type="text" name="target" value="${programDto.target}">
				</td>	
				<th>참가비</th>
				<td>
					<input type="text" name="entry_fee" class="input_text" value="${programDto.entry_fee}">원
				</td>
			</tr>
			<tr>
				<th>상세설명</th>
				<td colspan="5">
					<textarea name="detail_content" rows="8" cols="70" >${programDto.detail_content}</textarea>
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td colspan="5">
					<input type="file" name="img" value="${programDto.img}"></td>
				</tr>	
		</table>
		
		<input class="btn" type="button" value="수정" onClick="go_update_save_program()">
		<input class="btn" type="button" value="취소" onClick="location.href='museum.do?command=adminProgramList'">			
	</form>
</article>

<%@ include file="../../footer.jsp"%>