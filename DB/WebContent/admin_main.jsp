<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>수강신청</title>
<style>
table {
	background-color : #f4f7ff;
	border-spacing: 0px 0px;
	font-family: '돋움';
	font-size: 15px;
	cellpadding: 10px;
	
}
</style>

<link href="main_ss.css" rel="stylesheet" type="text/css">
</head>
<body>

<%! // DB 연동
	String driver="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@203.229.204.89:1521:orcl";
	String id = "db156";
	String pass = "db156";
%>

<div class="top">
	<div class="smallleft">
		<div class="logo">
			<img src="img/logo.png">
		</div>
	</div>
	<ul>
		<li><a href="admin_main.jsp" id=mo>학생등록</a></li>
		<li><a href="admin_studentInfo.jsp" id=mo>학생정보</a></li>
		<li><a href="admin_prof.jsp" id=mo>교수정보</a></li>
		<li><a href="admin_changeCourse.jsp" id=mo>강의등록</a></li>
		<li><a href="http://ecyber.catholic.ac.kr/" id=mo target="_blank">사이버캠퍼스</a></li>
		<li><a href="https://portal.catholic.ac.kr/wps/portal" target="_blank" id=mo>트리니티</a></li>
	</ul>
</div>

<div class="profile">
	<div class="top_p">
		<img src="img/profile.png"><p>
		
		<H3>
			<%
				String userName = (String)session.getAttribute("userName");
				out.print(userName);
				session.setAttribute("userStatus", "admin");
			%>
		</H3>
			<%
				String userJob = (String)session.getAttribute("userJob");
				out.print(userJob + "  소속");
			%>
		<p><font size= "2">
		
		<a href="logout.jsp" id=m_info>[로그아웃]</a>
		
		<a href=javascript:void(0) onclick="window.open('updatePW_main.jsp', '' , 'width=500, heiht=250')" id=m_info>[비밀번호 변경]</a>

		
		</font><hr/>

	</div>
	
</div>

<div class="content">
<center>
<h2>새로운 학생 계정 등록</h2>
<form action="requestTest.jsp" method="post">

	<table border="1" width="450px" height = "200px">
		<tr>
			<th style="background-color: #8ea5f9;">학    번</th>
			<th><input type="text" placeholder="학번을 입력하세요" name = "sid" style="width: 90%; background-color:transparent; border: 0;"></th>
		</tr>
		<tr>
			<th style="background-color: #8ea5f9;">이   름</th>
			<th><input type = "text" placeholder="이름을 입력하세요" name = "sname" style="width: 90%; background-color:transparent; border: 0;"></th>
		</tr>
		<tr>
			<th style="background-color: #8ea5f9;">전   공</th>
			<th><input type = "text" name = "smajor" placeholder="전공을 입력하세요" style="width: 90%; background-color:transparent; border: 0;"></th>
		</tr>
		<tr>
			<th style="background-color: #8ea5f9;">학   년</th>
			<th>
				<input type = "radio" name = "syear" value = "1" checked> 1학년&nbsp;
		         <input type = "radio" name = "syear" value = "2" checked> 2학년&nbsp;
		         <input type = "radio" name = "syear" value = "3" checked> 3학년&nbsp;
		         <input type = "radio" name = "syear" value = "4" checked> 4학년<br>
			</th>
		</tr>
		<tr>
			<th style="background-color: #8ea5f9;">지도교수</th>
			<th><input type = "text" name = "sprof" placeholder="지도교수를 입력하세요" style="width: 90%; background-color:transparent; border: 0;"></th>
		</tr>
	</table>
         <br><input type = "submit" value ="입력완료"  style="height: 40px; width: 100px; background-color: #00a6de; color: #fff;">
</form>
</center>
</div>


</body>
</html>