<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
table {
	background-color : #f4f7ff;
	border-spacing: 0px 0px;
	font-family: '����';
	font-size: 15px;
	cellpadding: 10px;
	
}
</style>

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
				Class.forName(driver);
				Connection conn = DriverManager.getConnection(url, id, pass);
				Statement stmt = conn.createStatement();
				
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

<h3>
<%
	out.print(userName + " �л��� ������û����");
%>
</h3>

<table border="1" width="1150px" height = 100%>
		<tr style="background-color: #8ea5f9;">
			<th>��      ��</th>
			<th>��û��������</th>
			<th>��������</th>
			<th>����������</th>
		</tr>		
<%
	String studentSQL = "select * from student where sid = '" + userID + "'";
	ResultSet strs = stmt.executeQuery(studentSQL);
	
	String courseSQL = "select * from enroll where sid = '" + userID + "'";
	ResultSet crs = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE).executeQuery(courseSQL);
	
	crs.last();
	int courseCount = 0;
	courseCount = crs.getRow();
	
	while(strs.next()){
		
		String syear=strs.getString("syear");
		String slimit=strs.getString("slimit");
		String sgrade=strs.getString("sgrade");
%>
	<tr>
		<th><%=syear %></th>
		<th><%=slimit %></th>
		<th><%=sgrade %></th>
		<th><%=courseCount %></th>
	</tr>
<%	
	}
%>
	</table>


<h3>
<%
	out.print(userName + " �л��� ������û����");
%>
</h3>
<p>

<table border="1" width="1150px" height = 100%>
		<tr style="background-color: #8ea5f9;">
			<th>�����ȣ</th>
			<th>�����̸�</th>
			<th>��米��</th>
			<th>�ش��г�</th>
			<th>��      ��</th>
			<th>��      ��</th>
			<th>��  ��  ��</th>
			<th>�����к�</th>
			<th>�����ο�</th>
			<th>�����ο�</th>	
		</tr>

<%
				String selectSQL = "select * from course where cid in (select cid from enroll where sid = '" + userID +"')";
				ResultSet rss = stmt.executeQuery(selectSQL);
				
				while(rss.next()){
					
		        	String cid=rss.getString("cid");
		        	String cname=rss.getString("cname");
		        	
		        	String cprof ="a";
		        	
		        	String profSQL = "select pname from prof where pid = (select cprof from course where cid = '" + cid + "')";
		        	ResultSet rs_tmp = conn.createStatement().executeQuery(profSQL);
		        	
		        	while(rs_tmp.next()){
		        		cprof = rs_tmp.getString("pname");
		        	}
		        	
		        	String cyear=rss.getString("cyear");
		        	String ctime=rss.getString("ctime");
		        	String croom=rss.getString("croom");
		          	String cmajor=rss.getString("cmajor");
		          	String cmember=rss.getString("cmember");
		          	String climit=rss.getString("climit");
		          	String cgrade=rss.getString("cgrade");
		          
%>
	         <tr>
	            
			    <th><%=cid %></th>
			    <th><%=cname %></th>
			    <th><%=cprof %></th>
			    <th><%=cyear %></th>
			    <th><%=cgrade %></th>
			    <th><%=ctime %></th>
			    <th><%=croom %></th>
			    <th><%=cmajor %></th>
			    <th><%=cmember %></th>
			    <th><%=climit %></th>
			   			    
			 </tr>
<%
				}
		stmt.close();
		conn.close();
%>
	</table>



</center>
</div>
</body>
</html>