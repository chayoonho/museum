<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="css/findIdPw.css" rel="stylesheet">

</head>
<body>
	<center>
		<table width="400">
			<tr height="200">
				<td width="230">
					<h3>아이디 찾기</h3><br>
					<input type="button" class="submit" value="이동" onClick="location.href='museum.do?command=findIdForm'">
				</td>
				<td width="230">
					<h3>비밀번호 찾기</h3><br>
					<input type="button"  class="submit" value="이동" onClick="location.href='museum.do?command=findPwForm'">
				</td>
			</tr>
		</table>
	</center>
</body>
</html>