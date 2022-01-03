<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="css/findIdPw.css" rel="stylesheet">
</head>
<body>
	<form method="post" name="frm" action="museum.do">
		<input type="hidden" name="command" value="findIdStep1">
		<table width="400">
		<tr><td><h2>아이디 찾기</h2></td><tr>
			<tr align="center" bgcolor="#FDE8FF" >
				<td width="430">
					<h3>성명<input type="text" class="insert" name="name" value="${member_mus.name}"></h3>
				</td>
			</tr>
			<tr align="center" bgcolor="#FDE8FF" >	
				<td width="430">
					<h3>전화번호 <input type="text" class="insert" name="phone"  value="${member_mus.phone}"></h3>
				</td>
			</tr>
			<tr align="center" bgcolor="#FDE8FF" >
				<td width="430">
					<h3><input type="submit" class="insert" value="인증번호 전송"></h3>${msg}
				</td>
			</tr>
		</table>
	</form>
</body>
</html>