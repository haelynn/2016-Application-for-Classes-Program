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
<%
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, id, pass);
	Statement stmt = conn.createStatement();
%>

<div class="top">
	<div class="smallleft">
		<div class="logo">
			<img src="img/logo.png">
		</div>
	</div>
	<ul>
		<li><a href="student_main.jsp" id=mo>������û</a></li>
		<li><a href="student_check.jsp" id=mo>����Ȯ��</a></li>
		<li><a href="http://ecyber.catholic.ac.kr/" target="_blank" id=mo>���̹�ķ�۽�</a></li>
		<li><a href="https://portal.catholic.ac.kr/wps/portal" target="_blank" id=mo>Ʈ����Ƽ</a></li>
	</ul>
</div>

<div class="profile">
	<div class="top_p">
		<img src="img/profile.png"><p>
		
		<H3>
			<%
				String userName = (String)session.getAttribute("userName");
				out.print(userName); 

				session.setAttribute("userStatus", "student");
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
		<p><strong>�������� ����</strong>
		<p>
			<%
			
				String userID = (String)session.getAttribute("userID");
				
				String mySQL = "select * from prof where pid = (select sprof from student where sid = '" 
				+ userID + "')";
				
				ResultSet rs = stmt.executeQuery(mySQL);
								
				while(rs.next()){
					out.write(rs.getString("pname") + " ����<br><br>");
					out.write(rs.getString("pmajor") + "�Ҽ�");
				}
			%>

	</div>
	
</div>

<div class="content">
<center>
<form action="searchCourse.jsp" method="post" target="courseif">
	<select name="sel_major" style="height: 45px; width: 150px;">
		<option value="c_name">�����̸�</option>
		<option value="c_major">����</option>
		<option value="c_id">�����ȣ</option>
		<option value="c_prof">����</option>
	</select>

	<input type="text" name="msearch" style="width: 500px; height: 40px" >
	<input type="submit" value="�˻�" name="courseif" style="height: 45px; width: 100px; background-color: #00a6de; color: #fff;">
</form>	

	<p>
	<iframe src="showCourse.jsp" name="courseif" width="1200px" height="300px" style="background-color: #fff;"></iframe>
	<p>
	</center>

<form action="enrollCourse.jsp" method="post" target="enrollif"	>
	&nbsp;&nbsp;&nbsp;&nbsp;��û���� ��ȣ : <input type="text" name="cid" style="width: 200px; height: 25px">	
	<input type="submit" name="enrollif" value="��û" style="height: 30px; width: 60px; background-color: #00a6de; color: #fff;">
</form>
	<center>
	<p>
	<iframe src="enrollCourse.jsp" width = "1200px" height="230px"  style="background-color: #fff;" name="enrollif" >
	</iframe>
	</center>

</div>
</body>
</html>