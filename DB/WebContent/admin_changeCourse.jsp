<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>수강신청</title>

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

<form action="searchCourse.jsp" method="post" target="courseif">
	<select name="sel_major" style="height: 45px; width: 150px;">
		<option value="c_name">과목이름</option>
		<option value="c_major">전공</option>
		<option value="c_id">과목번호</option>
		<option value="c_prof">교수</option>
	</select>

	<input type="text" name="msearch" style="width: 500px; height: 40px" >
	<input type="submit" value="검색" name="courseif" style="height: 45px; width: 100px; background-color: #00a6de; color: #fff;">
</form>	
	<p>
	<iframe src="showCourse.jsp" name="courseif" width="1200px" height="500px" style="background-color: #fff;"></iframe>
	<p>
	<input type="submit" value="새로운 강의등록" onclick="window.open('insertCourse_main.jsp', '', 'width=500, height=400')" style="height: 45px; width: 120px; background-color: #00a6de; color: #fff;">
	<input type = "submit" value ="제한인원변경" onclick="window.open('changeCourse_main.jsp', '', 'width=500, height=300')" style="height: 45px; width: 120px; background-color: #00a6de; color: #fff;">
	<input type = "submit" value ="폐강하기" onclick="window.open('shutCourse.jsp', '', 'width=500, height=250')" style="height: 45px; width: 120px; background-color: #00a6de; color: #fff;">
</center>
</div>


</body>
</html>