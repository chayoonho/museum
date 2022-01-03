<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="css/findIdPw.css" rel="stylesheet">
	<script type="text/javascript">
		function move_login(){
			opener.location.href='museum.do?command=loginForm';
			self.close();
		}
	</script>
</head>
<body>
	<form method="post" name="frm" action="museum.do">
		<table width="400">
			<tr><td><h2>조회 결과</h2></td><tr>
			<tr align="center">
				<td width="430">	
					<h3>성명 : ${member_mus.name}</h3>
				</td>
			</tr>
			<tr align="center">
				<td width="430">	
					<h3>전화번호 : ${member_mus.phone}</h3>
				</td>
			</tr>
			<tr align="center">
				<td width="430">
					<h3>조회한 회원의 아이디는 ${member_mus.id} 입니다</h3>
					<input type="button" class="submit" value="로그인 창으로" onClick="move_login();">
					<input type="button" class="submit" value="비밀번호찾기" onClick="location.href='museum.do?command=findPwForm&id=${member_mus.id}'" >
				</td>
			</tr>
		</table>
	</form>
</body>
</html>