<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck</title>
<link href="css/museum.css" rel="stylesheet"> 
<script src="js/member.js"></script>
</head>
<body>
<div id="wrap" style="margin:20px 0">
<h1>ID 중복확인</h1>
	<form method="post" name="idCheckFrm" action="museum.do">
		<input type="hidden" name="command" value="idCheck">
		아이디 <input type=text name="id" value="${id}">
		<input type="submit" value="검색" class="submit"><br>
	
		<div style="margin-top: 20px">
			<c:if test="${result == 1}">
				<script type="text/javascript">opener.document.signupForm.id.value="";</script>
				${id}는 이미 사용중인 아이디입니다.
			</c:if>
			<c:if test="${result == -1}">
				${id}는 사용 가능한 ID입니다.    
				<input type="button" value="사용" class="cancel" onclick="idok('${id}');">
			</c:if>
		</div>
	</form>
</div>
</body>
</html>