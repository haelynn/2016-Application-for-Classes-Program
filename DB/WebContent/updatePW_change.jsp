<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

html, body{
	font-family: '고딕';
	overflow: hidden;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사용자비밀번호변경</title>
</head>
<body>
<center>
	<hr/>
	<h2>비밀번호 변경</h2>
	<form action="updatePW_newpw.jsp" method="post">
  	새비밀번호 : <input type = "password" name = "npw" > <br>
         새비밀번호 확인 : <input type = "password" name = "npw2" > <br><br>
    <input type = "submit" value ="확  인" style="height: 30px; width: 100px; background-color: #00a6de; color: #fff;">    
     </form>
     <br><hr/>
</center>
</body>
</html>