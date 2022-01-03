<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="css/findIdPw.css" rel="stylesheet">
</head>
<body>
	<form method="post" name="frm" action="museum.do">
		<input type="hidden" name="command" value="findPwStep2">
		<table width="400">
			<tr><td><h2>비밀번호 찾기</h2></td><tr>
			<tr align="center" >
				<td width="430">
					<h3>아이디 : ${member_mus.id}</h3>
					<input type="hidden" name="id" value="${member_mus.id}">
				</td>
			</tr>
			<tr align="center">
				<td width="430">
					<h3>성명 : ${member_mus.name}</h3>
					<input type="hidden" name="name" value="${member_mus.name}">
				</td>
			</tr>
			<tr align="center" bgcolor="#FDE8FF" >
				<td width="430">
					<h3>전화번호 : ${member_mus.phone}</h3>
					<input type="hidden" name="phone" value="${member_mus.phone}">
				</td>
			</tr>
			<tr align="center">
				<td width="430">
					<h3>인증번호<input type="text" name="confirmNum"></h3>
					<h4>전송받은 번호를 입력하세요.</h4>
					<br>${msg}
					<br><input type="submit" class="submit" value="인증번호 확인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>