<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<article>
	<h1>로그인</h1>
	<br>
	<form method="post" action="museum.do" name="loginFrm">
		<input type="hidden" name="command" value="login">
		<input type="hidden" name="prev" value="${prev}">
		
		<fieldset>
			<label>아이디</label>&nbsp;&nbsp;<input name="id" type="text"><br> 
	        <label>비밀번호</label>&nbsp;&nbsp;<input name="pwd" type="password"><br>
		</fieldset>
		    <div id="buttons">
	            <input type="submit" class="btn" value="로그인" onclick="return loginCheck()">
	            <input type="button" class="btn" value="회원가입" onclick="location.href='museum.do?command=agreement'">
	            <input type="button" class="btn" value="아이디/비밀번호 찾기" onclick="find_id()">     
	        </div>
	        <br>
	        <div>${message}</div>
	</form>
</article>

<%@ include file="../footer.jsp" %>