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
	<table width="400">
		<tr align="center" height="200">
			<td width="230">
				<h3>비밀번호 재설정이 완료되었습니다</h3><br>
				<input type="button" class="submit" value="로그인 페이지로 " onClick="move_login();">
			</td>
		</tr>
	</table>
</body>
</html>