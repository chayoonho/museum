<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<%@ include file="../mypage/mypage_subMenu.jsp" %>

<article>
	<h2>회원 탈퇴</h2>
	<form method="post" name="signupForm" action="memberDeleteForm">

	<fieldset>
		<legend><h2>정말 회원 탈퇴를 진행하시겠습니까?</h2></legend>
			회원 탈퇴시 게시글 수정이 불가합니다<br>
	    <label>비밀번호</label><input type="password" name="pwd"><br> 
	    <label>비밀번호확인</label><input type="password" name="pwdCheck"><br> 
	   
	    <div class="clear"></div>
		<div id="buttons">
			<input type="submit" value="탈퇴" class="submit" onclick="go_delete_member()"> 
			<input type="reset" value="취소" class="cancel">
		</div>
	</fieldset>
	</form>
</article>

<%@ include file="../footer.jsp" %>
