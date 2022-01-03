<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<article>
	<form method="post" name="signupForm" >
		<input type="hidden" name="command"  value="signup">
		<h2>회원 정보 상세 입력 ( * 는 필수 입력사항입니다.)</h2>
		<hr>
		<br>
		<div id="view">
			<label>* 성명</label>&nbsp;&nbsp;<input type="text"  name="name"><br> 
		    <label>* 아이디</label>&nbsp;&nbsp;<input type="text" name="id" size="12"><input type="hidden" name="reid">
		    &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="중복 체크"  onclick="idcheck()"><br>
		    <label>* 비밀번호</label>&nbsp;&nbsp;<input type="password" name="pwd"><br> 
		    <label>* 비밀번호 확인</label>&nbsp;&nbsp;<input type="password" name="pwdCheck"><br> 
		    <label>* 이메일</label>&nbsp;&nbsp;<input type="text"  name="email"><br>
		    <label>* 전화번호</label>&nbsp;&nbsp;<input type="text"  name="phone"><br>
			<input type="hidden" name="admin_yn" value="0">
		</div>	
			
		<div class="clear"></div>
		<div id="buttons">
		    <input type="button" value="회원가입" class="btn" onclick="go_save_signup()"> 
		    <input type="reset" value="취소" class="btn" onclick="location.href='museum.do?command=main'">
		</div>
	</form>
</article>


<%@ include file="../footer.jsp" %>