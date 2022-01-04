<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<%@ include file="../mypage/mypage_subMenu.jsp" %>

<article>
	<h2>회원 정보 수정</h2>
	<form method="post" name="signupForm">
	<input type="hidden" name="admin_yn" value="${member.admin_yn}">
	<table class="table_form">
		<tr>
			<th>성명</th>
			<td><input type="text" name="name" value="${loginUser.name}" readonly></td> 
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" value="${loginUser.id}" readonly></td>
		</tr>
		<tr>
		    <th>비밀번호</th>
		    <td><input type="password" name="pwd"></td>
		</tr>
		<tr>
		    <th>비밀번호 확인</th>
		    <td><input type="password" name="pwdCheck"></td>    
		</tr>
		<tr> 
		    <th>이메일</th>
		    <td><input type="text"  name="email" value="${member.email}"></td>
		</tr>
		<tr>
		    <th>전화번호</th>
		    <td><input type="text"  name="phone" value="${member.phone}"></td>
		</tr>
	</table>
	    
	    <div class="clear"></div>
		<div id="buttons">
			<input type="submit" value="수정" class="btn" onclick="go_update_member();"> 
			<input type="reset" value="취소" class="btn" onClick="location.href='myPageForm?id=${MemberDto.id}'">
		</div>
	
	</form>
</article>
<%@ include file="../footer.jsp"%>