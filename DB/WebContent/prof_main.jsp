<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>������û</title>

<link href="main_ss.css" rel="stylesheet" type="text/css">
</head>
<body>

<%! // DB ����
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
		<li><a href="prof_main.jsp" id=mo>�����л�����</a></li>
		<li><a href="prof_checkCourse.jsp" id=mo>��������Ȯ��</a></li>
		<li><a href="http://ecyber.catholic.ac.kr/" id=mo target="_blank">���̹�ķ�۽�</a></li>
		<li><a href="https://portal.catholic.ac.kr/wps/portal" target="_blank" id=mo>Ʈ����Ƽ</a></li>
	</ul>
</div>

<div class="profile">
	<div class="top_p">
		<img src="img/profile.png"><p>
		
		<H3>
			<%
				String userName = (String)session.getAttribute("userName");
				out.print(userName + " ������"); 
				session.setAttribute("userStatus", "prof");
			%>
		</H3>
			<%
				String userMajor = (String)session.getAttribute("userMajor");
				out.print(userMajor);
			%>
		<p><font size= "2">
		
		<a href="logout.jsp" id=m_info>[�α׾ƿ�]</a>
		
		<a href=javascript:void(0) onclick="window.open('updatePW_main.jsp', '' , 'width=500, heiht=250')" id=m_info>[��й�ȣ ����]</a>

		
		</font><hr/>


	</div>
	
</div>

<div class="content">
<center>
<form action="searchStudent.jsp" method="post" target="studentif">
	<select name="sel_student" style="height: 45px; width: 150px;">
		<option value="s_name">�л��̸�</option>
		<option value="s_major">����</option>
		<option value="s_year">�г�</option>
	</select>

	<input type="text" name="ssearch" style="width: 500px; height: 40px">
	<input type="submit" value="�˻�" name="studentif" style="height: 45px; width: 100px; background-color: #00a6de; color: #fff;">
</form>	

	<p>
	<iframe src="showStudent.jsp" name="studentif" width="1200px" height="550px" style="background-color: #fff;"></iframe>
	<p>
	</center>
</div>


</body>
</html>